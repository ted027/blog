---
title: "GitLab-CIでAWSローカル環境を使ったテストを行う"
date: 2021-03-21T11:27:11+09:00
draft: false
comments: true
toc: true
categories: ["AWS", "CI"]
tags: ["GitLabCI", "localsack"]
---

<!--more-->

---

{{< ad/con/wide/devops >}}

---

AWS環境に接続する実装のテストを行う際、ローカルにAWS環境を再現する便利なツールがある。

これをGitLab-CIで使う際、`services`のparameterで簡単にDocker環境を準備でき便利。

* 参考: [GitLab-CIでservicesのコンテナに対してアクセスする](https://www.ted027.com/post/gitlabci-services-host/)

---

### Localstackを使う

[Localstack](https://github.com/atlassian/localstack)は、AWS各種サービスのモックフレームを提供するツールで、料金を気にせずテストや動作確認ができる。

CIでは、以下のDocker imageを利用。

* [localstack/localstack](https://hub.docker.com/r/localstack/localstack)

```yaml
my_aws_test:
  services:
    - localstack/localstack:0.12.8
  variables:
    DYNAMODB_ENDPOINT: http:localstack-locakstack:4566
    S3_ENDPOINT: http:localstack-locakstack:4566
  script:
    - cd aws && pytest test ...
```

portは指定できず、imageのデフォルトを使う。  
最近のバージョンだとサービスを問わずport `4566`で接続できそう。

---

### DynamodDB Localを使う

[DynamoDB Local](https://docs.aws.amazon.com/ja_jp/amazondynamodb/latest/developerguide/DynamoDBLocal.html)は、Amazon DynamoDBのモックツール。

Localstacldと比べるとパフォーマンスも良さそうで、DynamoDBだけを使うならこちらを採用したいところ。

* 参考: [LocalStack の DynamoDB と DynamoDBLocal のベンチマークを取ってみた](https://memememomo.hatenablog.com/entry/2018/11/11/112520)

以下のDocker imageを利用。安心の公式提供。

* [amazon/dynamodb-local](https://hub.docker.com/r/amazon/dynamodb-local)

```yaml
my_dynamodb_test:
  services:
    - amazon/dynamodb-local:1.15.0
  variables:
    DYNAMODB_ENDPOINT: http:amazon-dynamodb-local:8000
  script:
    - aws dynamodb create-table --endpoint-url $DYNAMODB_ENDPOINT --table-name my-table ...
    - cd dynamodb && pytest test ...
```

portはデフォルト (`8000`)を使う。

---

### fake-s3を使う

[fake-s3](https://github.com/jubos/fake-s3)はS3のモックツール。

以下のDocker imageを利用。

* [lphoward/fake-s3](https://hub.docker.com/r/lphoward/fake-s3)

```yaml
my_s3_test:
  services:
    - lphoward/fake-s3:14.04
  variables:
    S3_ENDPOINT: http:lphoward-fake-s3:4569
  script:
    - aws s3 mb --endpoint-url $S3_ENDPOINT s3://my-bucket
    - cd s3 && pytest test ...
```

portはデフォルト (現状`4569`)を使う。

なお、fake-s3に対してlist objectsの操作をする場合は注意点がある。

* [fake-s3にlist objectsをする際の注意点](https://www.ted027.com/post/fakes3-listobject/)

---

{{< ad/con/wide/aws >}}

---

{{< ad/a8/techacademy_py_ai >}}

---
