---
title: "Docker for Windowsを導入する"
date: 2019-05-03T14:08:37+09:00
draft: false
comments: true
categories: ["Docker"]
tags: ["Wondows", "インストール"]
---

<!--more-->

---

{{< ad/a8/onamae >}}

---

Windows10にDocker for Windowsをインストールした際の手順をまとめておきます。

---

### 事前準備

以下のリンクから登録し、Docker IDを取得する。

- https://hub.docker.com/signup

※ 既にDocker IDを持っている場合はSign Inする

---

### 仮想化を有効にする

「コントロールパネル」→「プログラム」→「Windowsの機能」から、Hyper-VのチェックをONにする

※ OFF→ONにした場合はPCを再起動する

---

### Docker for Windowsをインストール

1. 以下のリンクからインストーラをダウンロードする
   - https://docs.docker.com/docker-for-windows/install/
2. インストーラを実行
3. インストールが終了したら、「Close and log out」→「Docker for Windows」を起動し再度ログイン

---

### 使ってみる

powershellを起動して実行。

```ps
$ docker --version
```

バージョンが表示されれば成功。

次は適当なイメージをpullしてコンテナを作成してみる。

```ps
$ docker run -it -d alpine:latest
$ docker ps
```

`docker ps`で確認すると、コンテナが立ち上がっていることがわかる。

```
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
4c2b2x31f6gh        alpine:latest       "/bin/sh"           3 minutes ago       Up 3 minutes                            ...
```

乗り込んでみる。

```ps
$ docker exec -it {countainer_id} /bin/sh
```

ひとしきり試し終わったら`docker stop`でコンテナを落とす。

```ps
$ docker stop {countainer_id}
```

---

{{< ad/con/wide/docker >}}

---

{{< ad/a8/techacademy2>}}

---
