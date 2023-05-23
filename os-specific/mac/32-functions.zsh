function sudo() {
  test -f '/tmp/sudo_pam_tid_set' || {
    grep -qs pam_tid.so /etc/pam.d/sudo || {
      echo "pam_tid.so has been removed. Adding it back in..." >&2
      builtin command sudo sed -i -e '2s;^;auth       sufficient     pam_tid.so\n;' /etc/pam.d/sudo
      echo "resuming normal service..." >&2
    }
    touch /tmp/sudo_pam_tid_set
  }
  builtin command sudo "$@"
}
