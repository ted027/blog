---
title: "git cherry-pickいろいろ"
date: 2019-09-27T12:34:38+09:00
draft: false
comments: true
toc: true
categories: ["Git"]
tags: ["cherry-pick", "マージコミット"]
---

<!--more-->

---

{{< ad/a8/techacademy >}}

---

### 概要

gitでコミットを他のブランチにも反映させる際に`cherry-pick`(摘み食い)のコマンドを使う。

---

### 通常のcherry-pick

1. 取り込むコミットIDを調べる

```sh
$ git log
```

もしくは、GitHubやGitLabのUI上でコミット履歴から調べられる。

2. 取り込む

```sh
$ git cherry-pick {commit_id}
```

---

### 範囲を指定してcherry-pick

コミットをまとめて取り込むときは範囲指定が出来る。

ただし、**始点に指定したコミットIDの次のコミット**から取り込むので注意する。

```sh
# commit_id1の次のコミットからcommit_id2までを取り込む
git cherry-pick {commit_id1}..{commit_id2}
```

`^`をつけると「一つ前のコミット」を指定できるので、commit_id1から取り込む場合は以下のように指定する。

```sh
# commit_id1の次のコミットからcommit_id2までを取り込む
$ git cherry-pick {commit_id1}^..{commit_id2}
```

---

### マージコミットのcherry-pick

コミットをまとめて取り込むために、マージコミットを取り入れたいことがある。ただし、マージコミットを普通にcherry-pickしようとすると失敗する。

```sh
$ git cherry-pick {commit_id}
error: commit {commit_id} is a merge but no -m option was given.
fatal: cherry-pick failed
```

マージによって、マージされた側ブランチに生じた差分を取り込む場合、以下のように`m`オプションを指定すれば良い。

```sh
$ git cherry-pick -m 1 {commit_id}
```

#### 解説

理由は、マージコミットには2つのブランチを統合しているため親コミットが2つ存在し、どちらの親との差分を取り込めばいいかわからないため。

`git log`でマージコミットを確認すると、`Merge`欄に2つの親コミットが表示される。

```sh
$ git log {commit_id} # <- マージコミット

commit {commit_id}(branch_name)
**Merge: {parent_id1} {parent_id2}**
Author: John Doe <john.doe@mail.con>
Date:   Fri Sep 27 00:00:00 2019 +0000
...
```

`-m`(`--mainline`)オプションの後に数字を指定すると、何番目の親との差分を取り込むか指定できる（`-m 1`なら{parent_id1}との差分、`-m 2`なら{parent_id2}との差分を取り込む）。

マージコミットを取り込む時、多くの場合、マージされる側（{parent_id1}）に生じる変更を取り込みたいはず。なので上に書いたように、

```sh
$ git cherry-pick -m 1 {commit_id}
```

となる。

---

{{< ad/con/wide/unix >}}

---

{{< ad/a8/techacademy2 >}}

---
