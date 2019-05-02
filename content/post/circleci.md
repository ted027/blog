---
title: "CircleCIでHugoのビルドを自動化した話"
date: 2019-04-19T22:53:43+09:00
draft: false
comments: true
categories: ["Blog"]
tags: ["CI", "CircleCI", "Hugo"]
---

Hugoのビルドとブログの更新を自動で行うようにした。

<!--more-->

---

{{< ad/a8/onamae >}}

---

### ビルドフローが手間

- [[参考記事]Hugo + GitHub Pagesでブログを始めた話](https://www.ted027.com/post/hugo)

現状、手動でビルドしてブログを更新しようとすると以下のような感じ。

1. markdownで記事を書く
2. `hugo`でビルド
3. Hugoのレポジトリをcommit、pushする
4. public(GitHub Pages用のレポジトリ)をcommit、pushする

大した手間ではないが、この手間が原因でブログが終わる予感がする。

2と4は自動化して1と3だけにしたい。

---

### とりあえずシェル

```sh:deploy.sh
set -ex
hugo
cd public
git add .

msg="rebuilding site `date +'%Y-%m-%d %H:%M:%S'`"
git commit -m "$msg"

git push origin master
```

- 参考: https://github.com/uqichi/blog/blob/master/deploy.sh

これで2と4がひと手間になった。

---

### CIで自動化

ひと手間になったが、できればひと手間すらかけたくないので、CIで自動化。

GitHubとの連携が簡単な[CircleCI](https://circleci.com)を使いました。

{{< img src="/img/circleci.png" >}}

1. CircleCIに登録
    - https://circleci.com
    - GitHubアカウント、Bitbucketアカウントで登録できる
    - CIを回したいレポジトリをフォローしておく
        今回はHugoのレポジトリ

2. CircleCI用のSSH Keyを作成
    - ビルドした静的ファイルをGitHub Pagesのレポジトリにpushしたいので必要

    ```sh
    $ ssh-keygen -t rsa -b 4096 -m pem -C "CircleCI" -f id_rsa_circleci -N ""
    ```

3. 公開鍵をGitHubに登録する

4. 秘密鍵をCirCleCIに登録しておく
    - プロジェクト（レポジトリ）横の設定歯車から、`SSH Permissions`を選択し、`Add SSH Key`する

        {{< img src="/img/circleci_ssh.png" >}}

    - 同時に、`Checkout SSH Permissions`から、自動登録されたRead OnlyのKeyを`Remove`する。こちらが優先で使われてしまうため

5. .circleci/config.ymlを書く

    ```:config.yml
    version: 2
    jobs:
    build:
        docker:
        - image: circleci/golang:1.11
        working_directory: ~/work
        steps:
        - add_ssh_keys:
            fingerprints:
                - "YO:UR:FI:NG:ER:PR:IN:T"
        - run:
            name: install hugo
            command: |
                mkdir ~/src; cd $_
                git clone https://github.com/gohugoio/hugo.git
                cd hugo
                go install
        - checkout
        - run:
            name: build
            command: |
                rm -rf public
                git clone git@github.com:[github_user]/[github_user].github.io public
                hugo
        - run:
            name: push
            command: |
                cd public
                git config --global user.name "CircleCI"
                git config --global user.email "circleci@example.com"
                git add --all
                msg="rebuilding site `date`"
                git commit -m "$msg"
                git push origin master

    ```

適当な別ディレクトリ使ってhugoをインストールしてからビルドしてcommit, pushする。

本当はさっきの`deploy.sh`を使ってサラッと書きたかったけど、CIからsubmoduleをpushするところが手元と同じようには動かず、結局publicを消してからcloneしてきてビルドしてpush、という微妙な感じに。

---

何はともあれ、これでHugoのレポジトリをpushすればCIが走って、勝手にブログも更新してくれるようになりました。

この作業が無駄にならないことを祈る。

---

{{< ad/con/wide/devops >}}

---

{{< ad/a8/techacademy>}}

---