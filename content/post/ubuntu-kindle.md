---
title: "Ubuntu 18.04にKindleをインストールした話"
date: 2019-04-16T22:34:09+09:00
draft: false
comments: true
categories: ["Ubuntu"]
tags: ["Ubuntu", "Kindle", "Wine"]
---

UbuntuにKindleをインストールしようとして苦労したのでメモ。

Ubuntu用のKindle for PCクライアントはありません。なので、少々面倒ですがwineというwindowsエミュレータを使ってwindows版をインストールします。

 <!--more-->

___

 <a href="https://t.afi-b.com/visit.php?guid=ON&a=z10341W-l353325a&p=J690746r" target="_blank" rel="nofollow"><img src="https://www.afi-b.com/upload_image/10341-1547340072-3.jpg" width="468" height="60" style="border:none;" alt="若手向け" /></a><img src="https://t.afi-b.com/lead/z10341W/J690746r/l353325a" width="1" height="1" style="border:none;" />

___

### Wineをインストール

1. 32bit版のWineを使えるようにする

    ```
    sudo dpkg --add-architecture i386
    ```

2. レポジトリを追加

    ```
    wget -nc https://dl.winehq.org/wine-builds/winehq.key
    sudo apt-key add winehq.key
    sudo apt-add-repository -y -n https://dl.winehq.org/wine-builds/ubuntu/
    ```

3. Wineをインストール

    ```
    sudo apt update
    sudo apt install winehq-stable
    ```

### Wineの設定

1. OSを選択

    ```
    winecfg
    ```

→ Windows 8.1を選択。10だとうまくいかなかったです。

### winetricksで表示を直す

このままだと文字化けしちゃうので、Wineの諸々を簡単にインストールできるスクリプト、`winetricks`を使って表示を整えます。

1. winetricksをインストール

    ```
    cd ~/.wine
    wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
    sudo chmod +x winetricks
    ```

2. 文字化けを直す

    ```
    sudo sh winetricks allfonts
    sudo sh winetricks fontsmooth-rgb
    ```

### Kindle for PCをインストール

- https://kindle-for-pc.jp.uptodown.com/windows

起動したら無事読めました。

___

<a href="https://t.afi-b.com/visit.php?guid=ON&a=99886h-W336947J&p=J690746r" target="_blank" rel="nofollow"><img src="https://www.afi-b.com/upload_image/9886-1534983315-3.jpg" width="728" height="90" style="border:none;" alt="CodeCampGATE" /></a><img src="https://t.afi-b.com/lead/99886h/J690746r/W336947J" width="1" height="1" style="border:none;" />

___
