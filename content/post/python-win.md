---
title: "Pythonを導入する（Windows環境）"
date: 2019-04-30T20:37:26+09:00
draft: false
comments: true
categories: ["Python"]
tags: ["Python", "Windows", "初心者"]
---

<!--more-->

---

{{< ad/con/wide/python_dokugaku >}}

---

Pythonは、記述がシンプルで書きやすく読みやすい、ライブラリが豊富でできることも多い、とっつきやすい上に開発の現場でもよく使われる、とりあえずやっておいて損はない言語。

---

### インストール

1. [Python公式サイト](https://www.python.org/)からインストーラをダウンロードする
    - 「Downloads」→「Windows」へ進み、「Python3.X.X」をダウンロード
    - Pythonは2系と3系があり少々内容が異なりますが、特に理由がなければ3系（3.X.X）のLatestで問題ないかと思います
2. インストーラを実行
    - 「Add Python3.X to PATH」にチェックが入っていることを確認して「Install Now」
3. 確認
    - コマンドプロンプトを起動して、  
    ```
    $ python --version
    ```
    と打ち実行、バージョンが表示されればインストールできています

---

### Helloと言わせる

新しく環境を整えたら、バージョンを表示させて`Hello, World.`を言わせるのが定番です。

別にやらなくてもいいのですが。それぞれ、正常にインストールされている、簡単なプログラムを実行できる、の確認程度の意味合い。

---

#### 対話モードでHello

Pythonは、対話モードでの実行と、ファイルを記述しての実行との2パターンあります。

対話モードを使うには、コマンドプロンプトで

```
$ python
```

と入力し実行。

続けて`Hello, World.`を出力するコマンドを打ち、実行。

```
$ print("Hello, World.")
```

Pythonが`"Hello, World."`と画面に出力してくれます。

対話モードを抜けるには、`ctrl + D`を押すか、

```
$ exit()
```

を実行。

---

#### ファイルから実行しHello

やってる内容は対話モードと一緒です。

`hello.py`ファイルを作成し、コマンドを入力して保存。

```python :hello.py
print("Hello, World.")
```

コマンドプロンプトで`hello.py`と同階層から、

```
$ python hello.py
```

で実行。

先程と同様に、Pythonが`"Hello, World."`と画面に出力してくれます。

---

{{< ad/con/wide/python_taikutsu >}}

---