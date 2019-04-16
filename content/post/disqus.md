---
title: "HugoブログにDisqusでコメント欄をつけた話"
date: 2019-04-16T08:23:08+09:00
draft: false
comments: true
categories: ["Hugo"]
tags: ["Disqus", "コメント欄", "Hugo"]
---

## ブログにコメント欄が欲しい

出来上がったブログを眺めていて、あれこれ言いたいことはあるんですが、まずコメント欄がない。

ちょっと調べたところ[Disqus](https://help.disqus.com/)というオンラインサービスが簡単そう。

___

## やってみる

1. [Disqus](https://help.disqus.com/)にユーザ登録する
    - Facebook, Twitter, Google各アカウントでの登録もできます

2. 右上の歯車から「Add Disqus To Site」を選択

3. 画面下の「GET STARTED」を選択

4. 下の「I want to install Disqus on my site」を選択

5. Website名とカテゴリ、言語を入力
    - Japaneseが無かったのでEnglishにしました

6. プランを選択
    - 基本的なコメント欄をつけたいだけならBasicでよさそう

7. 自分のサイトを選択
    - WordPressやらTumblrやらJekyllやらありますが、今回はHugoで作ったサイトなので、一番下の「I don't see my platform listed, install manually with Universal Code」を選択

8. JavaScriptでWebsite上にDisqusを設置するための情報等が表示されます。特に弄らず一番下の「Configure Disqus」を選択

9. 設定画面に行きます。Website NameとWebsite URLを入力、Color schemeやらはお好みで

10. 設定が完了したら、「Configure your site's community settings」を選択。「Shortname」の文字列をコピーします。

    `Your website shortname is ted027-com`

11. コピーしたShortnameを、config.tomlに追加

    `disqusShortname = "ted027-com"`

12. 記事に`comments: true`を追加

    ```
    ---
    title: "HugoブログにDisqusでコメント欄をつけた話"
    date: 2019-04-16T08:23:08+09:00
    draft: true
    comments: true
    categories: ["Hugo"]
    tags: ["Disqus", "コメント欄", "Hugo"]
    ---
    ```

___
