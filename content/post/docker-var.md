---
title: "Dockerでコマンド実行結果を変数に入れられなくて困った話"
date: 2019-04-24T08:10:53+09:00
draft: false
comments: true
categories: ["Docker"]
tags: ["Docker", "Dockerfile"]
---

Dockerfileではコマンド実行結果を変数に入れられない。それでも入れたい時の回避策。

<!--more-->

---

{{< ad/afb/foster >}}

---

 - [[参考記事]Dockerfileの書き方や紛らわしいコマンドの話](https://www.ted027.com/post/dockerfile)

### 問題

何がやりたかったかというとOracle JDKを入れたかった。

のですが、コマンド実行結果を変数に入れることができない。

```Dockerfile
RUN set -ex &&\
    URL=$(curl -s http://www.oracle.com/technetwork/java/javase/downloads/index.html | egrep -m1 -o '/technetwork/java/javase/downloads/jdk8-downloads-[0-9]+\.html') && \
    ...
```

`ENV`を使ってもできない。

```Dockerfile
ENV URL_SUFFIX=$(curl -s http://www.oracle.com/technetwork/java/javase/downloads/index.html | egrep -m1 -o '/technetwork/java/javase/downloads/jdk8-downloads-[0-9]+\.html')
```

---

### 回避策

すっきりした解決策は無さそうですが、`.bashrc`に書けば一応は回避可能のようです。

```Dockerfile
RUN echo 'export URL="$(curl -s http://www.oracle.com/technetwork/java/javase/downloads/index.html | egrep -m1 -o '/technetwork/java/javase/downloads/jdk8-downloads-[0-9]+\.html')"' >> ~/.bashrc
```

---

### ちなみに

この回避策は使わず、おとなしくOpenJDKに切り替えました。

```Dockerfile
RUN set -ex && \
    yum -yq install java-1.8.0-openjdk && \
    yum clean all
```

---

### 参考

- [[Docker] ENV にコマンドの結果を使えない問題の回避策](https://srz-zumix.blogspot.com/2017/05/docker-env.html)

- [docker build中のコマンドの実行結果を環境変数として登録し、docker runで利用する](https://qiita.com/c18t/items/e380a6bb586a595e1138)

---

{{< ad/con/wide/docker >}}

---
