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

<a href="https://t.afi-b.com/visit.php?guid=ON&a=99886h-W336947J&p=J690746r" target="_blank" rel="nofollow"><img src="https://www.afi-b.com/upload_image/9886-1534983315-3.jpg" width="728" height="90" style="border:none;" alt="CodeCampGATE" /></a><img src="https://t.afi-b.com/lead/99886h/J690746r/W336947J" width="1" height="1" style="border:none;" />
