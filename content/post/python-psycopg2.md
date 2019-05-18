---
title: "pip install時の「“python setup.py egg_info” failed ...」エラー"
date: 2019-05-18T22:05:36+09:00
draft: false
comments: true
categories: ["Python"]
tags: ["psycopg2", "pip"]
---

Pythonでpip installしようとした時、表題のエラーで躓くことがあった。

<!--more-->

---

{{< ad/a8/techacademy>}}

---

{{< ad/con/wide/python_dokugaku >}}

---

### “python setup.py egg_info” failed

`Command “python setup.py egg_info” failed with error code 1 in ...`

のエラーが起きる原因は大きく分けて二つ。

- pip / setuptoolsが最新でない
- 必要なライブラリが無い

---

#### pip / setuptoolsが最新でない

こちらの場合は、単純にこれらをupgradeすればよい。

```
$ pip install --upgrade pip setuptools
```

---

#### 必要なライブラリが無い

こちらはライブラリによって異なるので一概には言えないが、エラーを読むと何が足りないか書いてあったりする。

---

### psycopg2のインストール

今回の現象は以下。

```sh
$ pip install psycopg2
...
Error: pg_config executable not found.
    
    pg_config is required to build psycopg2 from source.  Please add the directory
    containing pg_config to the $PATH or specify the full executable path with the
    option:
...
`Command "python setup.py egg_info" failed with error code 1 in /tmp/pip-build-ta2iundk/psycopg2/`
```

エラーを見ると、`必要なライブラリが無い`の方のケースだとわかる。

無いと言われている`pg_config`をググると、環境ごとに以下のパッケージに含まれていることがわかる。

- `postgresql-devel`(CentOS)
- `libpq-dev`(Debian/Ubuntu)
- `postgresql`(MacOS)

なので、環境によってそれぞれ以下のコマンドでインストールする。

- CentOS

```sh
$ yum install postgresql-devel
```

- Debian/Ubuntu

```sh
$ apt-get install libpq-dev
```

- MacOS

```sh
$ brew install postgresql
```

自分は`Ubuntu`環境なので、`apt`でインストールし、再度`psycopg2`を入れてみる。

```sh
$ apt-get install libpq-dev

$ pip install psycopg2
```

---

### おわり

無事入りました。

---

{{< ad/con/wide/python_taikutsu >}}

---

{{< ad/afb/codecamp>}}

---
