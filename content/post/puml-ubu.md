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

### 出力する

`Ctrl + Shift + P`でコマンドパレットを開き、

```
plantuml: export current diagram
```

を入力し選択。（最後まで入力しなくても出てくる。）

出力フォーマットを選択すると出力されます。

---

<a href="https://t.afi-b.com/visit.php?guid=ON&a=99886h-W336947J&p=J690746r" target="_blank" rel="nofollow"><img src="https://www.afi-b.com/upload_image/9886-1534983315-3.jpg" width="728" height="90" style="border:none;" alt="CodeCampGATE" /></a><img src="https://t.afi-b.com/lead/99886h/J690746r/W336947J" width="1" height="1" style="border:none;" />

---