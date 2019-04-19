---
title: "Hugo + GitHub Pagesでブログを始めた話"
date: 2019-04-15T11:20:46+09:00
draft: false
comment: true
categories: ["Hugo"]
tags: ["GitHub Pages", "Hugo", "Ubuntu"]
---

[Hugo](https://gohugo.io/) + [GitHub Pages](https://pages.github.com/)でブログ始めてみました。

ほんのりエンジニアっぽいブログを書きたいなあ、とふと思い立ったので。

 <!--more-->

 ___

 <!-- <a href="https://t.afi-b.com/visit.php?guid=ON&a=z10341W-l353325a&p=J690746r" target="_blank" rel="nofollow"><img src="https://www.afi-b.com/upload_image/10341-1547340072-3.jpg" width="468" height="60" style="border:none;" alt="若手向け" /></a><img src="https://t.afi-b.com/lead/z10341W/J690746r/l353325a" width="1" height="1" style="border:none;" /> -->

<div class="kaerebalink-box" style="text-align:left;padding-bottom:20px;font-size:small;zoom: 1;overflow: hidden;"><div class="kaerebalink-image" style="float:left;margin:0 15px 10px 0;"><a href="//af.moshimo.com/af/c/click?a_id=1414727&p_id=54&pc_id=54&pl_id=616&s_v=b5Rz2P0601xu&url=https%3A%2F%2Fproduct.rakuten.co.jp%2Fproduct%2F-%2Feb8b32333d64562655cda79a3ccf1de0%2F" target="_blank" rel="nofollow" ><img src="https://thumbnail.image.rakuten.co.jp/ran/img/4001/0000/192/876/027/370/40010000192876027370_1.jpg?_ex=320x320" style="border: none;" /></a><img src="//i.moshimo.com/af/i/impression?a_id=1414727&p_id=54&pc_id=54&pl_id=616" width="1" height="1" style="border:none;"></div><div class="kaerebalink-info" style="line-height:120%;zoom: 1;overflow: hidden;"><div class="kaerebalink-name" style="margin-bottom:10px;line-height:120%"><a href="//af.moshimo.com/af/c/click?a_id=1414727&p_id=54&pc_id=54&pl_id=616&s_v=b5Rz2P0601xu&url=https%3A%2F%2Fproduct.rakuten.co.jp%2Fproduct%2F-%2Feb8b32333d64562655cda79a3ccf1de0%2F" target="_blank" rel="nofollow" >ASUS ZENBOOK UX430UN-8550 CORE i7 16,384.0MB 512.0GB</a><img src="//i.moshimo.com/af/i/impression?a_id=1414727&p_id=54&pc_id=54&pl_id=616" width="1" height="1" style="border:none;"><div class="kaerebalink-powered-date" style="font-size:8pt;margin-top:5px;font-family:verdana;line-height:120%">posted with <a href="https://kaereba.com" rel="nofollow" target="_blank">カエレバ</a></div></div><div class="kaerebalink-detail" style="margin-bottom:5px;"></div><div class="kaerebalink-link1" style="margin-top:10px;"><div class="shoplinkrakuten" style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 -50px no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;"><a href="//af.moshimo.com/af/c/click?a_id=1414727&p_id=54&pc_id=54&pl_id=616&s_v=b5Rz2P0601xu&url=https%3A%2F%2Fsearch.rakuten.co.jp%2Fsearch%2Fmall%2Fasus%2520zenbook%2F-%2Ff.1-p.1-s.1-sf.0-st.A-v.2%3Fx%3D0" target="_blank" rel="nofollow" >楽天市場で調べる</a><img src="//i.moshimo.com/af/i/impression?a_id=1414727&p_id=54&pc_id=54&pl_id=616" width="1" height="1" style="border:none;"></div><div class="shoplinkamazon" style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 0 no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;"><a href="//af.moshimo.com/af/c/click?a_id=1414800&p_id=170&pc_id=185&pl_id=4062&s_v=b5Rz2P0601xu&url=https%3A%2F%2Fwww.amazon.co.jp%2Fgp%2Fsearch%3Fkeywords%3Dasus%2520zenbook%26__mk_ja_JP%3D%25E3%2582%25AB%25E3%2582%25BF%25E3%2582%25AB%25E3%2583%258A" target="_blank" rel="nofollow" >Amazonで調べる</a><img src="//i.moshimo.com/af/i/impression?a_id=1414800&p_id=170&pc_id=185&pl_id=4062" width="1" height="1" style="border:none;"></div><div class="shoplinkseven" style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 -100px no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;"><a href="//af.moshimo.com/af/c/click?a_id=1414728&p_id=932&pc_id=1188&pl_id=12456&s_v=b5Rz2P0601xu&url=http%3A%2F%2F7net.omni7.jp%2Fsearch%2F%3Fkeyword%3Dasus%2520zenbook%26searchKeywordFlg%3D1" target="_blank" rel="nofollow" ><img src="//i.moshimo.com/af/i/impression?a_id=1414728&p_id=932&pc_id=1188&pl_id=12456" width="1" height="1" style="border:none;">7netで調べる</a></div></div></div><div class="booklink-footer" style="clear: left"></div></div>

___

## Hugo

- https://gohugo.io/

静的サイトジェネレータ。テーマが豊富。

自分はUbuntu 18.04を使っているのですが、aptだとバージョンが古かったのでsnapで入れました。

### 導入

```
sudo snap install hugo --channel=extended
cd /usr/bin
sudo ln -s /snap/bin/hugo hugo
```

___

## GitHub Pages

- https://pages.github.com/

GitHub上の静的ファイルをwebページとして公開する機能。

markdownでブログとか書きたいなーと思っていたのでちょうど良さそう。

Hugoで生成したファイルをGitHub Pagesで公開する感じ。

### 導入

1. GitHubでレポジトリを作る
 - レポジトリ名は、`[ユーザ名].github.io`にする
2. このリポジトリ上の静的ファイルが`https://[ユーザ名].github.io`に公開される

___

## Hugo + GitHub Pagesでブログを始める話

### GitHub上にレポジトリを2つ用意
 - blog
     - hugoのソースや記事のmdファイルを配置するレポジトリ
 - [GitHubのユーザ名].github.io
     - この名前で作る
     - 静的ファイルを配置するレポジトリ

### Hugoで静的サイトを作成

```
hugo new site blog
cd blog
```

### Hugoの設定

1. テーマを入れる
 - [テーマ一覧](https://themes.gohugo.io/)から気に入ったのを選ぶ
     - 「Demo」を押すとサンプルとか見れて楽しい
 - `blog/thmem`以下にテーマを落とす

        ```
        cd themes
        git clone https://github.com/[好きなテーマ]
        cd ../
        ```

2. Hugoの設定ファイルを編集する
 - `blog/config.toml`を編集
 - これ以外にもテーマによって設定項目が色々ありますが、テーマのページを見ると大抵書いてあります

        ```
        baseURL = "https://[GitHubのユーザ名].github.io/"
        languageCode = "ja"
        title = "My Blog"
        theme = "[好きなテーマ]"
        ```

### 記事を作成

```
hugo new post/first.md
```

こんな記事ができる。

```
---
title: "First"
date: 2019-04-15T00:00:00+09:00
draft: true
---
```

 - `draft: true`だと未公開になるので、公開する際はfalseに
 - markdownで好きなように記事を書く
     - ちなみに、記事のデフォルト項目は`archetypes/default.md`で弄れます

### ローカルサーバで確認

`hugo server --buildDrafts --watch`

 - `--buildDrafts`をつけると`draft: true`の記事もプレビューできます
 - `--watch`をつけておくと記事を更新するたびにプレビューも更新されます
 - http://localhost:1313 で確認

 `hugo`コマンドでビルドし公開用ディレクトリが作成されますが、その前にGihHub側を準備します

### GitHubに公開

1. 「blog」を上げる

    ```
    git init
    git remote add origin git@github.com:[GitHubのユーザ名]/blog.git
    git add -A
    git commit -m "initial commit"
    git push origin master
    ```

2. 「blog」の公開用ディレクトリをサブモジュール化する
 - `hugo`でビルドすると、`blog/public`に公開用ファイル一式が作成されます
 - なので、`[GitHubのユーザ名].github.io`レポジトリをサブモジュールとして`blog/public`に追加しておくと、ビルドしてpushするだけで、GitHub Pagesを使ってブログが公開できます

    ```
    git submodule add git@github.com:[GitHubのユーザ名]/[GitHubのユーザ名].github.io.git public
    ```

3. ビルドして公開

    ```
    hugo
    git add -A
    git commit -m "initial commit"
    git push origin master
    ```

少し待って`https://[ユーザ名].github.io`にアクセスすると公開されてるはず。

___

## おわりに

自動化とか諸々はまたの機会に。

以下参考サイト

- https://uqichi.net/posts/github-pages-x-hugo/
- https://qiita.com/h6m3_u/items/5893a61091d258936716

___

<a href="https://t.afi-b.com/visit.php?guid=ON&a=99886h-W336947J&p=J690746r" target="_blank" rel="nofollow"><img src="https://www.afi-b.com/upload_image/9886-1534983315-3.jpg" width="728" height="90" style="border:none;" alt="CodeCampGATE" /></a><img src="https://t.afi-b.com/lead/99886h/J690746r/W336947J" width="1" height="1" style="border:none;" />

___
