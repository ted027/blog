---
title: "Pythonでライブラリを使う"
date: 2019-04-30T22:39:20+09:00
draft: false
comments: true
categories: ["Python"]
tags: ["Python", "ライブラリ", "pip", "モジュール"]
---

<!--more-->

---

{{< ad/a8/techacademy>}}

---

{{< ad/con/wide/python_dokugaku >}}

---

豊富なライブラリはPythonの特徴のひとつ。一から自分で組まなくても、色々なことを実現してくれる関数が用意されています。

---

### 標準ライブラリを使う

Pythonの標準ライブラリにあるものは、Pythonで

```python
import {library_name}
```

を実行するだけで使うことができます。

標準ライブラリ一覧は以下。

- https://docs.python.org/ja/3/library/index.html

例えば、時刻を扱う`datetime`ライブラリを使って、以下のように現在時刻を取得できます。

```python:date.py
from datetime import datetime
datetime.now().strftime("%Y/%m/%d %H:%M:%S")
```

---

### PyPIからライブラリをインストールして使う

標準ライブラリ以外にも、[PyPI（Python Package Index）](https://pypi.python.org/pypi)からライブラリをインストールして使うことができます。

Windowsであれば、コマンドプロンプトで`python -m pip install`を実行し、ライブラリをインストールします。

```sh
$ python -m pip install {library_name}
```

Linuxなら以下。

```sh
$ pip install {library_name}
```

その後、Pythonで`import`して使います。

```python
import {library_name}
```

例えば、httpリクエストを行う`requests`と、htmlをパースして扱う`BeautifulSoup4(bs4)`を使ってWebサイトの情報を取得することができます。

```sh
$ python -m pip install requests bs4
```

```python:request.py
import requests
import bs4

url = "https://www.yahoo.co.jp"
res = requests.get(url)
res.raise_for_status()
soup = bs4.BeautifulSoup(res.content, "html.parser")
```

---

{{< ad/con/wide/python_taikutsu >}}

---

{{< ad/a8/techstars>}}

---
