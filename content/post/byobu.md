---
title: "byobuでよく使うコマンドの話"
date: 2019-04-19T12:41:06+09:00
draft: false
comments: true
categories: ["Shell"]
tags: ["Shell", "Byobu", "コマンド"]
---

仮想端末ソフトbyobuの導入やよく使うコマンドについてのメモ。

 <!--more-->

 ___

 <a href="https://t.afi-b.com/visit.php?guid=ON&a=99886h-W336947J&p=J690746r" target="_blank" rel="nofollow"><img src="https://www.afi-b.com/upload_image/9886-1534983315-3.jpg" width="728" height="90" style="border:none;" alt="CodeCampGATE" /></a><img src="https://t.afi-b.com/lead/99886h/J690746r/W336947J" width="1" height="1" style="border:none;" />

 ___

### About

- [Byobu](http://byobu.co/)
    - オープンソースの仮想端末ソフト。画面分割やら移動やらが楽で重宝してます。

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
| Shift + F3,F4 | 分割画面を入れ替え |
| Ctrl + F3,F4 | 分割画面を入れ替え |
| Shiht + Alt + ↑↓←→ | 分割画面のサイズ変更 |

### 全画面にしても画面が小さい時

自分は最初、フルスクリーンにしても有効な画面が小さいままでした。

`Alt + F6`で直りました。

___

<a target="_blank" href="//af.moshimo.com/af/c/click?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062&amp;url=https%3A%2F%2Fwww.amazon.co.jp%2F%25E9%259B%25A3%25E8%25AA%25AD%25E5%258C%2596%25E3%2582%25B7%25E3%2582%25A7%25E3%2583%25AB%25E8%258A%25B8%25E3%2581%25AE%25E4%25B8%2596%25E7%2595%258C-~Bash%25E3%2581%25A8%25E3%2581%2599%25E3%2581%25A6%25E3%2581%258D%25E3%2581%25AA%25E9%259B%25A3%25E8%25AA%25AD%25E5%258C%2596~-%25E3%2583%2597%25E3%2583%25AC%25E3%2583%259F%25E3%2582%25A2%25E3%2583%25A0%25E3%2583%2596%25E3%2583%2583%25E3%2582%25AF%25E3%2582%25B9%25E7%2589%2588-kanata%2Fdp%2F4839969698" rel="nofollow"><img src="https://images-fe.ssl-images-amazon.com/images/I/51RCL5l5AnL._SL160_.jpg" alt="" style="border: none;" /><br />難読化シェル芸の世界 ~Bashとすてきな難読化~ (プレミアムブックス版)</a><img src="//i.moshimo.com/af/i/impression?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062" alt="" width="1" height="1" style="border: 0px;" />

___
