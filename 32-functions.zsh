function get_pipe_parent_cmdline() {
    my_pid="${$}"
    ps -axwwo ppid,command | grep "${my_pid}" | cut -d' ' -f2- | head -n1
}
