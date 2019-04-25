---
title: "Windows環境にVSCode+PlantUMLを導入する"
date: 2019-04-25T09:33:57+09:00
draft: false
comments: true
categories: ["PlantUML"]
tags: ["PlantUML", "VSCode", "Windows"]
---

PlantUMLは、構成や関連を言語で記載しUML図を作成できるコンポーネント。

 <!--more-->

---

<a href="https://t.afi-b.com/visit.php?guid=ON&a=99886h-W336947J&p=J690746r" target="_blank" rel="nofollow"><img src="https://www.afi-b.com/upload_image/9886-1534983315-3.jpg" width="728" height="90" style="border:none;" alt="CodeCampGATE" /></a><img src="https://t.afi-b.com/lead/99886h/J690746r/W336947J" width="1" height="1" style="border:none;" />

---

追加や削除も簡単で、単純な図ならPowerPointやVisioより使い勝手がいい。（と思っている。）

自分はVisual Studio Codeに拡張機能を入れて使っています。

[Ubuntu環境にVSCode+PlantUMLを導入する](https://www.ted027.com/post/puml-ubu)

### 導入

以下のものが必要。

- Java JRE or JDK

- Graphviz

---

#### Winidowsにインストール

1. Visual Studio Codeをインストール
    - [Visual Studio Code](https://code.visualstudio.com/)からインストーラを落としてきて実行

2. Javaをインストール
    - [Oracle Java](https://www.java.com/ja/download/)からインストーラを落としてきて実行

3. Graphvizをインストール
    - [Graphviz Download](http://www.graphviz.org/download/)からインストーラを落としてきて実行

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

### 出力する

`Ctrl + Shift + P`でコマンドパレットを開き、

```
plantuml: export current diagram
```

を入力し選択。（最後まで入力しなくても出てくる。）

出力フォーマットを選択すると出力されます。

---

<a href="https://t.afi-b.com/visit.php?guid=ON&a=M10262Q-X351704n&p=J690746r" target="_blank" rel="nofollow"><img src="https://www.afi-b.com/upload_image/10262-1549272488-3.jpg" width="728" height="90" style="border:none;" alt="BTCエージェント forエンジニア" /></a><img src="https://t.afi-b.com/lead/M10262Q/J690746r/X351704n" width="1" height="1" style="border:none;" />

---