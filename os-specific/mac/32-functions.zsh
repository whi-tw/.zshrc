function sudo() {
  # I like using touchid for sudo. You can enable it by adding `pam_tid.so` to /etc/pam.d/sudo.
  # MacOS reverts `/etc/pam.d/sudo` after updates because it hates you.
  # This function:
  # 1. checks if pam_tid.so is in /etc/pam.d/sudo
  #    - if not, it adds it back in on the second line (ie. after the header comment)
  # 2. undeclares itself, so it doesn't get called again in this session
  # 3. calls sudo with the original arguments
  grep -qs pam_tid.so /etc/pam.d/sudo || {
    echo "pam_tid.so has been removed. Adding it back in..." >&2
    builtin command sudo sed -i -e '2s;^;auth       sufficient     pam_tid.so\n;' /etc/pam.d/sudo
    echo "resuming normal service..." >&2
  }
  unset -f sudo
  sudo "$@"
}
