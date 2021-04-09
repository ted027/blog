---
title: "Dockerイメージ alpine,slim,stretch,buster,jessie等の違いと使い分け"
date: 2021-04-09T21:56:21+09:00
draft: false
comments: true
toc: true
categories: ["Docker"]
tags: ["Dockerfile", "Debian", "Alpine"]
---

<!--more-->

---

{{< ad/a8/techacademy_blockchain >}}

---

利用するDocker imageを選ぶ際、同じバージョンであっても、後ろに`-stretch`やら、`-buster`やらがついていて迷うことがあります。  
これはimageがベースとしているOSの種類によるものです。

### stretch/buster/jessie/bullseye

これらの文字列がついたimageは、それぞれ同名の[Debian Release](https://wiki.debian.org/DebianReleases)をベースに構築されたものです。  
コードが特定のDebian Releaseやバージョンと互換性を持つ特殊な場合を覗いて、基本的にどれを選んでも大差ありません。

### slim

`-slim`がついたimageは、フルイメージの下位互換バージョンです。インストール済みのパッケージは使用頻度の高いものに限定され、その分軽量化されています。  
軽量のimageが望ましい場合に採用します。ただし前述のようにフルイメージに存在するパッケージが一部存在しないため、正しく動作するか十分なテストが必要です。

### alpine

`-alpine`がついたimageは、[Alpine Linux](https://alpinelinux.org/)をベースに構築されたものです。Alpine Linuxは、コンテナで利用することを想定して設計されたOSで、極めて軽量です。Alpineのベースイメージは5MB未満と非常に小さく収まっています。  
コンテナを可能な限り最小で、最速で構築したい場合に採用します。

一方で欠点もあります。ベースOSが大きく異なるため、主要なパッケージ、コマンドのいくつかが無いか、あるいは類似の別のものを利用する必要があります。例えば、`apt`の代わりに`apk`でパッケージをインストール（結構古いバージョンがが入ります）、glibcでなくmusl libが入っている、等。
また、一部Debianとの互換性を持つPythonパッケージは、Alpineベースのimageで動作するように再コンパイルしなければ動作しません。

とはいえ、それが大きな問題にならないのであれば、フルイメージを使うよりも、`alpine` imageにapkで必要なパッケージのみをインストールして利用した方が、軽量かつ高速で環境を構築できます。ただし、正常に挙動するか、入念なテストを行う必要があります。

### windowsservercore

Dockerで環境を構築しようとする方がWondows環境にこだわるとは思えませんが、どうしてもWindows上でないと動作しないアプリケーションなのであれば、これを採用したらいいのではないでしょうか。

### 結局どれにすればいいの？

* 十分なテストをする余裕がなく、環境を素早く立ち上げなければいけない場合、`stretch`, `buster`, `jessie`, `bullseye`あたりを適当に選ぶ
* コンテナを軽量化する必要があり、最小限のパッケージだけで動作することが分かっていれば、`slim`を採用する
* コンテナを限界まで軽量化する必要があり、十分なテストが可能であれば`alpine`を採用する。ただし、移植等した際に挙動がおかしくなる可能性がある
* 頻繁にimageを取得するユースケースであれば、`slim`や`alpine`を優先的に採用する

私はCIを爆速で回したいので`alpine`で頑張ってみるのが好きですが、すんなりうまく行くことは少なく、結局調べたり乗り込んでパッケージを入れたりしてやっとこさ成功します。

---

### 参考

* [Alpine, Slim, Stretch, Buster, Jessie, Bullseye — What are the Differences in Docker Images?](https://medium.com/swlh/alpine-slim-stretch-buster-jessie-bullseye-bookworm-what-are-the-differences-in-docker-62171ed4531d)

---

{{< ad/con/wide/docker >}}

---
