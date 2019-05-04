---
title: "Gitでよく使うコマンド集"
date: 2019-05-04T13:18:18+09:00
draft: false
comments: true
categories: ["Git"]
tags: ["Shell", "Git"]
---

コマンドでのgit管理で基本的なもの、よく使うものをまとめた。

<!--more-->

---

{{< ad/a8/techacademy>}}

---

### 基本設定

```sh
$ git config --global user.name "name"
$ git config --global user.email "your@email.address"
```

---

### リモートにあるプロジェクトをローカルにコピーする

- リモートからcloneする

```sh
$ git clone https://github.com/{user}/{project}.git
```

---

### ローカルにあるプロジェクトをgit管理としリモートに上げる

- カレントディレクトリをgit管理する

```sh
$ git init
```

- カレントディレクトリのファイルをgit管理に追加する

```sh
$ git add .             # カレントディレクトリの全ファイル
$ git add {file.name}   # カレントディレクトリの特定ファイル
```

- 変更をcommitする

```sh
$ git commit -m "commit message"
```

- リモートを追加しpushする

```sh
$ git remote add origin https://github.com/{user}/{project}.git
$ git push -u origin master
```

---

### ローカルの変更をリモートに反映させる

- リモートの変更を取得する

```sh
$ git pull
```

- ブランチを作成する・切り替える

```sh
$ git branch {branch_name]      # 作成
$ git checkout {branch_name]    # 切り替え

$ git checkout -b {branch_name] # 作成 & 切り替え
```

- 編集したファイルをgit管理に追加する

```sh
$ git add .             # カレントディレクトリの全ファイル
$ git add {file.name}   # カレントディレクトリの特定ファイル
```

- 変更をcommitする

```sh
$ git commit -m "commit message"
```

- リモートにpushする

```sh
$ git push -u origin {branch_name}
```

---

### ブランチ間で変更を反映する

- commit履歴を見る

```sh
$ git log
```

- 他ブランチへの特定のcommitを取り込む

```sh
$ git cherry-pick {commit_id}
```

- 作業環境に別のブランチをマージする

```sh
$ git merge {branch_name}           # ローカルブランチ
$ git merge origin/{branch_name}    # リモートブランチ
```

---

### 作業を取り消す

- addを取り消す

```sh
$ git reset .             # カレントディレクトリ以下の更新のaddを取り消し
$ git reset {file.name}   # 特定ファイルの更新のaddを取り消し
```

- commitを取り消す

```sh
$ git reset --hard HEAD^    # 直前のコミットを取り消し、ワークディレクトリも書き換える
$ git reset --soft HEAD^    # 直前のコミットを取り消す、ワークディレクトリはそのまま

$ git reset --hard {commit_id}    # 特定のコミットを取り消し、ワークディレクトリも書き換える
$ git reset --soft {commit_id}    # 特定のコミットを取り消す、ワークディレクトリはそのまま
```

`commit id`でなく、`HEAD~{n}`で、n個前のcommitを指定することもできる。

- pushを取り消す

```sh
$ git reset --hard {commit_id}
$ git push -f
```

---

### 作業中の変更を一時的に退避させる

- 作業中の変更を退避させる

```sh
$ git stash save
```

- 退避させた作業中の変更一覧を確認

```sh
$ git stash list
```

- 退避させた作業中の変更一覧を確認

```sh
$ git stash apply {stash_name}
```

- 退避させた作業中の変更を削除

```sh
$ git stash drop {stash_name}   # 特定のstashを削除
$ git stash clear               # 全stashを削除
```

---

### その他

- コミットメッセージを変更する

```sh
$ git commit --amend "new commit message"
```

- ファイルをgit管理から外す

一度git管理したファイルは.gitignoreに追加しただけではgit管理から外れないので、これをする必要がある。

```sh
$ git rm -f {file.name}
```

- ブランチを比較する

```sh
$ git diff {branch_name1} {branch_name2}
```

- ブランチを削除する

```sh
$ git branch -d {branch_name}
```

---

{{< ad/con/wide/unix >}}

---

{{< ad/a8/techacademy2>}}

---