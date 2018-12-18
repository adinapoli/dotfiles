import { css, styled } from "uebersicht"

export const command = "./dist/abar"

export const refreshFrequency = 3000

export const render = ({ output }) => {
    var abar = JSON.parse(output);
    return (
        <div className={stats}>

          <div className={leftPanel}>
              <div className={leftGroup}>
                <i className="fas fa-desktop">&nbsp;</i>
                <Span>{abar.current_monitor}&nbsp;</Span>
                <i className="fas fa-clone">&nbsp;</i>
                <Span>{ missionControl(abar) }</Span>
              </div>

              <div className={leftGroup}>
                <i className="fas fa-microchip">&nbsp;</i>
                <Span>{abar.cpu}</Span>%
              </div>

              <div className={leftGroup}>
                <i className="fas fa-memory">&nbsp;</i>
                <Span>{abar.memory}</Span>%
              </div>

              <div className={leftGroup}>
                <i className="fas fa-hdd">&nbsp;</i>
                <Span>{abar.hd.available} of {abar.hd.total }</Span>
              </div>
          </div>

          <div className={middlePanel}>
              <div className={middleGroup}>
                <i className="fas fa-circle">&nbsp;</i>
                <Span>{abar.current_app }</Span>
              </div>
          </div>

          <div className={rightPanel}>
              <div className={rightGroup}>
                  <i className="fas fa-calendar-alt">&nbsp;</i>
                  <Span>{abar.date}</Span>
              </div>
          </div>

        </div>
    )
}

const missionControl = function (abar) {
    var mc = abar.mission_control
    var bar=[];
    for (var desktopId in mc[abar.current_monitor]) {
        var cls = pickDesktopClass(abar, desktopId);
        bar.push(<span className={cls} key={desktopId}>{desktopId}&nbsp;</span>);
    }
    return bar;
}

const pickDesktopClass = function (abar, desktopId) {
    var mc = abar.mission_control[abar.current_monitor];
    var hasWindows = mc[desktopId] != undefined && mc[desktopId].length > 0;
    var isFocused = desktopId == abar.current_desktop;
    var selectedClass = desktop;
    // I suck at JS, so this is as repetitive as it gets.
    if (hasWindows) { selectedClass = nonEmptyDesktop; }
    if (isFocused) { selectedClass = selectedDesktop; }
    return selectedClass
}

const Span = styled("p")`
   margin-top: 5px;
`

const valigned =css`
    height: 100%;
    vertical-align: middle;
`

const stats = css`
    display: inline;
    width: 100%;
    width: 100vw;
    ${valigned};
`

const desktop = css`
    text-align: left;
`

const nonEmptyDesktop = css`
    font-weight: bold;
`

const selectedDesktop = css`
    color: yellow;
`

const panel = css`
    float: left;
    margin: 0px;
    padding: 0px;
    width: 33.3%;
    ${valigned};
`

const leftPanel = css`
    float: left;
    ${panel};
`

const group = css`
   margin: 0px 0px 0px 0px;
   ${valigned};
   display:-webkit-box;
   -webkit-box-pack:center;
   -webkit-box-align:center;
`

const leftGroup = css`
  ${group};
  float: left;
  padding-top: 0px;
  padding-bottom: 0px;
  padding-right: 20px; 
  padding-left: 5px; 
`

const middlePanel = css`
   ${panel};
   text-align: center;
`

const middleGroup = css`
   ${group};
`

const rightPanel = css`
   ${panel};
   text-align: right;
   float: right;
`

const rightGroup = css`
   ${group};
   padding-right: 5px;
   float: right;
`

export const className = `
  @import url("assets/font.awesome.all.css");
  font-family: "Font Awesome\ 5 Free";
  right: 5px;
  left: 5px;
  bottom: 2px;
  height: 23px;
  color: white;
  background-color: #191b21;
  vertical-align: middle;
`
