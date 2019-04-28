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

<a href="https://px.a8.net/svt/ejp?a8mat=35DFWV+F4RNAQ+50+2HLITT" target="_blank" rel="nofollow">
<img border="0" width="728" height="90" alt="" src="https://www29.a8.net/svt/bgt?aid=190423759915&wid=001&eno=01&mid=s00000000018015049000&mc=1"></a>
<img border="0" width="1" height="1" src="https://www17.a8.net/0.gif?a8mat=35DFWV+F4RNAQ+50+2HLITT" alt="">

---

GitHub Pages上で普通に静的ファイルを配置すると、

`github.io`

のサブドメインに公開される。

- [Hugo + GitHub Pagesでブログを始めた話](https://www.ted027.com/post/hugo)

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

これで、`https://www.[your.domain]`→`https://[github_user].github.io`に転送してくれるようになった。

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

<div class="kaerebalink-box" style="text-align:left;padding-bottom:20px;font-size:small;zoom: 1;overflow: hidden;">
    <div class="kaerebalink-image" style="float:left;margin:0 15px 10px 0;"><a
            href="//af.moshimo.com/af/c/click?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062&amp;url=https%3A%2F%2Fwww.amazon.co.jp%2FGitHub%25E5%25AE%259F%25E8%25B7%25B5%25E5%2585%25A5%25E9%2596%2580-~Pull-Request%25E3%2581%25AB%25E3%2582%2588%25E3%2582%258B%25E9%2596%258B%25E7%2599%25BA%25E3%2581%25AE%25E5%25A4%2589%25E9%259D%25A9-PRESS-plus%2Fdp%2F477416366X"
            target="_blank" rel="nofollow"><img
                src="https://images-fe.ssl-images-amazon.com/images/I/51PjpAUHZBL._SL160_.jpg"
                style="border: none;" /></a><img
            src="//i.moshimo.com/af/i/impression?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062" width="1" height="1"
            style="border:none;"></div>
    <div class="kaerebalink-info" style="line-height:120%;zoom: 1;overflow: hidden;">
        <div class="kaerebalink-name" style="margin-bottom:10px;line-height:120%"><a
                href="//af.moshimo.com/af/c/click?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062&amp;url=https%3A%2F%2Fwww.amazon.co.jp%2FGitHub%25E5%25AE%259F%25E8%25B7%25B5%25E5%2585%25A5%25E9%2596%2580-~Pull-Request%25E3%2581%25AB%25E3%2582%2588%25E3%2582%258B%25E9%2596%258B%25E7%2599%25BA%25E3%2581%25AE%25E5%25A4%2589%25E9%259D%25A9-PRESS-plus%2Fdp%2F477416366X"
                target="_blank" rel="nofollow">GitHub実践入門 〜Pull Requestによる開発の変革 Pull　Requestによる開発の変革 （WEB+DB PRESS plus）
                [ 大塚弘記 ]</a><img src="//i.moshimo.com/af/i/impression?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062" width="1"
                height="1" style="border:none;">
        </div>
        <div class="kaerebalink-detail" style="margin-bottom:5px;"></div>
        <div class="kaerebalink-link1" style="margin-top:10px;">
            <div class="shoplinkamazon"
                style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 0 no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;">
                <a href="//af.moshimo.com/af/c/click?a_id=1414800&p_id=170&pc_id=185&pl_id=4062&s_v=b5Rz2P0601xu&url=https%3A%2F%2Fwww.amazon.co.jp%2Fgp%2Fsearch%3Fkeywords%3Dgithub%26__mk_ja_JP%3D%25E3%2582%25AB%25E3%2582%25BF%25E3%2582%25AB%25E3%2583%258A"
                    target="_blank" rel="nofollow">Amazonで調べる</a><img
                    src="//i.moshimo.com/af/i/impression?a_id=1414800&p_id=170&pc_id=185&pl_id=4062" width="1"
                    height="1" style="border:none;"></div>
            <div class="shoplinkrakuten"
                style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 -50px no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;">
                <a href="//af.moshimo.com/af/c/click?a_id=1414727&p_id=54&pc_id=54&pl_id=616&s_v=b5Rz2P0601xu&url=https%3A%2F%2Fsearch.rakuten.co.jp%2Fsearch%2Fmall%2Fgithub%2F-%2Ff.1-p.1-s.1-sf.0-st.A-v.2%3Fx%3D0"
                    target="_blank" rel="nofollow">楽天市場で調べる</a><img
                    src="//i.moshimo.com/af/i/impression?a_id=1414727&p_id=54&pc_id=54&pl_id=616" width="1" height="1"
                    style="border:none;"></div>
            <div class="shoplinkyahoo"
                style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 -150px no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;">
                <a href="//af.moshimo.com/af/c/click?a_id=1418766&p_id=1225&pc_id=1925&pl_id=18502&s_v=b5Rz2P0601xu&url=http%3A%2F%2Fsearch.shopping.yahoo.co.jp%2Fsearch%3Fp%3Dgithub"
                    target="_blank" rel="nofollow">Yahooショッピングで調べる</a><img
                    src="//i.moshimo.com/af/i/impression?a_id=1418766&p_id=1225&pc_id=1925&pl_id=18502" width="1"
                    height="1" style="border:none;"></div>
            <div class="shoplinkseven"
                style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 -100px no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;">
                <a href="//af.moshimo.com/af/c/click?a_id=1414728&p_id=932&pc_id=1188&pl_id=12456&s_v=b5Rz2P0601xu&url=http%3A%2F%2F7net.omni7.jp%2Fsearch%2F%3Fkeyword%3Dgithub%26searchKeywordFlg%3D1"
                    target="_blank"
                    rel="nofollow"><img src="//i.moshimo.com/af/i/impression?a_id=1414728&p_id=932&pc_id=1188&pl_id=12456" width="1" height="1" style="border:none;">7netで調べる
                        </a> </div> </div> </div> <div class="booklink-footer" style="clear: left"></div>
        </div>

---