---
title: "PlantUML + Visual Studio Codeを導入する（Windows環境）"
date: 2019-04-25T09:33:57+09:00
draft: false
comments: true
categories: ["UML"]
tags: ["PlantUML", "Visual Studio Code", "Windows"]
---

PlantUMLは、構成や関連を言語で記載しUML図を作成できるコンポーネント。

<!--more-->

---

{{< ad/afb/codecamp >}}

---

追加や削除も簡単で、単純な図ならPowerPointやVisioより使い勝手がいい。（と思っている。）

自分はVisual Studio Codeに拡張機能を入れて使っています。

[[参考記事]PlantUML + Visual Studio Codeを導入する（Ubuntu環境）](https://www.ted027.com/post/puml-ubu)

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

[[参考記事]PlantUMLでAWSアイコンを使ったシステム構成図を作る](https://www.ted027.com/post/puml-aws)

### 出力する

`Ctrl + Shift + P`でコマンドパレットを開き、

```
plantuml: export current diagram
```

を入力し選択。（最後まで入力しなくても出てくる。）

出力フォーマットを選択すると出力されます。

---

{{< ad/con/wide/uml >}}

---

{{< ad/a8/techacademy2 >}}

---
