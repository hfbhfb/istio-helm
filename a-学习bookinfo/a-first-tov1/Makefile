
SBookInfo=ns-bookinfo

# VirtualService 一定要配合 DestinationRule，要不然会envoy没有目标
install:
	kubectl apply -f destination-rule-all-mtls.yaml --namespace  ${SBookInfo} 
	kubectl apply -f virtual-service-all-v1.yaml --namespace  ${SBookInfo}


uninstall:
	kubectl delete -f destination-rule-all-mtls.yaml --namespace  ${SBookInfo}
	kubectl delete -f virtual-service-all-v1.yaml --namespace  ${SBookInfo}

status:
	kubectl get DestinationRule --namespace  ${SBookInfo}
	kubectl get VirtualService --namespace  ${SBookInfo}


ttt1:
	kubectl delete -f destination-rule-all-mtls.yaml --namespace  ${SBookInfo}
