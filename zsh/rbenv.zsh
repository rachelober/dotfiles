# rbenv
export RBENV_ROOT="/usr/local/var/rbenv"

# load rbenv if available
if command -v rbenv >/dev/null; then
  eval "$(rbenv init - --no-rehash)"
fi
