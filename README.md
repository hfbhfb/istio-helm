
## istio-helm
make install-base

## helm安装istio 
https://istio.io/latest/docs/setup/install/helm/


## gateway 在centos系统下报错 需要升级centos linux内核
Warning  FailedCreatePodSandBox  2m35s (x13 over 2m48s)  kubelet            Failed to create pod sandbox: rpc error: code = Unknown desc = failed to start sandbox container for pod "ist1-gateway-54bd959bdb-cjgtx": Error response from daemon: failed to create shim task: OCI runtime create failed: runc create failed: unable to start container process: error during container init: open /proc/sys/net/ipv4/ip_unprivileged_port_start: no such file or directory: unknown


## bookinfo 采用的版本如下， 目录为 bookinfo-1.15.7 
https://github.com/istio/istio/tree/1.15.7/samples/bookinfo



