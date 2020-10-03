---
title: "認証・認可処理の備忘録"
date: 2019-09-14T21:32:36+09:00
draft: true
comments: true
toc: true
categories: [""]
tags: ["OAuth", "OpenID"]
---

あやふやな理解だった認証・認可周りをざっくり勉強したので備忘録。

<!--more-->

---

{{< ad/a8/techacademy2 >}}

---

### 認証 (Authentication)

ある人が本人であることを確認する処理。

例えば、本人しか知らないはずのIDとパスワードを入力させる、など。

---

### 認可 (Authorization)

ある人が何をできるのかを確認する処理。

例えば、ログインしたユーザーが、あるリソースにアクセスできるかどうかの確認。

---

### OpenID

有名な認証プロトコル。

---

### OAuth2.0

非常によく使われる認可プロトコルで、独自形式にするくらいならこちらの使用を推奨されることが多い。

---

### おわり

自分の認識を書いているのですが、間違っていたらご指摘いただきたいです。

---

### 参考

- [今更聞けない OAuth2.0](https://www.slideshare.net/ph1ph2sa25/oauth20-46144252)

---

{{< ad/con/wide/devops >}}

---

{{< ad/a8/techacademy_py_ai >}}

---

{{< ad/a8/techacademy_blockchain >}}

---
