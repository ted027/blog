---
title: "git revertもろもろ"
date: 2020-09-14T21:34:59+09:00
draft: false
comments: true
toc: true
categories: ["Git"]
tags: ["revert", "マージコミット"]
---

<!--more-->

---

{{< ad/a8/techacademy >}}

---

### 概要

gitでコミットを取り消したい時、resetかrevertを行う。

ただ、resetだと取り消したことがコミットログに残らない。

なので、特にリモート側を弄る場合、revertを使う方が推奨される。

```sh
# 直前のコミット打ち消し
$ hit revert HEAD

# 特定のコミット打ち消し
$ git revert {commit_id}
```

---

### 範囲を指定してrevert

`..`で繋げば範囲指定が出来る。

ただし、**始点に指定したコミットIDの次のコミット**からrevertする。

```sh
# commit_id1の次のコミットからcommit_id2までをrevertする
$ git revert {commit_id1}..{commit_id2}

# commit_id1からcommit_id2までをrevertする
$ git revert {commit_id1}^..{commit_id2}
```

### マージコミットのrevert

マージコミットは親ブランチが2つあるため、どちらとの差分をrevertするか指定する。

マージされたメイン側ブランチに生じた差分をrevertする場合、

```sh
$ git revert -m 1 {commit_id}
```

逆にマージした派生側ブランチに生じた差分をrevertする場合、

```sh
$ git revert -m 2 {commit_id}
```

となる。

---

- [git cherry-pickもろもろ](https://www.ted027.com/post/git-cherry-pick)

---

{{< ad/con/wide/unix >}}

---

{{< ad/a8/techacademy_py_ai >}}

---

{{< ad/a8/techacademy_blockchain >}}

---
