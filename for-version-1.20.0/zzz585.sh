

## 1.18.2版本 istio 和 国内镜像的bookinfo                       **23434skdfj**
helm repo add istio https://istio-release.storage.googleapis.com/charts
helm search repo istio -l |grep 1.18.2

.
helm pull istio/base --version 1.20.0 --untar
helm pull istio/istiod --version 1.20.0 --untar


touch ./values-base.yaml 
touch ./values-istiod.yaml 

make template
make uninstall-base
make install-base


kubectl delete -f test-yamls/tools-istio-injected.yaml
kubectl apply -f test-yamls/tools-istio-injected.yaml

kubectl get po -n istio-system 
kubectl get po -n istio-system -oyaml |grep image
kubectl get po 
kubectl get po -oyaml |grep image


docker images|grep istio
docker pull istio/proxyv2:1.20.0 
docker pull istio/pilot:1.20.0


docker tag istio/proxyv2:1.20.0 swr.cn-north-4.myhuaweicloud.com/hfbbg4/proxyv2:1.20.0
docker tag istio/pilot:1.20.0 swr.cn-north-4.myhuaweicloud.com/hfbbg4/pilot:1.20.0


docker push swr.cn-north-4.myhuaweicloud.com/hfbbg4/proxyv2:1.20.0
docker push swr.cn-north-4.myhuaweicloud.com/hfbbg4/pilot:1.20.0


# 打包
make pack




# 安装bookinfo测试     **23434skdfj**
SBookInfo=ns-bookinfo
kubectl create ns  ${SBookInfo}
kubectl label namespace ${SBookInfo} istio-injection=enabled
kubectl apply -f bookinfo-bg4.yaml


kubectl edit ns  ${SBookInfo}















# 镜像处理
docker tag docker.io/istio/examples-bookinfo-ratings-v1:1.17.0 swr.cn-north-4.myhuaweicloud.com/hfbbg4/examples-bookinfo-ratings-v1:1.17.0
docker push swr.cn-north-4.myhuaweicloud.com/hfbbg4/examples-bookinfo-ratings-v1:1.17.0

docker tag docker.io/istio/examples-bookinfo-ratings-v1:1.17.0 swr.cn-north-4.myhuaweicloud.com/hfbbg4/examples-bookinfo-ratings-v1:1.17.0 
docker push   swr.cn-north-4.myhuaweicloud.com/hfbbg4/examples-bookinfo-ratings-v1:1.17.0 


docker pull docker.io/istio/examples-bookinfo-reviews-v1:1.17.0
docker tag docker.io/istio/examples-bookinfo-reviews-v1:1.17.0 swr.cn-north-4.myhuaweicloud.com/hfbbg4/examples-bookinfo-reviews-v1:1.17.0
docker push swr.cn-north-4.myhuaweicloud.com/hfbbg4/examples-bookinfo-reviews-v1:1.17.0





docker pull docker.io/istio/examples-bookinfo-reviews-v2:1.17.0
docker tag docker.io/istio/examples-bookinfo-reviews-v2:1.17.0 swr.cn-north-4.myhuaweicloud.com/hfbbg4/examples-bookinfo-reviews-v2:1.17.0
docker push swr.cn-north-4.myhuaweicloud.com/hfbbg4/examples-bookinfo-reviews-v2:1.17.0

docker pull docker.io/istio/examples-bookinfo-reviews-v3:1.17.0
docker tag docker.io/istio/examples-bookinfo-reviews-v3:1.17.0 swr.cn-north-4.myhuaweicloud.com/hfbbg4/examples-bookinfo-reviews-v3:1.17.0
docker push swr.cn-north-4.myhuaweicloud.com/hfbbg4/examples-bookinfo-reviews-v3:1.17.0


docker pull docker.io/istio/examples-bookinfo-productpage-v1:1.17.0
docker tag docker.io/istio/examples-bookinfo-productpage-v1:1.17.0 swr.cn-north-4.myhuaweicloud.com/hfbbg4/examples-bookinfo-productpage-v1:1.17.0
docker push swr.cn-north-4.myhuaweicloud.com/hfbbg4/examples-bookinfo-productpage-v1:1.17.0

docker pull docker.io/istio/examples-bookinfo-details-v1:1.17.0
docker tag docker.io/istio/examples-bookinfo-details-v1:1.17.0 swr.cn-north-4.myhuaweicloud.com/hfbbg4/examples-bookinfo-details-v1:1.17.0
docker push swr.cn-north-4.myhuaweicloud.com/hfbbg4/examples-bookinfo-details-v1:1.17.0




