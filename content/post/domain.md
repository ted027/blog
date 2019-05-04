---
title: "GitHub Pagesで独自ドメインの設定"
date: 2019-04-28T21:43:13+09:00
draft: false
comments: true
categories: ["Blog"]
tags: ["ドメイン", "GitHub Pages", "Hugo"]
---

GitHub Pagesに独自ドメインを設定した。

<!--more-->

---

{{< ad/a8/onamae >}}

---

GitHub Pages上で普通に静的ファイルを配置すると、

`github.io`

のサブドメインに公開される。

- [[参考記事]Hugo + GitHub Pagesでブログを作った話](https://www.ted027.com/post/hugo)

せっかくなので独自ドメインを取得して設定したい。

---

### ドメイン取得とCNAME設定

<a href="https://px.a8.net/svt/ejp?a8mat=35DFWV+F4RNAQ+50+2HHVNM" target="_blank" rel="nofollow">お名前.com</a>
<img border="0" width="1" height="1" src="https://www12.a8.net/0.gif?a8mat=35DFWV+F4RNAQ+50+2HHVNM" alt="">で取得しました。

1. 取得したいドメインで検索、使用可能であることを確認して購入
    - レンタルサーバーは不要
    - 安いドメインは翌年以降の更新料が高いこともあるので要確認
2. 「ドメイン設定」→「DNS関連機能の設定」から設定したいドメインを選択し、「次へ」
3. 「DNSレコード設定を利用する」の「設定する」を押下
4. 「A/AAAA/CNAME/MX/NS/TXT/SRV/DS/CAAレコード」欄を設定
    - TYPEは「CNAME」を選択
    - ホスト名で適当なサブドメインを入力。定番は「www」など
    - VALUEに「[github_user].github.io」を設定
    {{< img src="/img/domain-set1.png">}}
5. 「確認画面へ進む」→「設定する」

これで、

`https://www.[your.domain]`→`https://[github_user].github.io`

に転送してくれるようになった。

---

### GitHub側でCustom domainを設定

GitHub Pagesの公開用レポジトリから「Settings」→「GitHub Pages」項目の「Custom domain」に、先程CNAMEを設定したドメイン名を入力する

{{< img src="/img/domain-set2.png" >}}

---

### ルートドメインを転送

ここは不要なら設定しなくてもいいのですが、自分はルートドメインの入力のみで以下のように転送してアクセスできるようにしたかったので設定。

`[your.domain]`→`https://www.[your.domain]`

1. <a href="https://px.a8.net/svt/ejp?a8mat=35DFWV+F4RNAQ+50+2HHVNM" target="_blank" rel="nofollow">お名前.com</a>
<img border="0" width="1" height="1" src="https://www12.a8.net/0.gif?a8mat=35DFWV+F4RNAQ+50+2HHVNM" alt="">の「オプション設定」→「転送Plus」項目の「URL転送設定」から該当ドメインの「設定する」を押下
2. 「転送元URL」には何も入れず、「転送先URL」には先程CNAMEを設定したドメイン名を入力、「転送タイプ」は「リダイレクト」
    {{< img src="/img/domain-set3.png" >}}
3. 「確認画面へ進む」→「設定する」

---

### Hugoのconfig.tomlを設定

自分はHugoを使っているので、`config.toml`のbaseURL欄を書き換えておく。

```config.toml
baseURL = "https://www.[your.domain]"
```

こちらも関係ない人は不要。

---

数分待てば設定が完了し、アクセスできるようになります。

---

{{< ad/con/wide/github >}}

---


{{< ad/a8/techacademy>}}

---