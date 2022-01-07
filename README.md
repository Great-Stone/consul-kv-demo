# Consul KV Demo

## Prerequisite
### Downloads

- consul : https://releases.hashicorp.com/consul
- consul-template : https://releases.hashicorp.com/consul-template

### Consul agent dev mode

`consul agent -dev`

### CLI Environment

`export CONSUL_HTTP_ADDR=http://localhost:8500`

## 1. CLI

```bash
consul kv put service/web/enable_foo true
consul kv get service/web/enable_foo
```

```bash
curl -s http://localhost:8500/v1/kv/service/web/enable_foo | jq .
curl -s http://localhost:8500/v1/kv/service/web/enable_foo | jq -r '.[].Value | @base64d'
```

## 2. Watch

```bash
consul kv put mykey/test1 test1

consul watch -type=keyprefix -prefix=mykey/ "echo \"Modified\""

consul watch -type=keyprefix -prefix=mykey/ "consul kv get -recurse mykey"
```

## 3. Spring boot

### 3.1 Consul KV put for demo

```bash
# consulu kv put <prefix>/<defaultContext>/key value
consul kv put config/myApp/my.prop hello!
```

### 3.2 Run Spring-boot

> demo dir : 03-spring-boot

`mvn spring-boot:run`

1. check <http://localhost:8080/get>
2. change value and refresh

## 4. consul-template

> demo dir : 04-consul-template

### 4.1 Consul KV put for demo

```bash
consul kv put config "address=127.0.0.1"
```

nginx conf sample : <https://www.nginx.com/resources/wiki/start/topics/examples/full/>

### 4.2 Run consul-template

```bash
consul-template -config=template.hcl
```

