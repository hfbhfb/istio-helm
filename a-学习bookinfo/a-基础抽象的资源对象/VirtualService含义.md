Istio VirtualService 是定义服务之间流量路由规则的资源。以下是一个简单的例子，说明了 VirtualService 的基本字段及其含义：

```yaml
apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
metadata:
  name: my-virtual-service
spec:
  hosts:
    - my-service.example.com
  http:
    - route:
        - destination:
            host: my-service-v1
          weight: 80
        - destination:
            host: my-service-v2
          weight: 20
```

- `metadata`: 包含资源的元数据，如名称等。
- `spec.hosts`: 定义 VirtualService 将应用于哪些主机，即请求的目标主机。
- `spec.http`: 定义 HTTP 路由规则，可以有多个规则，每个规则包含一个或多个 `route`。
- `spec.http.route.destination.host`: 指定请求应该被路由到的目标服务。
- `spec.http.route.weight`: 定义路由到每个目标服务的流量权重，用百分比表示。

在上述例子中，所有来自 `my-service.example.com` 的请求将按照 80% 的权重路由到 `my-service-v1`，而剩下的 20% 将路由到 `my-service-v2`。这样你可以控制服务之间的流量分发策略。