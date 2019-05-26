---
title: "Hugo + GitHub Pagesでブログを作った話"
date: 2019-04-15T11:20:46+09:00
draft: false
comment: true
categories: ["Blog"]
tags: ["GitHub Pages", "Hugo", "Ubuntu"]
---

Hugo + GitHub Pagesを使ってブログを作った。

<!--more-->

---

{{< ad/a8/onamae >}}

---

### Hugo

- https://gohugo.io/

静的サイトジェネレータ。テーマが豊富でカスタマイズ性が高い。

markdownでブログが書けるなんて素晴らしい。

### 導入

自分のUbuntu 18.04環境では、aptだとバージョンが古かったので、snapでインストール。

```sh
$ sudo snap install hugo --channel=extended
$ cd /usr/bin
$ sudo ln -s /snap/bin/hugo hugo
```

gitからでも取れる。

```sh
$ git clone https://github.com/gohugoio/hugo.git
$ cd hugo
$ go install --tags extended
```

---

### GitHub Pages

- https://pages.github.com/

GitHub上の静的ファイルをwebページとして公開する機能。

Hugoで生成したファイルをGitHub Pagesで公開する感じ。

### 導入

1. GitHubでレポジトリを作る
 - レポジトリ名は、`[github_user].github.io`にする
2. このリポジトリ上の静的ファイルが`https://[github_user].github.io`に公開される

---

ここからは実際にブログを作った話。

---

### GitHub上にレポジトリを2つ用意
 - blog
     - hugoのソースや記事のmdファイルを配置するレポジトリ
 - [github_user].github.io
     - この名前で作る
     - 静的ファイルを配置するレポジトリ

---

### Hugoで静的サイトを作成

```sh
$ hugo new site blog
$ cd blog
```

---

### Hugoの設定

1. テーマを入れる
 - [テーマ一覧](https://themes.gohugo.io/)から気に入ったのを選ぶ
     - 「Demo」を押すとサンプルが見れて楽しい
 - `blog/thmem`以下にテーマを落とす

        ```sh
        $ cd themes
        $ git clone https://github.com/[theme_name]
        $ cd ../
        ```

2. Hugoの設定ファイルを編集する
 - `blog/config.toml`を編集
 - これ以外にもテーマによって設定項目が色々あるが、テーマのページを見ると大抵書いてある

        ```config.toml
        baseURL = "https://[github_user].github.io/"
        languageCode = "ja"
        title = "My Blog"
        theme = "[theme_name]"
        ```

---

### 記事を作成

```sh
$ hugo new post/first.md
```

こんな記事ができる。

```markdown
---
title: "First"
date: 2019-04-15T00:00:00+09:00
draft: true
---
```

 - `draft: true`だと未公開になるので、公開する際はfalseにする
 - markdownで記事を書く
     - 記事のデフォルト項目は`archetypes/default.md`で弄れる

---

### ローカルサーバで確認

```sh
$ hugo server --buildDrafts --watch
```

 - `--buildDrafts`をつけると`draft: true`の記事もプレビューできる
 - `--watch`をつけておくと記事を更新するたびにプレビューも更新される
 - http://localhost:1313 で確認

 `hugo`コマンドでビルドし公開用ディレクトリが作成されるけど、その前にGihHub Pagesとの連携の準備をします。

 ---

### GitHubに公開

1. 「blog」をpushする

    ```sh
    $ git init
    $ git remote add origin git@github.com:[github_user]/blog.git
    $ git add -A
    $ git commit -m "initial commit"
    $ git push origin master
    ```

2. 「blog」の公開用ディレクトリをサブモジュール化する
 - `hugo`でビルドすると、`blog/public`に公開用ファイル一式が作成される
 - なので、`[github_user].github.io`レポジトリをサブモジュールとして`blog/public`に追加しておくと、ビルドしてpushすることで、GitHub Pagesを使ってブログが公開できる

    ```sh
    $ git submodule add git@github.com:[github_user]/[github_user].github.io.git public
    ```

3. ビルドして公開

    ```sh
    $ hugo
    $ cd public
    $ git add -A
    $ git commit -m "initial article"
    $ git push origin master
    ```

少し待って`https://[github_user].github.io`にアクセスすると公開されてるはず。

---

### おわり

自動化とか諸々はまたの機会に。

 - [[参考記事]CircleCIでHugoのビルドを自動化した話](https://www.ted027.com/post/circleci)

以下参考サイト

- https://uqichi.net/posts/github-pages-x-hugo/
- https://qiita.com/h6m3_u/items/5893a61091d258936716

---

{{< ad/con/wide/github >}}

---

{{< ad/a8/techacademy1>}}

---
