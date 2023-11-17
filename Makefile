


helmAppName=ist1
Space=istio-system
SBookInfo=ns-bookinfo
SAddon=istio-system

template: base-template istiod-template
	@echo "template"

base-template:
	rm -Rf template-out-base-${helmAppName}
	touch values-base.yaml
	helm template base/ --namespace  ${Space} --values ./values-base.yaml --name-template ${helmAppName} --output-dir template-out-base-${helmAppName} --debug

istiod-template:
	rm -Rf template-out-istiod-${helmAppName}
	touch values-istiod.yaml
	helm template istiod/ --namespace  ${Space} --values ./values-istiod.yaml --name-template ${helmAppName} --output-dir template-out-istiod-${helmAppName} --debug

gateway-template:
	rm -Rf template-out-gateway-${helmAppName}
	touch values-gateway.yaml
	helm template gateway/ --namespace  ${Space} --values ./values-gateway.yaml --name-template ${helmAppName} --output-dir template-out-gateway-${helmAppName} --debug



install-base:
	- kubectl create ns  ${Space}
	- helm install base/ --namespace  ${Space} --values ./values-base.yaml --name-template ${helmAppName}-base
	- helm install istiod/ --namespace  ${Space} --values ./values-istiod.yaml --name-template ${helmAppName}-istiod
	- helm install gateway/ --namespace  ${Space} --values ./values-gateway.yaml --name-template ${helmAppName}-gateway #会报错，需要升级centos内核

uninstall-base:
	-helm uninstall  --namespace  ${Space}  ${helmAppName}-gateway
	-helm uninstall  --namespace  ${Space}  ${helmAppName}-istiod
	-helm uninstall  --namespace  ${Space}  ${helmAppName}-base

install-step3-bookinfo:
	- kubectl create ns ${SBookInfo}
	- kubectl label namespace ${SBookInfo} istio-injection=enabled
	@echo "https://github.com/istio/istio/tree/1.15.7/samples/bookinfo"
	kubectl apply -f bookinfo-1.15.7/platform/kube/bookinfo.yaml --namespace  ${SBookInfo}

uninstall-step3-bookinfo:
	-kubectl delete -f bookinfo-1.15.7/platform/kube/bookinfo.yaml --namespace  ${SBookInfo}

product-step3:
	@echo "访问页面产生一些数据"
	for i in $(seq 1 1000); do curl -s -o /dev/null "http://http://192.168.27.246:30711/productpage?u=normal"; done
	for i in $(seq 1 1000); do curl -s -o /dev/null "http://192.168.27.246:30711/productpage?u=test"; done
	# for i in $(seq 1 100000); do curl -s -o /dev/null "http://192.168.1.211"; done

install-step4-addons:
	- kubectl create ns ${SAddon}
	@echo "https://istio.io/latest/zh/docs/ops/integrations/jaeger/"
	@echo "https://istio.io/latest/zh/docs/tasks/observability/kiali/"
	kubectl apply -f addons-1.15.7/  --namespace  ${SAddon}

uninstall-step4-addons:
	-kubectl delete -f addons-1.15.7/  --namespace  ${SAddon}



uninstall-all: uninstall-step4-addons uninstall-step3-bookinfo uninstall-base
	@echo "uninstall-all"



download: repoadd
	helm pull istio/base --version 1.19.3 --untar
	helm pull istio/istiod --version 1.19.3 --untar
	helm pull istio/gateway --version 1.19.3 --untar

repoadd:
	helm repo add istio https://istio-release.storage.googleapis.com/charts
	helm repo list
	helm repo update istio
	helm search repo istio -l

all:
	@echo "all"


