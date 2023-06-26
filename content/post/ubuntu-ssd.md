---
title: "HDDデュアルブート環境でSSDを増設"
date: 2020-09-25T06:57:07+09:00
draft: false
comments: true
toc: true
categories: ["Linux"]
tags: ["Ubuntu", "SSD", "増設", "HDD"]
---

<!--more-->

---

{{< ad/afb/backlog >}}

---

{{< img src="/img/ubuntu.png" >}}

---

### 事前情報

500BGのHDDを使っていたが、この度同容量のSSDを入手したのでこちらに乗り換える。

同容量以上なのでそのままコピーでもいいが、折角なので主利用するUbuntu（とboot領域）のみSSDに移植し、めったに使わないWindowsはHDDに残して容量をのびのび使うことに。

以下、旧HDDが`/dev/sda`, 新SSDが`/dev/sdb`。

#### 旧環境

HDD(500GB)でUbuntu20.04, Windows10のデュアルブート

```
/dev/sda 500GB HDD
├─/dev/sda1
├─/dev/sda2 約100MB /boot/efi
├─/dev/sda3
├─/dev/sda4 約200GB Windows領域
└─/dev/sda5 約250GB Ubuntu領域
```

#### 新環境

SSD(500GB)にUbuntu20.04, HDD(500GB)にWindows10でデュアルブート

HDD(500GB)でUbuntu20.04, Windows10のデュアルブート

```
/dev/sda 500GB HDD
├─/dev/sda1
├─/dev/sda3
├─/dev/sda4 約200GB Windows領域
└─/dev/sda5 約250GB ???

/dev/sdb 500GB SSD
├─/dev/sdb1 約100MB /boot/efi
├─/dev/sdb2 約490GB Ubuntu領域
```

/dev/sdaの空き領域はWindowsを拡張するなり、Ubuntuから外付け的に使うなり、後からのんびり考える。

---

### 実作業

mountして起動中のpartitionを弄ったりコピーしたり、は原則できない。

なのでUbuntuのLIVE USB(or DVD)を作成し、LIVE起動して作業を行う。

参考: [UbuntuのLive USBをつくる](https://blog.mktia.com/how-to-make-ubuntu-live-usb/)

#### SSD上にpartition作成

Ubuntuの`ディスク`からSSD上にpartitionを作成する。

- /dev/sdb1 100MB程度
- /dev/sdb2 490GB程度

`/dev/sdb1`はfat32(efi領域)、`/dev/sdb2`はext4でフォーマットする。

#### GPartedでHDDのpartitionを小さくする

移植時間短縮のため、Ubuntuの`GParted`から、移植するHDD上partitionを縮小する。

`/dev/sda5/`を選択して右クリック→リサイズし、ギリギリ＋αくらいの容量にして「実行」。

#### HDD→SSDにpartition移植

必要なpartition毎にddrescueで移植。

```sh
$ sudo apt update
$ sudo apt install gddrescue

$ sudo ddrescue -v -f -r1 /dev/sdb2 /dev/sdb1
$ sudo ddrescue -v -f -r1 /dev/sdb5 /dev/sdb2
```

#### SSD partitionのUUID変更

UUIDごとコピーされているので、`GParted`から移植先のUUIDを変更する。

`/dev/sdb1`, `/dev/sdb2`を順に選択して右クリック→「新しいUUID」で「実行」。

#### SSDにgrubをインストール

```sh
# Ubuntu領域とboot領域をmount
$ sudo mkdir /mnt/ssd
$ sudo mount /dev/sdb2 /mnt/ssd
$ sudo mount /dev/sdb1 /mnt/ssd/boot/efi

# 必要なディレクトリをmount
$ sudo mount --bind /dev /mnt/ssd/dev &&
> sudo mount --bind /dev/pts /mnt/ssd/dev/pts &&
> sudo mount --bind /proc /mnt/ssd/proc &&
> sudo mount --bind /sys /mnt/ssd/sys

# Ubuntu領域にchrootしてgrubインストール
$ sudo chroot /mnt/ssd

$ grub-install /dev/sdb
$ update-grub
$ exit

# ディレクトリをunmount
$ sudo umount /mnt/ssd/sys &&
> sudo umount /mnt/ssd/proc &&
> sudo umount /mnt/ssd/dev/pts &&
> sudo umount /mnt/ssd/dev
```

#### 起動時にSSD側領域をmountするよう修正

```sh
# SSDUbuntu領域をmount(上で既にしていれば不要)
$ mkdir /mnt/ssd
$ sudo mount /dev/sdb2 /mnt/ssd
# /etc/fstabを書き換え
$ sudo vi /mnt/ssd/etc/fstab
```

mountしているboot領域、Ubuntu領域のUUIDをそれぞれ

`/dev/sdb1`, `/dev/sdb2`のものに書き換える。

念の為HDD側も同様に書き換えた。（不要？）

```sh
# HDDのUbuntu領域をmount
$ mkdir /mnt/hdd
$ sudo mount /dev/sda5 /mnt/hdd
# /etc/fstabを書き換え
$ sudo vi /mnt/ssd/etc/fstab
```

#### GPartedでpartitionを調整

SSDのpartitionが起動できることを確認したうえで、`GParted`でHDD側のpartitionを調整する。

不要なものを削除したり、空いた領域にpartitionを広げたり。

---

### 参考

- [How to Repair, Restore, or Reinstall Grub 2 with a Ubuntu Live CD or USB](https://howtoubuntu.org/how-to-repair-restore-reinstall-grub-2-with-a-ubuntu-live-cd)
- [HDDからSSDへの換装作業ログ](http://www-space.eps.s.u-tokyo.ac.jp/~hirako/memo11.html)
- [UEFIブートでGrubが消えたときにやること(matebook x pro)](https://qiita.com/gpioblink/items/708b2a5add6c854965cf)
- [GRUBとEFIの組み合わせで使うときのメモ またはEFI全般のtips](https://orumin.blogspot.com/2013/01/grubefi.html)

---

{{< ad/a8/techacademy_py_ai >}}

---

{{< ad/a8/techacademy_blockchain >}}

---
