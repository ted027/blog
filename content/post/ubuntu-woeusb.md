---
title: "Ubuntu20.04でwoeusbのインストールに失敗"
date: 2021-01-14T5:57:50+09:00
draft: false
comments: true
toc: true
categories: ["Linux"]
tags: ["Ubuntu", "woeusb", "エラー"]
---

<!--more-->

---

{{< ad/a8/techacademy_py_ai >}}

---

{{< img src="/img/ubuntu.png" >}}

---

### 問題

Ubuntu 20.04でwoeusbをインストールしようとすると失敗

```sh
$ sudo add-apt-repository ppa:nilarimogard/webupd8
...
$ sudo apt install woeusb
...
インストールすることができないパッケージがありました。おそらく、あり得
ない状況を要求したか、(不安定版ディストリビューションを使用しているの
であれば) 必要なパッケージがまだ作成されていなかったり Incoming から移
動されていないことが考えられます。
以下の情報がこの問題を解決するために役立つかもしれません:

以下のパッケージには満たせない依存関係があります:
 woeusb : 依存: libwxgtk3.0-0v5 (>= 3.0.4+dfsg) しかし、インストールすることができません
```

---

libwxgtk3.0-0v5を手動インストールしようとしても失敗。

```sh
$ sudo apt install woeusb libwxgtk3.0-0v5
...
パッケージリストを読み込んでいます... 完了
...
パッケージ libwxgtk3.0-0v5 は使用できませんが、別のパッケージから参照されます。
これは、パッケージが欠落しているか、廃止されたか、または別のソース
からのみ利用可能であることを意味します。

E: パッケージ 'libwxgtk3.0-0v5' にはインストール候補がありません
```

---

### 解決策

[ミラーサイト](https://packages.ubuntu.com/bionic/amd64/libwxgtk3.0-0v5/download)からlibwxgtk3.0-0v5のdebファイルを取得しインストール。

- https://packages.ubuntu.com/bionic/amd64/libwxgtk3.0-0v5/download

その後aptからインストール。

```sh
$ sudo add-apt-repository ppa:nilarimogard/webupd8
...
$ sudo apt install woeusb
```

---

### 参考

- [WoeUSB doesn't install on Ubuntu 20.04](https://github.com/slacka/WoeUSB/issues/311)

---

{{< ad/con/wide/usb >}}

---
