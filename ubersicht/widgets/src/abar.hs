{-# LANGUAGE TupleSections #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE OverloadedStrings #-}

module Main where

import Control.Monad

import Data.Aeson as JSON
import Data.Aeson.TH
import qualified Data.Text as T
import Data.Map (Map)
import qualified Data.Map.Strict as M
import Data.String.Conv
import Text.Read
import Shelly

data HdInfo = HdInfo {
    hd_total :: Int
 ,  hd_available :: Int
}

deriveToJSON defaultOptions { fieldLabelModifier = drop 3 } ''HdInfo

type DesktopId = Int

type MonitorId = Int

type Window = T.Text

data Desktop = Desktop [Window]

deriveToJSON defaultOptions ''Desktop

type Desktops = Map DesktopId Desktop

-- | Mimicks the structure of OSX's mission control.
data MissionControl = MissionControl (Map MonitorId Desktops)

instance ToJSON MissionControl where
    toJSON (MissionControl mc) = toJSON mc

data Abar = Abar {
    abar_cpu :: Double
  , abar_memory :: Double
  , abar_hd :: HdInfo
  , abar_current_monitor :: Int
  , abar_current_desktop :: Int
  , abar_date :: T.Text
  , abar_current_app :: T.Text
  , abar_mission_control :: MissionControl
}

deriveToJSON defaultOptions { fieldLabelModifier = drop 5 } ''Abar

cpu :: Sh Double
cpu = do
  read . T.unpack . T.strip <$> 
    run "ps" ["-axC", "-o", "%cpu", "|", "awk", "'{s+=$1} END {print s}'"]

memory :: Sh Double
memory = do
  read . T.unpack . T.strip <$> 
    run "ps" ["-A", "-o", "%mem", "|", "awk", "'{s+=$1} END {print \"\" s}'"]

hd :: Sh HdInfo
hd = do
  rawOut <- map T.strip . T.words <$>
    run "df" ["-H", "|", "grep", "disk1"
             , "|", "head", "-n", "1"
             ]
  return $ HdInfo (read . T.unpack . T.init . (!! 1) $ rawOut) 
                  (read . T.unpack . T.init . (!! 3) $ rawOut)

currentMonitor :: Sh Int
currentMonitor =
    read . T.unpack . T.strip <$> run "/usr/local/bin/chunkc" ["tiling:query", "-m", "id"]

currentDesktop :: Sh Int
currentDesktop =
  read . T.unpack . T.strip <$> run "/usr/local/bin/chunkc" ["tiling:query", "-d", "id"]

date :: Sh T.Text
date = T.strip <$> run "date" []

currentApp :: Sh T.Text
currentApp = 
  T.strip 
    <$> run "/usr/bin/osascript" [
          "-e"
        , "'tell application \"System Events\"'"
        , "-e"
        , "'set frontApp to name of first application process whose frontmost is true'"
        , "-e"
        , "'end tell'"
        ]

monitorCount :: Sh Int
monitorCount = do
  read . T.unpack . T.strip <$> run "/usr/local/bin/chunkc" ["tiling:query", "--monitor", "count"]

windowsFor :: DesktopId -> Sh [Window]
windowsFor desktopId = 
  map toWindow . T.lines <$> 
    run "/usr/local/bin/chunkc" ["tiling:query", "--windows-for-desktop", T.pack (show desktopId)]
  where
      toWindow :: T.Text -> Window
      toWindow = id -- Do something more interesting in the future.

missionControl :: Sh MissionControl
missionControl = do
    monCount <- monitorCount
    desktops <- forM [1..monCount] $ \monitorId -> do
        deskIds <- map (read . T.unpack . T.strip) . T.words <$>
                     run "/usr/local/bin/chunkc" ["tiling:query", "-D", T.pack (show monitorId)]
        desktops <- forM deskIds $ \desktopId -> do
            wins <- windowsFor desktopId
            return (desktopId, Desktop wins)
        return (monitorId, M.fromList desktops)
    return $ MissionControl (M.fromList desktops)

getAbarStats :: IO Abar
getAbarStats = shelly $ silently $ escaping False $ do
    Abar <$> cpu
         <*> memory
         <*> hd
         <*> currentMonitor
         <*> currentDesktop
         <*> date
         <*> currentApp
         <*> missionControl

main :: IO ()
main = do
    abar <- getAbarStats
    putStrLn . toS . JSON.encode $ abar
