---
title: "Hugo + GitHub Pagesでブログを作った話"
date: 2019-04-15T11:20:46+09:00
draft: false
comment: true
categories: ["Blog"]
tags: ["GitHub Pages", "Hugo", "Ubuntu"]
---

[Hugo](https://gohugo.io/) + [GitHub Pages](https://pages.github.com/)でブログを作った。

 <!--more-->

 ---

<div class="kaerebalink-box" style="text-align:left;padding-bottom:20px;font-size:small;zoom: 1;overflow: hidden;">
    <div class="kaerebalink-image" style="float:left;margin:0 15px 10px 0;"><a
            href="//af.moshimo.com/af/c/click?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062&amp;url=https%3A%2F%2Fwww.amazon.co.jp%2F%25E3%2582%25A8%25E3%2582%25A4%25E3%2582%25B9%25E3%2583%25BC%25E3%2582%25B9-ZenBook-UX370UA%25EF%25BC%2588Core-512GB%25EF%25BC%2589-UX370UA-8550%2Fdp%2FB07DWXRNGF"
            target="_blank" rel="nofollow"><img
                src="https://images-fe.ssl-images-amazon.com/images/I/41paXPb2T%2BL._SL160_.jpg"
                style="border: none;" /></a><img
            src="//i.moshimo.com/af/i/impression?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062" width="1" height="1"
            style="border:none;"></div>
    <div class="kaerebalink-info" style="line-height:120%;zoom: 1;overflow: hidden;">
        <div class="kaerebalink-name" style="margin-bottom:10px;line-height:120%"><a
                href="//af.moshimo.com/af/c/click?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062&amp;url=https%3A%2F%2Fwww.amazon.co.jp%2F%25E3%2582%25A8%25E3%2582%25A4%25E3%2582%25B9%25E3%2583%25BC%25E3%2582%25B9-ZenBook-UX370UA%25EF%25BC%2588Core-512GB%25EF%25BC%2589-UX370UA-8550%2Fdp%2FB07DWXRNGF"
                target="_blank" rel="nofollow">エイスース 13.3型 2-in-1 パソコン ASUS ZenBook Flip UX370UA（Core i7 / メモリ 16GB / SSD
                512GB） UX370UA-8550</a><img
                src="//i.moshimo.com/af/i/impression?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062" width="1" height="1"
                style="border:none;">
        </div>
        <div class="kaerebalink-detail" style="margin-bottom:5px;"></div>
        <div class="kaerebalink-link1" style="margin-top:10px;">
            <div class="shoplinkamazon"
                style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 0 no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;">
                <a href="//af.moshimo.com/af/c/click?a_id=1414800&p_id=170&pc_id=185&pl_id=4062&s_v=b5Rz2P0601xu&url=https%3A%2F%2Fwww.amazon.co.jp%2Fgp%2Fsearch%3Fkeywords%3D%25E3%2583%258E%25E3%2583%25BC%25E3%2583%2588%25E3%2583%2591%25E3%2582%25BD%25E3%2582%25B3%25E3%2583%25B3%2520SSD%2520512GB%252016GB%2520core%2520i7%26__mk_ja_JP%3D%25E3%2582%25AB%25E3%2582%25BF%25E3%2582%25AB%25E3%2583%258A"
                    target="_blank" rel="nofollow">Amazonで調べる</a><img
                    src="//i.moshimo.com/af/i/impression?a_id=1414800&p_id=170&pc_id=185&pl_id=4062" width="1"
                    height="1" style="border:none;"></div>
            <div class="shoplinkrakuten"
                style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 -50px no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;">
                <a href="//af.moshimo.com/af/c/click?a_id=1414727&p_id=54&pc_id=54&pl_id=616&s_v=b5Rz2P0601xu&url=https%3A%2F%2Fsearch.rakuten.co.jp%2Fsearch%2Fmall%2F%25E3%2583%258E%25E3%2583%25BC%25E3%2583%2588%25E3%2583%2591%25E3%2582%25BD%25E3%2582%25B3%25E3%2583%25B3%2520SSD%2520512GB%252016GB%2520core%2520i7%2F-%2Ff.1-p.1-s.1-sf.0-st.A-v.2%3Fx%3D0"
                    target="_blank" rel="nofollow">楽天市場で調べる</a><img
                    src="//i.moshimo.com/af/i/impression?a_id=1414727&p_id=54&pc_id=54&pl_id=616" width="1" height="1"
                    style="border:none;"></div>
            <div class="shoplinkyahoo"
                style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 -150px no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;">
                <a href="//af.moshimo.com/af/c/click?a_id=1418766&p_id=1225&pc_id=1925&pl_id=18502&s_v=b5Rz2P0601xu&url=http%3A%2F%2Fsearch.shopping.yahoo.co.jp%2Fsearch%3Fp%3D%25E3%2583%258E%25E3%2583%25BC%25E3%2583%2588%25E3%2583%2591%25E3%2582%25BD%25E3%2582%25B3%25E3%2583%25B3%2520SSD%2520512GB%252016GB%2520core%2520i7"
                    target="_blank" rel="nofollow">Yahooショッピングで調べる</a><img
                    src="//i.moshimo.com/af/i/impression?a_id=1418766&p_id=1225&pc_id=1925&pl_id=18502" width="1"
                    height="1" style="border:none;"></div>
            <div class="shoplinkseven"
                style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 -100px no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;">
                <a href="//af.moshimo.com/af/c/click?a_id=1414728&p_id=932&pc_id=1188&pl_id=12456&s_v=b5Rz2P0601xu&url=http%3A%2F%2F7net.omni7.jp%2Fsearch%2F%3Fkeyword%3D%25E3%2583%258E%25E3%2583%25BC%25E3%2583%2588%25E3%2583%2591%25E3%2582%25BD%25E3%2582%25B3%25E3%2583%25B3%2520SSD%2520512GB%252016GB%2520core%2520i7%26searchKeywordFlg%3D1"
                    target="_blank"
                    rel="nofollow"><img src="//i.moshimo.com/af/i/impression?a_id=1414728&p_id=932&pc_id=1188&pl_id=12456" width="1" height="1" style="border:none;">7netで調べる
                        </a> </div> </div> </div> <div class="booklink-footer" style="clear: left"></div>
        </div>

---

### Hugo

- https://gohugo.io/

静的サイトジェネレータ。テーマが豊富。

markdownでブログが書けるなんて素晴らしい。

### 導入

自分のUbuntu 18.04環境では、aptだとバージョンが古かったので、snapでインストール。

```
sudo snap install hugo --channel=extended
cd /usr/bin
sudo ln -s /snap/bin/hugo hugo
```

gitからでも取れる。

```
git clone https://github.com/gohugoio/hugo.git
cd hugo
go install --tags extended
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

```
hugo new site blog
cd blog
```

---

### Hugoの設定

1. テーマを入れる
 - [テーマ一覧](https://themes.gohugo.io/)から気に入ったのを選ぶ
     - 「Demo」を押すとサンプルが見れて楽しい
 - `blog/thmem`以下にテーマを落とす

        ```
        cd themes
        git clone https://github.com/[theme_name]
        cd ../
        ```

2. Hugoの設定ファイルを編集する
 - `blog/config.toml`を編集
 - これ以外にもテーマによって設定項目が色々あるが、テーマのページを見ると大抵書いてある

        ```
        baseURL = "https://[github_user].github.io/"
        languageCode = "ja"
        title = "My Blog"
        theme = "[theme_name]"
        ```

---

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

 - `draft: true`だと未公開になるので、公開する際はfalseにする
 - markdownで記事を書く
     - 記事のデフォルト項目は`archetypes/default.md`で弄れる

---

### ローカルサーバで確認

`hugo server --buildDrafts --watch`

 - `--buildDrafts`をつけると`draft: true`の記事もプレビューできる
 - `--watch`をつけておくと記事を更新するたびにプレビューも更新される
 - http://localhost:1313 で確認

 `hugo`コマンドでビルドし公開用ディレクトリが作成されるけど、その前にGihHub Pagesとの連携の準備をします。

 ---

### GitHubに公開

1. 「blog」をpushする

    ```
    git init
    git remote add origin git@github.com:[github_user]/blog.git
    git add -A
    git commit -m "initial commit"
    git push origin master
    ```

2. 「blog」の公開用ディレクトリをサブモジュール化する
 - `hugo`でビルドすると、`blog/public`に公開用ファイル一式が作成される
 - なので、`[github_user].github.io`レポジトリをサブモジュールとして`blog/public`に追加しておくと、ビルドしてpushすることで、GitHub Pagesを使ってブログが公開できる

    ```
    git submodule add git@github.com:[github_user]/[github_user].github.io.git public
    ```

3. ビルドして公開

    ```
    hugo
    cd public
    git add -A
    git commit -m "initial article"
    git push origin master
    ```

少し待って`https://[github_user].github.io`にアクセスすると公開されてるはず。

---

## おわりに

自動化とか諸々はまたの機会に。

 - [CircleCIでHugoのビルドを自動化した話](https://www.ted027.com/post/circleci)

以下参考サイト

- https://uqichi.net/posts/github-pages-x-hugo/
- https://qiita.com/h6m3_u/items/5893a61091d258936716

---

<a href="https://t.afi-b.com/visit.php?guid=ON&a=C9511S-D324435S&p=J690746r" target="_blank" rel="nofollow"><img src="https://www.afi-b.com/upload_image/9511-1520235201-3.gif" width="728" height="90" style="border:none;" alt="フォスターフリーランス" /></a><img src="https://t.afi-b.com/lead/C9511S/J690746r/D324435S" width="1" height="1" style="border:none;" />

---
