# sysctl-monitor

A simple tool to monitor sysctl values track changes.

This tool attaches a **BPF** program of type [CGROUP\_SYSCTL](https://docs.kernel.org/bpf/prog_cgroup_sysctl.html) which run every time a sysctl value is accessed. The program will just exit if the access is only a read operation, otherwise it will check if the written value is different from the current one.  
If so, the program reports to userspace:
* the sysctl name
* the current value
* the new value
* the PID of the writing process
* the process name

Events are sent to userspace via the [BPF ring buffer](https://docs.kernel.org/bpf/ringbuf.html) for fast data sharing.
