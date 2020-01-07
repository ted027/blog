---
title: "Ubuntu-Windows間のリモート接続"
date: 2020-01-07T23:07:45+09:00
draft: false
comments: true
toc: true
categories: [”Linux”]
tags: ["Windows", "リモート", "Remmina"]
---

<!--more-->

---

{{< ad/a8/techstars >}}

---

### Ubuntu → Windowsにリモート接続

デフォルトで入っている`Remmina`を使う。

入っていなければ`apt`でインストール。

```sh
$ sudo apt-add-repository ppa:remmina-ppa-team/remmina-next
$ sudo apt update
$ sudo apt install remmina remmina-plugin-rdp remmina-plugin-secret
```

{{< img src="/img/remmina-1.png" >}}

`Remmina`を起動したら、左上の「+」から設定を作成。

{{< img src="/img/remmina-2.png" >}}

プロトコル`RDP`を選択すれば、Windowsのリモートデスクトッププロトコルを利用して接続できる。

サーバー（接続先）と、サーバーのログインユーザー、パスワードを入力。

解像度や色数は適当に選んで、`保存して接続 (Save and Connect)`あたりを選択する。

問題なければリモート接続できるはず。

---

### Windows → Ubuntuにリモート接続

こっちは普通にsshで繋げばいいような気がしますが、GUIのサーバーを使っている場合もあるかと思うので。

#### Ubuntuの画面表示準備

先に接続先のUbuntu側で設定。

`xrdp`と`lxde`をインストールし、`.xsession`ファイルを作成。

```sh
$ sudo apt install xrdp lxde
$
$ echo lxsession -s LXDE -e LXDE > ~/.xsession
```

セキュリティ設定を編集し、`xrdp`を再起動。

```sh
$ gsettings set org.gnome.Vino require-encryption false
$ sudo systemctl restart xrdp
```

---

#### Ubuntuのリモート許可設定

続いて、Ubuntuメニューから「デスクトップの共有」を検索し開く。

画面上部のトグルをONにしてから「画面共有」を開き、この上部のトグルもONにする。

{{< img src="/img/ubuntu-remote1.png" >}}

{{< img src="/img/ubuntu-remote2.png" >}}

---

#### Windowsからリモートアクセス

接続したいWindows PCで「リモートデスクトップ」を開き、接続先IPを入力して接続。

`xrdp`のログイン画面が表示されたら、Ubuntuサーバーのユーザー名とパスワードを入力しログイン。

---

### 参考

- http://watarisein.hatenablog.com/entry/2017/06/24/235551
- https://own-search-and-study.xyz/2017/07/22/windows10%E3%81%A8ubuntu16-04%E3%82%92%E3%83%AA%E3%83%A2%E3%83%BC%E3%83%88%E3%83%87%E3%82%B9%E3%82%AF%E3%83%88%E3%83%83%E3%83%97%E6%8E%A5%E7%B6%9A%E3%81%A7%E8%A1%8C%E3%81%8D%E6%9D%A5%E3%81%99%E3%82%8B/

---

{{< ad/a8/techacademy >}}

---
