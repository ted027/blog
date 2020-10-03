---
title: "apt updateで署名エラー"
date: 2020-03-01T21:56:24+09:00
draft: false
comments: true
toc: true
categories: ["Ubuntu"]
tags: ["apt", "GPG"]
---

<!--more-->

---

{{< ad/a8/onamae >}}

---

### 概要

`apt update`で署名エラー。

```sh
$ sudo apt update
...
  以下の署名が無効です: EXPKEYSIG 1488EB46E192A257 home:manuelschneid3r OBS Project <home:manuelschneid3r@build.opensuse.org>
...
W: 署名照合中にエラーが発生しました。リポジトリは更新されず、過去のインデックスファイルが使われます。GPG エラー: http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_18.04  Release: 以
下の署名が無効です: EXPKEYSIG 1488EB46E192A257 home:manuelschneid3r OBS Project <home:manuelschneid3r@build.opensuse.org>
W: http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_18.04/Release.gpg の取得に失敗しました  以下の署名が無効です: EXPKEYSIG 1488EB46E192A257 home:manuelschneid3r OBS Project <home:manuelschneid3r@build.opensuse.org>
W: いくつかのインデックスファイルのダウンロードに失敗しました。これらは無視されるか、古いものが代わりに使われます。
```

---

### 原因

GPG公開鍵が期限切れ。

`apt-key list`で期限切れのものが確認できる。

```sh
$ apt-key list
pub   rsa2048 2017-10-27 [SC] [期限切れ: 2020-01-05]
uid   [期限切れ] home:manuelschneid3r OBS Project <home:manuelschneid3r@build.opensuse.org>  
```

---

### 対処

プロジェクト名等でググってそれっぽい公開鍵を取ってきて、`app-key add`すればよい。

```sh
$ curl https://build.opensuse.org/projects/home:manuelschneid3r/public_key | sudo apt-key add -

$ apt-key list
...
pub   rsa2048 2017-10-27 [SC] [有効期限:2022-03-05]
uid   [  不明  ] home:manuelschneid3r OBS Project <home:manuelschneid3r@build.opensuse.org>
...
```

これで`apt update`が成功する。

---

{{< ad/a8/techacademy_py_ai >}}

---

{{< ad/a8/techacademy_blockchain >}}

---
