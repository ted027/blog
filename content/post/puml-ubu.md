---
title: "PlantUML + Visual Studio Codeを導入する（Ubuntu環境）"
date: 2019-04-25T09:33:57+09:00
draft: false
comments: true
categories: ["PlantUML"]
tags: ["PlantUML", "Visual Studio Code", "Ubuntu"]
---

<!--more-->

---

{{< ad/afb/foster >}}

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
    $ sudo apt -y install code
    ```

2. Javaをインストール
    ```
    $ sudo apt -y install default-jre
    ```

3. Graphvizをインストール
    ```
    $ sudo apt -y install graphviz
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

{{< ad/con/wide/uml >}}

---