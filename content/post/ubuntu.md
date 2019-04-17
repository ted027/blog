---
title: "OSをUbuntu 18.04 LTSにした時の話"
date: 2019-04-16T12:35:45+09:00
draft: true
comments: true
categories: ["Ubuntu"]
tags: ["Ubuntu", "OS", "セットアップ"]
---

新しいノートPC購入を機に、OSをUbuntu 18.04 LTSにした際の備忘録。

 <!--more-->

### Live USBを作ってインストール
 <!-- - USBをを用意
    - 新品、もしくはデータを消してもいいもの
 - 以下からUbuntuのISOイメージをインストールし、USBに移動
     - https://www.ubuntulinux.jp/download/ja-remix
 - 新品でなければ、USBをフォーマットする
 - ISOファイルをUSBに書き込むためのソフトをダウンロードする
     - [Universal USB Installer](https://universal-usb-installer.jp.uptodown.com/windows)とか -->

以下のサイトを参考

 - [UbuntuのLive USBをつくる](https://blog.mktia.com/how-to-make-ubuntu-live-usb/)

### 自分好みに設定を弄る

 - [Ubuntu 18.04 LTSをインストールした直後に行う設定 & インストールするソフト](https://sicklylife.jp/ubuntu/1804/settings.html)
 - 項目すごく多いですが、とりあえず日本語フォントとChrome, Java, LibreOfficeあたりは入れてあとはお好みで
 - ぷろぐらむするひとならVisual Studio Codeも

### byobuを入れる

仮想端末ソフト。画面分割等機能が多彩で使いやすいです。

 - [Linuxでシェルを使うなら「Byobu」をフル活用しよう！](https://linuxfan.info/terminal-with-byobu)
 - 

### Albertを入れる

設定したホットキーでアプリの起動とか検索ができます。

 - [Linuxでアプリの起動やファイル検索などができる軽快なランチャー"Albert"](http://ich.hatenadiary.com/entry/launcher_on_ubuntu)

### LINEを入れる

Ubuntu用のクライアントは無いですが、Google ChromeやChromiumの拡張機能として提供されています。

 - https://chrome.google.com/webstore/detail/line/ophjlpahpchlmihnnnihgmmeilfjmjjc

### Kindleを入れる

Ubuntu用のクライアントは無いです。少々面倒ですがwineというwindowsエミュレータを使ってwindows版をインストールします。

 - [Ubuntu18.04にKindle for PCをインストールした](https://qiita.com/sakai39e/items/75b2c95bc4c3cab13849)
 - Windows8.1じゃないとうまく動かなかったです
