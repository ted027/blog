---
title: "端末ソフトByobuの導入とよく使うコマンド等"
date: 2019-04-19T12:41:06+09:00
draft: false
comments: true
categories: ["Shell"]
tags: ["Shell", "Byobu", "仮想端末", "画面分割"]
---

仮想端末ソフトByobuの導入やよく使うコマンドについてのメモ。

<!--more-->

---

{{< ad/afb/btc >}}

---

### About

- [Byobu](http://byobu.co/)
    - オープンソースの仮想端末ソフト。画面分割やら移動やらが楽。

---

### インストール

- http://byobu.co/downloads.html

|  OS  |  コマンド  |
| ---- | ---- |
| Alpine Linux | `apk add byobu` |
| Arch | `pacman -Sy byobu` |
| Debian | `apt-get install byobu` |
| Fedora | `yum install byobu` |
| Gentoo | `emerge byobu` |
| Mac OS | `brew install byobu` |
| Mint | `sudo apt-get install byobu` |
| Ubuntu | `sudo apt-get install byobu` |

---

### よく使うコマンド

|  コマンド  |  機能  |
| ---- | ---- |
| F2 | 新しいウィンドウを開く |
| F3 | 前のウィンドウに移動 |
| F4 | 次のウィンドウに移動 |
| Ctrl + F2 | 横並びに画面分割 |
| Shift + F2 | 縦並びに画面分割 |
| F6 | デタッチ |
| Ctrl + F6 | 現在の分割画面を閉じる |
| F7 | スクロールモードに |
| Shiht + ↑↓←→ | 分割画面間を移動 |
| Shift + F3,F4 | 分割画面間を移動 |
| Ctrl + F3,F4 | 分割画面を入れ替え |
| Shiht + Alt + ↑↓←→ | 分割画面のサイズ変更 |

---

### 全画面にしても画面が小さい時

フルスクリーンにしても、有効な範囲が小さいままの時。

`Alt + F6`で直りました。

---

{{< ad/con/wide/unix >}}

---
