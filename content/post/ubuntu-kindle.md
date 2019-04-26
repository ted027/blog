---
title: "Ubuntu 18.04にKindleをインストールした話"
date: 2019-04-16T22:34:09+09:00
draft: false
comments: true
categories: ["Ubuntu"]
tags: ["Ubuntu", "Kindle", "Wine", "Linux"]
---

UbuntuにKindleをインストールしようとして苦労したのでメモ。

Ubuntu用のKindle for PCクライアントは無いので、ちょっと手間を掛けてWineというWindowsエミュレータを使ってWindows版をインストールする。

 <!--more-->

---

<a href="https://t.afi-b.com/visit.php?guid=ON&a=C9511S-D324435S&p=J690746r" target="_blank" rel="nofollow"><img src="https://www.afi-b.com/upload_image/9511-1520235201-3.gif" width="728" height="90" style="border:none;" alt="フォスターフリーランス" /></a><img src="https://t.afi-b.com/lead/C9511S/J690746r/D324435S" width="1" height="1" style="border:none;" />

---

### Wineをインストール

1. 32bit版のWineを使えるようにする

    ```
    $ sudo dpkg --add-architecture i386
    ```

2. レポジトリを追加

    ```
    $ wget -nc https://dl.winehq.org/wine-builds/winehq.key
    $ sudo apt-key add winehq.key
    $ sudo apt-add-repository -y -n https://dl.winehq.org/wine-builds/ubuntu/
    ```

3. Wineをインストール

    ```
    $ sudo apt update
    $ sudo apt install winehq-stable
    ```

---

### Wineの設定

1. OSを選択

    ```
    $ winecfg
    ```

→ Windows 8.1を選択。10だとうまくいかなかった。

---

### winetricksで表示を直す

このままだと文字化けするので、`winetricks`を使って表示を整える。

1. winetricksをインストール

    ```
    $ cd ~/.wine
    $ wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
    $ sudo chmod +x winetricks
    ```

2. 文字化けを直す

    ```
    $ sudo sh winetricks allfonts
    $ sudo sh winetricks fontsmooth-rgb
    ```

---

### Kindle for PCをインストール

- https://kindle-for-pc.jp.uptodown.com/windows

起動したら無事読めました。

---

<a href="https://t.afi-b.com/visit.php?guid=ON&a=M10262Q-X351704n&p=J690746r" target="_blank" rel="nofollow"><img src="https://www.afi-b.com/upload_image/10262-1549272488-3.jpg" width="728" height="90" style="border:none;" alt="BTCエージェント forエンジニア" /></a><img src="https://t.afi-b.com/lead/M10262Q/J690746r/X351704n" width="1" height="1" style="border:none;" />

---
