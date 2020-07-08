---
title: "Logstashサーバーのログ閲覧と設定"
date: 2020-07-08T07:21:05+09:00
draft: false
comments: true
toc: true
categories: ["Logstash"]
tags: ["ログ"]
---

<!--more-->

---

{{< ad/a8/techacademy2 >}}

---

### 内部ログ

Logstashのログは以下いずれかの配下に吐かれる。

- /var/log/logstash
- ${LS_HOME}/logs

`logstash-plain.log`が通常のログ。  
`logstash-slowlog-plain.log`が時間のかかった処理のログとなっている。

---

### ログ設定閲覧

外部から`GET`で見ることが出来る。

```sh
curl -XGET 'localhost:9600/_node/logging?pretty'
```

以下例のようなレスポンスが返る。

```sh
{
...
  "loggers" : {
    "logstash.agent" : "INFO",
    "logstash.api.service" : "INFO",
    "logstash.basepipeline" : "INFO",
    "logstash.codecs.plain" : "INFO",
    "logstash.codecs.rubydebug" : "INFO",
    "logstash.filters.grok" : "INFO",
    "logstash.inputs.beats" : "INFO",
    "logstash.instrument.periodicpoller.jvm" : "INFO",
    "logstash.instrument.periodicpoller.os" : "INFO",
    "logstash.instrument.periodicpoller.persistentqueue" : "INFO",
    "logstash.outputs.stdout" : "INFO",
    "logstash.pipeline" : "INFO",
    "logstash.plugins.registry" : "INFO",
    "logstash.runner" : "INFO",
    "logstash.shutdownwatcher" : "INFO",
    "org.logstash.Event" : "INFO",
    "slowlog.logstash.codecs.plain" : "TRACE",
    "slowlog.logstash.codecs.rubydebug" : "TRACE",
    "slowlog.logstash.filters.grok" : "TRACE",
    "slowlog.logstash.inputs.beats" : "TRACE",
    "slowlog.logstash.outputs.stdout" : "TRACE"
  }
}
```

---

### ログ設定変更

外部から`PUT`で変更出来る。

```sh
curl -XPUT 'localhost:9600/_node/logging?pretty' -H 'Content-Type: application/json' -d'
{
    "logger.logstash.outputs.elasticsearch" : "DEBUG"
}
'
```

リセットする際は`_node/logging/reset`を叩く。

```sh
curl -XPUT 'localhost:9600/_node/logging/reset?pretty'
```

---

### （おまけ）/var/logへのログ出力

初期設定のままだと、`val/log/messages`にもlogstashのログを出力する。  
これを防ぎたければ。`systemctl`の設定ファイル(`/etc/systemd/system/logstash.service`)で`StandardOutput`と`StandardError`をnullに設定する。

```
...
[Service]
...
StandardOutput=null
StandardError=null
...
```

---

### 参考

- [Logging | Logstash Reference [7.8] | Elastic](https://www.elastic.co/guide/en/logstash/current/logging.html)
- [logstashのログが/var/log/messagesにも出力されてしまうのを抑止する](https://qiita.com/baoh0308/items/d27c0c748f6bccb142be)

---

{{< ad/con/wide/devops >}}

---

{{< ad/a8/techacademy >}}

---
