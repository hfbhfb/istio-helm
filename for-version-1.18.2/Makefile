

helmAppName=ist1
Space=istio-system


# 只编译模板，看有什么内容
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



# 真实的安装base
install-base:
	- kubectl create ns  ${Space}
	- helm install base/ --namespace  ${Space} --values ./values-base.yaml --name-template ${helmAppName}-base
	- helm install istiod/ --namespace  ${Space} --values ./values-istiod.yaml --name-template ${helmAppName}-istiod



uninstall-base:
	-helm uninstall  --namespace  ${Space}  ${helmAppName}-gateway
	-helm uninstall  --namespace  ${Space}  ${helmAppName}-istiod


ImgInfo4 ?=  swr.cn-north-4.myhuaweicloud.com/hfbbg4/tmp:v1

pack:
	docker build -f ./Dockerfile -t ${ImgInfo4} .
	docker push ${ImgInfo4}

