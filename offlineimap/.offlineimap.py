from subprocess import Popen, PIPE
from shlex import split

def get_remote_password(mailbox):
    rawJson = Popen(split("gpg --no-tty -dq /Users/adinapoli/Dropbox/dotfiles/.authinfo.json.gpg"), stdout = PIPE).communicate()[0]
    return Popen(split("jq -r .email.%s.password" % mailbox), stdin = PIPE, stdout = PIPE).communicate(input=rawJson)[0]

def get_xoauth2_client_id(mailbox):
    rawJson = Popen(split("gpg --no-tty -dq /Users/adinapoli/Dropbox/dotfiles/.authinfo.json.gpg"), stdout = PIPE).communicate()[0]
    return Popen(split("jq -r .email.%s.xoauth2.clientID" % mailbox), stdin = PIPE, stdout = PIPE).communicate(input=rawJson)[0]

def get_xoauth2_client_secret(mailbox):
    rawJson = Popen(split("gpg --no-tty -dq /Users/adinapoli/Dropbox/dotfiles/.authinfo.json.gpg"), stdout = PIPE).communicate()[0]
    return Popen(split("jq -r .email.%s.xoauth2.clientSecret" % mailbox), stdin = PIPE, stdout = PIPE).communicate(input=rawJson)[0]

def get_xoauth2_access_token(mailbox):
    rawJson = Popen(split("gpg --no-tty -dq /Users/adinapoli/Dropbox/dotfiles/.authinfo.json.gpg"), stdout = PIPE).communicate()[0]
    return Popen(split("jq -r .email.%s.xoauth2.accessToken" % mailbox), stdin = PIPE, stdout = PIPE).communicate(input=rawJson)[0]

def get_xoauth2_refresh_token(mailbox):
    rawJson = Popen(split("gpg --no-tty -dq /Users/adinapoli/Dropbox/dotfiles/.authinfo.json.gpg"), stdout = PIPE).communicate()[0]
    return Popen(split("jq -r .email.%s.xoauth2.refreshToken" % mailbox), stdin = PIPE, stdout = PIPE).communicate(input=rawJson)[0]
