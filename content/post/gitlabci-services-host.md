---
title: "GitLab-CIでservicesのコンテナに対してアクセスする"
date: 2021-03-21T11:00:25+09:00
draft: false
comments: true
toc: true
categories: ["AWS", "CI"]
tags: ["GitLabCI"]
---

<!--more-->

---

{{< ad/a8/techacademy >}}

---

### GitLab-CIのservices

GitLab-CIで`services`パラメータを使うと、`images`で指定した実行環境と別にDockerコンテナを起動し、アクセス出来るようになる。

```yaml
services:
  - mysql: 8.0.23

my_ci:
  services: 
    - localstack/localstack:0.12.8
```

* 参考: [What is a services](https://docs.gitlab.com/ee/ci/docker/using_docker_images.html#what-is-a-service)

---

### servicesで指定したコンテナのhost

servicesで起動したコンテナのデフォルトhostは、

* `:`以下は切り捨て
* `/`を`__`(アンダースコア×2)で置換 (primary host)
* `/`を`-`(ハイフン)で置換 (secondary host)

のルールで、2通り提供される。  
なお`__`(アンダースコア×2)がhost名に入ると不正として弾くツールもあり、secondary hostを利用する方がおすすめ。

```yaml
services:
  - mysql: 8.0.23
variables:
  MYSQL_DATABASE: http://mysql:8080

my_ci:
  services: 
    - localstack/localstack:0.12.8
  variables:
    AWS_ENDPOINT: http:localstack-locakstack:4566
```

* 参考: [Accessing the services](https://docs.gitlab.com/ee/ci/docker/using_docker_images.html#accessing-the-services)

---

### servicesで指定したコンテナのport

`services`でportを指定する機能は現状無い。  
サービスやDocker imageを確認し、デフォルトのportを指定する。

※ なお、portを指定できるようにしてほしい…という話題はissue上で起きているようで、将来的には指定できるようになる雰囲気がある。

* [.gitlab-ci.yml -- support for "services" port mapping, name aliasing - like docker-compose.yml](https://gitlab.com/gitlab-org/gitlab-runner/-/issues/2460)

---

{{< ad/con/wide/devops >}}

---

{{< ad/a8/techacademy_py_ai >}}

---
