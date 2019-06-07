---
title: "Debian(Jessie)のdocker imageでapt updateがこける"
date: 2019-06-04T12:33:53+09:00
draft: false
comments: true
toc: false
categories: ["Docker"]
tags: ["Linux", "エラー", "apt"]
---

<!--more-->

---

{{< ad/a8/techacademy3>}}

---

{{< ad/con/wide/docker >}}

---

Debian(Jessie)のdocker imageを使おうとしたところ、`apt-get update`で以下のエラー。

```sh
W: Failed to fetch http://deb.debian.org/debian/dists/jessie-updates/InRelease  Unable to find expected entry 'main/binary-amd64/Packages' in Release file (Wrong sources.list entry or malformed file)
```

どうやらaptパッケージのダウンロード元が以下のように変わったのでエラーになるようです。

`http://deb.debian.org/debian/dists/jessie-updates/main/binary-amd64/Packages`

↓

`http://deb.debian.org/debian/dists/jessie/main/binary-amd64/Packages`

ダウンロード元は、docker imageの`/etc/apt/sources.list`で確認出来る。

```source.list
deb http://deb.debian.org/debian jessie main
deb http://security.debian.org/debian-security jessie/updates main
deb http://deb.debian.org/debian jessie-updates main
```

一番下の`deb http://deb.debian.org/debian jessie-updates main`を削除すればよい。

自分はDockerfileの`apt-get update`の前にsedで処理しました。

```Dockerfile
RUN sed -i '/deb http:\/\/deb.debian.org\/debian jessie-updates main/d' /etc/apt/sources.list && \
    apt-get update && \
    ...
```

---

{{< ad/con/wide/unix >}}

---

{{< ad/a8/techacademy1>}}

---
