---
title: "'The ECDSA host key has changed'の対処"
date: 2019-07-01T12:27:50+09:00
draft: false
comments: true
toc: false
categories: ["Git"]
tags: ["ssh", "GitHub"]
---

sshでリモート側と通信しようとする時に表題のエラーが出ることがある。

<!--more-->

---

{{< ad/afb/codecamp >}}

---

ホスト側の環境が変わったりした際に起きるエラー。

```sh
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!     @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!
Someone could be eavesdropping on you right now (man-in-the-middle attack)!
It is also possible that a host key has just been changed.
The fingerprint for the ECDSA key sent by the remote host is
...
```

`~/.ssh/known_host`の情報と整合が取れない、といって弾かれてしまう。

`~/.ssh/known_host`を直接弄るのは非推奨で、以下のコマンドで該当のホストを削除できる。

```sh
$ ssh-keygen -R {hostname}
```

- 参考
  - [SSHでホストキーが変わった後の接続](https://www.uramiraikan.net/Works/entry-1970.html)

---

{{< ad/con/wide/unix >}}

---

{{< ad/a8/techacademy >}}

---
