# Sourced after /etc/zprofile which reorders PATH, setting /usr/local/bin ahead
# of everything else. We don't want to source this stuff in zshrc because it is
# needed in non-interactive shells in emacs.

ASDF_SOURCED=1
[ -f ~/.asdf/asdf.sh ] && source ~/.asdf/asdf.sh
