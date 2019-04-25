---
title: "Ubuntu環境にVSCode+PlantUMLを導入する"
date: 2019-04-25T09:33:57+09:00
draft: false
comments: true
categories: ["PlantUML"]
tags: ["PlantUML", "VSCode", "Ubuntu"]
---

 <!--more-->

---

<a href="https://t.afi-b.com/visit.php?guid=ON&a=C9511S-i324416Z&p=J690746r" target="_blank" rel="nofollow"><img src="https://www.afi-b.com/upload_image/9511-1521815201-3.gif" width="728" height="90" style="border:none;" alt="フォスターフリーランス" /></a><img src="https://t.afi-b.com/lead/C9511S/J690746r/i324416Z" width="1" height="1" style="border:none;" />

---

Visual Studio Code + PlantUMLをUbuntuに導入する。

[Windows環境にVSCode+PlantUMLを導入する](https://www.ted027.com/post/puml-win)

自分の環境以外のインストール手順なんてどうでもいいよな、と思いWindows版と記事を分けることに。ほぼ一緒ですが。

### 導入

以下のものが必要。

- Java JRE or JDK

- Graphviz

---

#### Ubuntuにインストール

1. Visual Studio Codeをインストール
    ```
    sudo apt -y install code
    ```

2. Javaをインストール
    ```
    sudo apt -y install default-jre 
    ```

3. Graphvizをインストール
    ```
    sudo apt -y install graphviz
    ```

4. Visual Studio Codeの拡張機能から`PlantUML`を検索しインストールする

---

### 書いてみる

VSCodeで拡張子`.pu`のファイルを作成する。

```sample.pu
@startuml

actor User

User -> Form : Input user information
activate Form
Form -> Database : Register user information
activate Database
Form <- Database : Inform success
deactivate Database
User <- Form : Show success message
deactivate Form


@enduml
```

`Alt + D`で作成中の図をプレビューできる。

{{< img src="/img/puml.png" >}}

[PlantUMLでAWSアイコンを使ったシステム構成図を作る](https://www.ted027.com/post/puml-aws)

### 出力する

`Ctrl + Shift + P`でコマンドパレットを開き、

```
plantuml: export current diagram
```

を入力し選択。（最後まで入力しなくても出てくる。）

出力フォーマットを選択すると出力されます。

---

<div class="kaerebalink-box" style="text-align:left;padding-bottom:20px;font-size:small;zoom: 1;overflow: hidden;"><div class="kaerebalink-image" style="float:left;margin:0 15px 10px 0;"><a href="//af.moshimo.com/af/c/click?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062&amp;url=https%3A%2F%2Fwww.amazon.co.jp%2F%25E3%2583%2580%25E3%2582%25A4%25E3%2582%25A2%25E3%2582%25B0%25E3%2583%25A9%25E3%2583%25A0%25E5%2588%25A5UML%25E5%25BE%25B9%25E5%25BA%2595%25E6%25B4%25BB%25E7%2594%25A8-%25E7%25AC%25AC2%25E7%2589%2588-DB-Magazine-SELECTION%2Fdp%2F4798118443" rel="nofollow" target="_blank"><img src="https://images-fe.ssl-images-amazon.com/images/I/51l0OwohmdL._SL160_.jpg" style="border: none;"/></a><img height="1" src="//i.moshimo.com/af/i/impression?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062" style="border:none;" width="1"/></div><div class="kaerebalink-info" style="line-height:120%;zoom: 1;overflow: hidden;"><div class="kaerebalink-name" style="margin-bottom:10px;line-height:120%"><a href="//af.moshimo.com/af/c/click?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062&amp;url=https%3A%2F%2Fwww.amazon.co.jp%2F%25E3%2583%2580%25E3%2582%25A4%25E3%2582%25A2%25E3%2582%25B0%25E3%2583%25A9%25E3%2583%25A0%25E5%2588%25A5UML%25E5%25BE%25B9%25E5%25BA%2595%25E6%25B4%25BB%25E7%2594%25A8-%25E7%25AC%25AC2%25E7%2589%2588-DB-Magazine-SELECTION%2Fdp%2F4798118443" rel="nofollow" target="_blank">ダイアグラム別UML徹底活用 第2版</a><img height="1" src="//i.moshimo.com/af/i/impression?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062" style="border:none;" width="1"/></div><div class="kaerebalink-detail" style="margin-bottom:5px;"></div><div class="kaerebalink-link1" style="margin-top:10px;"><div class="shoplinkamazon" style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 0 no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;"><a href="//af.moshimo.com/af/c/click?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062&amp;s_v=b5Rz2P0601xu&amp;url=https%3A%2F%2Fwww.amazon.co.jp%2Fgp%2Fsearch%3Fkeywords%3DUML%25E3%2580%2580%25E8%25A8%25AD%25E8%25A8%2588%26__mk_ja_JP%3D%25E3%2582%25AB%25E3%2582%25BF%25E3%2582%25AB%25E3%2583%258A" rel="nofollow" target="_blank">Amazonで調べる</a><img height="1" src="//i.moshimo.com/af/i/impression?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062" style="border:none;" width="1"/></div><div class="shoplinkrakuten" style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 -50px no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;"><a href="//af.moshimo.com/af/c/click?a_id=1414727&amp;p_id=54&amp;pc_id=54&amp;pl_id=616&amp;s_v=b5Rz2P0601xu&amp;url=https%3A%2F%2Fsearch.rakuten.co.jp%2Fsearch%2Fmall%2FUML%25E3%2580%2580%25E8%25A8%25AD%25E8%25A8%2588%2F-%2Ff.1-p.1-s.1-sf.0-st.A-v.2%3Fx%3D0" rel="nofollow" target="_blank">楽天市場で調べる</a><img height="1" src="//i.moshimo.com/af/i/impression?a_id=1414727&amp;p_id=54&amp;pc_id=54&amp;pl_id=616" style="border:none;" width="1"/></div><div class="shoplinkyahoo" style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 -150px no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;"><a href="//af.moshimo.com/af/c/click?a_id=1418766&amp;p_id=1225&amp;pc_id=1925&amp;pl_id=18502&amp;s_v=b5Rz2P0601xu&amp;url=http%3A%2F%2Fsearch.shopping.yahoo.co.jp%2Fsearch%3Fp%3DUML%25E3%2580%2580%25E8%25A8%25AD%25E8%25A8%2588" rel="nofollow" target="_blank">Yahooショッピングで調べる</a><img height="1" src="//i.moshimo.com/af/i/impression?a_id=1418766&amp;p_id=1225&amp;pc_id=1925&amp;pl_id=18502" style="border:none;" width="1"/></div><div class="shoplinkseven" style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 -100px no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;"><a href="//af.moshimo.com/af/c/click?a_id=1414728&amp;p_id=932&amp;pc_id=1188&amp;pl_id=12456&amp;s_v=b5Rz2P0601xu&amp;url=http%3A%2F%2F7net.omni7.jp%2Fsearch%2F%3Fkeyword%3DUML%25E3%2580%2580%25E8%25A8%25AD%25E8%25A8%2588%26searchKeywordFlg%3D1" rel="nofollow" target="_blank"><img src=" af="" height="1" i="" i.moshimo.com="" impression?a_id='1414728&amp;p_id=932&amp;pc_id=1188&amp;pl_id=12456"' style="border:none;" width="1">7netで調べる</img src="></a></div></div></div><div class="booklink-footer" style="clear: left"></div></div>

---