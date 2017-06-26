from subprocess import Popen, PIPE
from shlex import split

def get_remote_password(mailbox):
    rawJson = Popen(split("gpg --no-tty -dq /Users/adinapoli/Dropbox/dotfiles/.authinfo.json.gpg"), stdout = PIPE)
    return unicode(Popen(split("jq -r .email.%s.password" % mailbox), stdin = rawJson.stdout).communicate()[0])

def get_xoauth2_client_id(mailbox):
    rawJson = Popen(split("gpg --no-tty -dq /Users/adinapoli/Dropbox/dotfiles/.authinfo.json.gpg"), stdout = PIPE)
    return unicode(Popen(split("jq -r .email.%s.xoauth2.clientID" % mailbox), stdin = rawJson.stdout).communicate()[0])

def get_xoauth2_client_secret(mailbox):
    rawJson = Popen(split("gpg --no-tty -dq /Users/adinapoli/Dropbox/dotfiles/.authinfo.json.gpg"), stdout = PIPE)
    return unicode(Popen(split("jq -r .email.%s.xoauth2.clientSecret" % mailbox), stdin = rawJson.stdout).communicate()[0])

def get_xoauth2_access_token(mailbox):
    rawJson = Popen(split("gpg --no-tty -dq /Users/adinapoli/Dropbox/dotfiles/.authinfo.json.gpg"), stdout = PIPE)
    return unicode(Popen(split("jq -r .email.%s.xoauth2.accessToken" % mailbox), stdin = rawJson.stdout).communicate()[0])

def get_xoauth2_refresh_token(mailbox):
    rawJson = Popen(split("gpg --no-tty -dq /Users/adinapoli/Dropbox/dotfiles/.authinfo.json.gpg"), stdout = PIPE)
    return unicode(Popen(split("jq -r .email.%s.xoauth2.refreshToken" % mailbox), stdin = rawJson.stdout).communicate()[0])
