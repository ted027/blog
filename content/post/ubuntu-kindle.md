---
title: "Ubuntu 18.04にKindleをインストールした"
date: 2019-04-16T22:34:09+09:00
draft: false
comments: true
categories: ["Linux"]
tags: ["Ubuntu", "インストール", "Kindle", "Wine"]
---

UbuntuにKindleをインストールしようとして苦労したのでメモ。

Ubuntu用のKindle for PCクライアントは無いので、ちょっと手間を掛けてWineというWindowsエミュレータを使ってWindows版をインストールする。

<!--more-->

---

{{< ad/moshimo/kikuchi_bandel >}}

---

### Wineをインストール

1. 32bit版のWineを使えるようにする

    ```sh
    $ sudo dpkg --add-architecture i386
    ```

2. レポジトリを追加

    ```sh
    $ wget -nc https://dl.winehq.org/wine-builds/winehq.key
    $ sudo apt-key add winehq.key
    $ sudo apt-add-repository -y -n https://dl.winehq.org/wine-builds/ubuntu/
    ```

3. Wineをインストール

    ```sh
    $ sudo apt update
    $ sudo apt install winehq-stable
    ```

---

### Wineの設定

1. OSを選択

    ```sh
    $ winecfg
    ```

→ Windows 8.1を選択。10だとうまくいかなかった。

---

### winetricksで表示を直す

このままだと文字化けするので、`winetricks`を使って表示を整える。

1. winetricksをインストール

    ```sh
    $ cd ~/.wine
    $ wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
    $ sudo chmod +x winetricks
    ```

2. 文字化けを直す

    ```sh
    $ sudo sh winetricks allfonts
    $ sudo sh winetricks fontsmooth-rgb
    ```

---

### Kindle for PCをインストール

- https://kindle-for-pc.jp.uptodown.com/windows

起動したら無事読めました。

---

{{< ad/afb/btc >}}

---
