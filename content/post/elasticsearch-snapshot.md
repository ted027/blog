---
title: "Elasticsearchのバックアップ/リストア"
date: 2020-02-08T21:36:00+09:00
draft: false
comments: true
toc: true
categories: ["Elasticsearch"]
tags: ["AWS", "snapshot", "Python"]
---

<!--more-->

---

バックアップでなくsnapshotと呼ぶのが通例らしい。

requestsを使っても出来ますが、PythonのElasticsearch clientを使います。

ちなみにAWS Elasticsearch Searviceを使ってます。レポジトリはS3を使います。

## 基本

### IAM Role作成

snaoshotを作成するため、以下のポリシーを付与したロール`SnapshotRole`を作成。

```json
{
  "Version": "2012-10-17",
  "Statement": [{
      "Action": [
        "s3:ListBucket"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:s3:::s3_bucket_name"
      ]
    },
    {
      "Action": [
        "s3:GetObject",
        "s3:PutObject",
        "s3:DeleteObject"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:s3:::s3_bucket_name/s3_bucket_path*"
      ]
    }
  ]
}
```

### snapshot repository登録

```py
import boto3
from elasticsearch import Elasticsearch, RequestsHttpConnection
from requests_aws4auth import AWS4Auth

region = 'ap-northeast-1'
credentials = boto3.Session().get_credentials()
awsauth = AWS4Auth(
    credentials.access_key,
    credentials.secret_key,
    region,
    'es',
    session_token=credentials.token)

es = Elasticsearch(
    hosts = [{'host': 'elasticsearch_host', 'port': 443}],
    http_auth = awsauth,
    use_ssl = True,
    verify_certs = True,
    connection_class = RequestsHttpConnection
)

body = {
    "type": "s3",
    "settings": {
        "bucket": "s3_bucket_name",
        "base_path": "s3_bucket_path",
        "region": region,
        "role_arn": "arn:aws:iam::123456789012:role/SnapshotRole"
    }
es.snapshot.create_repository(repository='repository-name', body=body)
```

### snapshot取得

```py
es.snapshot.create(
    repository='repository_name',
    snapshot='snapshot_name',
    request_timeout=30)
```

`request_timeout`はデフォルトの10秒だと度々タイムアウトしたので追加。

indexを指定して取得する場合、bodyを指定する。asterisk使用可能。

```py
body = {
  "indices": "my_index_pattern_*"
}
es.snapshot.create(
    repository='repository_name',
    snapshot='snapshot_name',
    body=body,
    request_timeout=30)
```

### restore

```py
es.snapshot.restore(
    repository='repository_name',
    snapshot='snapshot_name',
    request_timeout=30)
```

snapshot作成時と同様、bodyでindicesも指定可能。

---

## データ移行

ログの送信を止めずに別のElasticsearchサーバにデータを移行したい時。

### 新/旧サーバでsnapshot repository登録

共通のS3をsnapshot repositoryに登録するとデータコピーが不要。

### 旧サーバでsnapshot取得

### 新サーバでrestore

#### ログをpublishしてElasticsearchに送信する場合

リアルタイムにログを送るので、先にpublish先を新サーバに切り替える。

新サーバとsnapshotに共通のindexが存在する場合リストアが失敗するため、indexをリネームする。

```py
body = {
  "rename_pattern": "*",
  "rename_replacement": "$1-restored"
}
es.snapshot.restore(
    repository='repository_name',
    snapshot='snapshot_name',
    body=body,
    request_timeout=30)
```

#### ログをpollingしてElasticsearchに送信する場合

この場合、先にpollingを切り替えてからリネームしてリストアすると、重複したログを保持してしまう。

なので、先にリストアしてからpollingを切り替える。

logstash等がindexとidが重複するログは弾いてくれる。

---

### 参考

- [API Documentation — Elasticsearch 7.5.1 documentation](https://elasticsearch-py.readthedocs.io/en/master/api.html)
- [Amazon Elasticsearch Service インデックススナップショットの使用](https://docs.aws.amazon.com/ja_jp/elasticsearch-service/latest/developerguide/es-managedomains-snapshots.html)
- [Amazon Elasticsearch Service への HTTP リクエストの署名](https://docs.aws.amazon.com/ja_jp/elasticsearch-service/latest/developerguide/es-request-signing.html#es-request-signing-python)

---

{{< ad/con/wide/python_dokugaku >}}

---

{{< ad/a8/techacademy >}}

---
