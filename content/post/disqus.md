---
title: "HugoブログにDisqusでコメント欄をつけた"
date: 2019-04-16T08:23:08+09:00
draft: false
comments: true
toc: false
categories: ["Blog"]
tags: ["Disqus", "Hugo"]
---

ブログなのでコメント欄くらいはほしい。

DisqusというサービスならHugoに簡単に導入できそう。

<!--more-->

---

{{< ad/a8/techacademy1 >}}

---

## Hugoに導入

1. [Disqus](https://help.disqus.com/)にユーザ登録する
    - メールアドレスか、Facebook, Twitter, Google各アカウントでの登録

2. 右上の歯車から「Add Disqus To Site」を選択

3. 画面下の「GET STARTED」を選択

4. 下の「I want to install Disqus on my site」を選択

5. Website名とカテゴリ、言語を入力
    - Japaneseが無かったのでEnglishにした

6. プランを選択
    - 基本的なコメント欄をつけたいだけならBasicでよさそう

7. 自分のサイトを選択
    - 今回はHugoで作ったサイトなので、一番下の「I don't see my platform listed, install manually with Universal Code」を選択

8. Website上にDisqusを設置するためのコード等が出ますが、特に弄らず一番下の「Configure Disqus」を選択

9. 設定画面。Website NameとWebsite URLを入力、Color schemeやらはお好みで

10. 設定が完了したら、「Configure your site's community settings」を選択。「Shortname」の文字列をコピーする。

    ```
    Your website shortname is xxxxxx-com
    ```

11. コピーしたShortnameを、config.tomlに追加

    ```
    disqusShortname = "xxxxxx-com"
    ```

12. テンプレートhtmlファイルにdisqus用の記載を追加
    - テーマによっては最初から記載されている
    - 無さそうならthemes/layouts/_default/sigle.htmlあたりのファイルで、ページ下部に追記

    ```
    {{ template "_internal/disqus.html" . }}
    ```

---

{{< ad/a8/onamae >}}

---
