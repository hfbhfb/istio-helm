
## istio-helm
1. make install-base

2. make install-step3-bookinfo # 安装bookinfo相关的内容, 会在命名空间先label istio注入标签

3. make install-step4-addons #安装kali

4. make uninstall-all  # 卸载全部

## helm安装istio 
https://istio.io/latest/docs/setup/install/helm/


## gateway 在centos系统下报错 需要升级centos linux内核
Warning  FailedCreatePodSandBox  2m35s (x13 over 2m48s)  kubelet            Failed to create pod sandbox: rpc error: code = Unknown desc = failed to start sandbox container for pod "ist1-gateway-54bd959bdb-cjgtx": Error response from daemon: failed to create shim task: OCI runtime create failed: runc create failed: unable to start container process: error during container init: open /proc/sys/net/ipv4/ip_unprivileged_port_start: no such file or directory: unknown


## bookinfo 采用的版本如下， 目录为 bookinfo-1.15.7 
https://github.com/istio/istio/tree/1.15.7/samples/bookinfo




### 测试1 bookinfo
http://192.168.255.246:30711


## 测试2 访问kali
http://192.168.255.246:30112


