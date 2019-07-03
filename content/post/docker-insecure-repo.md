---
title: "docker pullで'server HTTP response to HTTPS client'エラーが出たとき"
date: 2019-07-03T12:32:12+09:00
draft: false
comments: true
toc: false
categories: ["Docker"]
tags: ["エラー"]
---

<!--more-->

---

{{< ad/con/wide/docker >}}

---

プライベートレジストリを使っていると、表題のエラーが起きることがある。

insecure-registriesに追加すればいい。

`/etc/docker/daemon.json`に以下を追加。

```
{ "insecure-registries":["private-registory.domain:30000"] }
```

dockerを再起動し、再度pull/pushする。

```sh
systemctl restart docker.service
```

---

{{< ad/a8/techacademy2 >}}

---
