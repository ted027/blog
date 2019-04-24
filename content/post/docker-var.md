---
title: "Dockerでコマンド実行結果を変数に入れられなくて困った話"
date: 2019-04-24T08:10:53+09:00
draft: false
comments: true
categories: ["Docker"]
tags: ["Docker", "JDK"]
---

Dockerfileではコマンド実行結果を変数に入れられない。それでも入れたい時の回避策。

<!--more-->

---

<a href="https://t.afi-b.com/visit.php?guid=ON&a=C9511S-i324416Z&p=J690746r" target="_blank" rel="nofollow"><img src="https://www.afi-b.com/upload_image/9511-1521815201-3.gif" width="728" height="90" style="border:none;" alt="フォスターフリーランス" /></a><img src="https://t.afi-b.com/lead/C9511S/J690746r/i324416Z" width="1" height="1" style="border:none;" />

---

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

<a href="https://t.afi-b.com/visit.php?guid=ON&a=99886h-W336947J&p=J690746r" target="_blank" rel="nofollow"><img src="https://www.afi-b.com/upload_image/9886-1534983315-3.jpg" width="728" height="90" style="border:none;" alt="CodeCampGATE" /></a><img src="https://t.afi-b.com/lead/99886h/J690746r/W336947J" width="1" height="1" style="border:none;" />

---