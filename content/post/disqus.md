---
title: "HugoブログにDisqusでコメント欄をつけた話"
date: 2019-04-16T08:23:08+09:00
draft: false
comments: true
categories: ["Hugo"]
tags: ["Disqus", "コメント欄", "Hugo"]
---

出来上がったブログを眺めていて、あれこれ言いたいことはあるが、とりあえずコメント欄がほしい。

ちょっと調べたところ[Disqus](https://help.disqus.com/)というオンラインサービスが簡単そう。

 <!--more-->

 ___

 <a href="https://t.afi-b.com/visit.php?guid=ON&a=z10341W-l353325a&p=J690746r" target="_blank" rel="nofollow"><img src="https://www.afi-b.com/upload_image/10341-1547340072-3.jpg" width="468" height="60" style="border:none;" alt="若手向け" /></a><img src="https://t.afi-b.com/lead/z10341W/J690746r/l353325a" width="1" height="1" style="border:none;" />

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

    ```
    Your website shortname is ted027-com
    ```

11. コピーしたShortnameを、config.tomlに追加

    ```
    disqusShortname = "ted027-com"
    ```

12. テンプレートhtmlファイルにdisqus用の記載を追加
    - テーマによっては最初から記載されています
    - themes/layouts/_default/sigle.htmlあたりのファイルで、ページ下部に追記

    ```
    {{ template "_internal/disqus.html" . }}
    ```

___

<a href="https://t.afi-b.com/visit.php?guid=ON&a=99886h-W336947J&p=J690746r" target="_blank" rel="nofollow"><img src="https://www.afi-b.com/upload_image/9886-1534983315-3.jpg" width="728" height="90" style="border:none;" alt="CodeCampGATE" /></a><img src="https://t.afi-b.com/lead/99886h/J690746r/W336947J" width="1" height="1" style="border:none;" />

___
