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

<a href="https://t.afi-b.com/visit.php?guid=ON&a=C9511S-p324426y&p=J690746r" target="_blank" rel="nofollow"><img src="https://www.afi-b.com/upload_image/9511-1526313401-3.gif" width="728" height="90" style="border:none;" alt="フォスターフリーランス" /></a><img src="https://t.afi-b.com/lead/C9511S/J690746r/p324426y" width="1" height="1" style="border:none;" />

---

### ビルドフローが手間

- [※ Hugo + GitHub Pagesでブログを始めた話](https://www.ted027.com/post/hugo)

現状、手動でビルドしてブログを更新しようとすると以下のような感じ。

1. markdownで記事を書く
2. `hugo`でビルド
3. Hugoのレポジトリをcommit、pushする
4. public(GitHub Pages用のレポジトリ)をcommit、pushする

大した手間ではないが、この手間が原因でブログが終わる予感がする。

2と4は自動化して1と3だけにしたい。

---

### とりあえずシェル

```deploy.sh
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

    ```
    $ ssh-keygen -t rsa -b 4096 -m pem -C "CircleCI" -f id_rsa_circleci -N ""
    ```

3. 公開鍵をGitHubに登録する

4. 秘密鍵をCirCleCIに登録しておく
    - プロジェクト（レポジトリ）横の設定歯車から、`SSH Permissions`を選択し、`Add SSH Key`する

        {{< img src="/img/circleci_ssh.png" >}}

    - 同時に、`Checkout SSH Permissions`から、自動登録されたRead OnlyのKeyを`Remove`する。こちらが優先で使われてしまうため

5. .circleci/config.ymlを書く

    ```config.yml
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

<div class="kaerebalink-box" style="text-align:left;padding-bottom:20px;font-size:small;zoom: 1;overflow: hidden;">
    <div class="kaerebalink-image" style="float:left;margin:0 15px 10px 0;"><a
            href="//af.moshimo.com/af/c/click?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062&amp;url=https%3A%2F%2Fwww.amazon.co.jp%2FEffective-DevOps-%25E2%2580%25954%25E6%259C%25AC%25E6%259F%25B1%25E3%2581%25AB%25E3%2582%2588%25E3%2582%258B%25E6%258C%2581%25E7%25B6%259A%25E5%258F%25AF%25E8%2583%25BD%25E3%2581%25AA%25E7%25B5%2584%25E7%25B9%2594%25E6%2596%2587%25E5%258C%2596%25E3%2581%25AE%25E8%2582%25B2%25E3%2581%25A6%25E6%2596%25B9-Jennifer-Davis%2Fdp%2F4873118352"
            target="_blank" rel="nofollow"><img
                src="https://images-fe.ssl-images-amazon.com/images/I/51hSE7AENQL._SL160_.jpg"
                style="border: none;" /></a><img
            src="///i.moshimo.com/af/i/impression?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062" width="1" height="1"
            style="border:none;"></div>
    <div class="kaerebalink-info" style="line-height:120%;zoom: 1;overflow: hidden;">
        <div class="kaerebalink-name" style="margin-bottom:10px;line-height:120%"><a
                href="//af.moshimo.com/af/c/click?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062&amp;url=https%3A%2F%2Fwww.amazon.co.jp%2FEffective-DevOps-%25E2%2580%25954%25E6%259C%25AC%25E6%259F%25B1%25E3%2581%25AB%25E3%2582%2588%25E3%2582%258B%25E6%258C%2581%25E7%25B6%259A%25E5%258F%25AF%25E8%2583%25BD%25E3%2581%25AA%25E7%25B5%2584%25E7%25B9%2594%25E6%2596%2587%25E5%258C%2596%25E3%2581%25AE%25E8%2582%25B2%25E3%2581%25A6%25E6%2596%25B9-Jennifer-Davis%2Fdp%2F4873118352"
                target="_blank" rel="nofollow">Effective DevOps 4本柱による持続可能な組織文化の育て方 [ Jennifer Davis ]</a><img
                src="///i.moshimo.com/af/i/impression?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062" width="1" height="1"
                style="border:none;">
        </div>
        <div class="kaerebalink-detail" style="margin-bottom:5px;"></div>
        <div class="kaerebalink-link1" style="margin-top:10px;">
            <div class="shoplinkamazon"
                style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 0 no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;">
                <a href="//af.moshimo.com/af/c/click?a_id=1414800&p_id=170&pc_id=185&pl_id=4062&s_v=b5Rz2P0601xu&url=https%3A%2F%2Fwww.amazon.co.jp%2Fgp%2Fsearch%3Fkeywords%3DDevOps%26__mk_ja_JP%3D%25E3%2582%25AB%25E3%2582%25BF%25E3%2582%25AB%25E3%2583%258A"
                    target="_blank" rel="nofollow">Amazonで調べる</a><img
                    src="//i.moshimo.com/af/i/impression?a_id=1414800&p_id=170&pc_id=185&pl_id=4062" width="1"
                    height="1" style="border:none;"></div>
            <div class="shoplinkrakuten"
                style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 -50px no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;">
                <a href="//af.moshimo.com/af/c/click?a_id=1414727&p_id=54&pc_id=54&pl_id=616&s_v=b5Rz2P0601xu&url=https%3A%2F%2Fsearch.rakuten.co.jp%2Fsearch%2Fmall%2FDevOps%2F-%2Ff.1-p.1-s.1-sf.0-st.A-v.2%3Fx%3D0"
                    target="_blank" rel="nofollow">楽天市場で調べる</a><img
                    src="//i.moshimo.com/af/i/impression?a_id=1414727&p_id=54&pc_id=54&pl_id=616" width="1" height="1"
                    style="border:none;"></div>
            <div class="shoplinkyahoo"
                style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 -150px no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;">
                <a href="//af.moshimo.com/af/c/click?a_id=1418766&p_id=1225&pc_id=1925&pl_id=18502&s_v=b5Rz2P0601xu&url=http%3A%2F%2Fsearch.shopping.yahoo.co.jp%2Fsearch%3Fp%3DDevOps"
                    target="_blank" rel="nofollow">Yahooショッピングで調べる</a><img
                    src="//i.moshimo.com/af/i/impression?a_id=1418766&p_id=1225&pc_id=1925&pl_id=18502" width="1"
                    height="1" style="border:none;"></div>
            <div class="shoplinkseven"
                style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 -100px no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;">
                <a href="//af.moshimo.com/af/c/click?a_id=1414728&p_id=932&pc_id=1188&pl_id=12456&s_v=b5Rz2P0601xu&url=http%3A%2F%2F7net.omni7.jp%2Fsearch%2F%3Fkeyword%3DDevOps%26searchKeywordFlg%3D1"
                    target="_blank"
                    rel="nofollow"><img src="//i.moshimo.com/af/i/impression?a_id=1414728&p_id=932&pc_id=1188&pl_id=12456" width="1" height="1" style="border:none;">7netで調べる
                        </a> </div> </div> </div> <div class="booklink-footer" style="clear: left"></div>
        </div>

---
