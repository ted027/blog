---
title: "Docker+Pythonで\"can't start new thread\"エラー"
date: 2023-06-24T12:15:55+09:00
draft: false
comments: true
toc: true
categories: ["Docker"]
tags: ["Python", "pip", "エラー"]
---

<!--more-->

---

{{< ad/afb/codecamp >}}

---

### 概要

以下のようなDockerfileを作成、Docker環境で`pip install`したところ、エラーが発生。

```Dockerfile
...
RUN set -ex && \
    pip install -e ./module
```

以下エラー。

```
...
  File "/usr/local/lib/python3.8/site-packages/pip/_vendor/rich/live.py", line 132, in start
    self._refresh_thread.start()
  File "/usr/local/lib/python3.8/threading.py", line 852, in start
    _start_new_thread(self._bootstrap, ())
RuntimeError: can't start new thread
```

新しいスレッドを開始できない。  
wait等入れてみても、特に変わらず。

---

### 原因

旧バージョンのDockerのデフォルトseccomp profileが、一部システムコールに対応していなかった模様。

---

### 解決策

Dockerのバージョンを上げて解決。  
自分はamazon-linux環境だったので、以下。

```sh
$ amazon-linux-extras install -y docker
```

これでDocker versionが

* 18.06.1-ce → 20.10.7

に上がり解決。

---

### 補足

自分の環境はDocker on Dockerだったのですが、

* 外側サーバ：18.06.1-ce
* 一段目Docker：18.06.1-ce

でエラーが発生。

* 外側サーバ：20.10.23
* 一段目Docker：20.10.7

として、二段目（内部）のDockerを立てる際のDockerfile内`pip install`での失敗が解消しました。

---

### 参考

- [error: can't start new thread](https://stackoverflow.com/questions/1834919/error-cant-start-new-thread)
- [Python in docker – RuntimeError: can't start new thread](https://stackoverflow.com/questions/70087344/python-in-docker-runtimeerror-cant-start-new-thread)

---

{{< ad/con/wide/javascript >}}

---

{{< ad/a8/techacademy_ui >}}

---
