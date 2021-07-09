---
title: "AWS Cloudformation カスタム名つきリソースの置換"
date: 2021-07-09T19:21:16+09:00
draft: false
comments: true
toc: true
categories: ["AWS"]
tags: ["Cloudformation", "Elasticsearch", "DynamoDB", "エラー"]
---

<!--more-->

---

{{< ad/con/wide/aws >}}

---

AWS Cloudformationで、カスタム名を持つリソース（を含むスタック）を置換(replace)しようとすると、エラーが発生する。

```
Cloudformation cannot update a stach when custom-named resource requires replacing.
Rename {リソース名} and update the stack again
```

リソース名を変えて立て直せと言われます。

---

### Elasticsearch Serviceの場合

Elasticsearchのバージョンを上げようとすると怒られる。

```yaml
MyElasticsearchDomain:
    Type: AWS::Elasticsearch::Domain
    Properties:
      DomainName: MyDomainName
      InstanceType: r4.large.elasticsearch
    # ElasticsearchVersion: 6.2
    ElasticsearchVersion: 6.5
```

カスタム名を変えると成功しますが、当然建て替えになるので、中のデータは消えます。

```yaml
MyElasticsearchDomain:
    Type: AWS::Elasticsearch::Domain
    Properties:
      # DomainName: MyDomainName
      DomainName: MyDomainName2
      InstanceType: r4.large.elasticsearch
    # ElasticsearchVersion: 6.2
    ElasticsearchVersion: 6.5
```

ちなみに、InstanceTypeとかは置換が発生しないので、後からでも変えられます。

```yaml
MyElasticsearchDomain:
    Type: AWS::Elasticsearch::Domain
    Properties:
        DomainName: MyDomainName
        # InstanceType: r4.large.elasticsearch
        InstanceType: r5.2xlarge.elasticsearch
    ElasticsearchVersion: 6.2
```

---

### DynamoDBの場合

レンジキーを後から追加しようとすると怒られる。

```yaml
MyDynamodbTable:
    Type: AWS::DynamoDB::Table
    Properties:
        TableName: MyTableName
        AttributeDefinitions:
            - AttributeName: MyHash
              AttributeType: S
            - AttributeName: MyRange
              AttributeType: S
        KeySchema:
            - AttributeName: MyHash
              KeyType: HASH
            - AttributeName: MyRange    # NEW!
              KeyType: RANGE            # NEW!
```

Table名を変えれば成功しますが、もちろんこれも置換。なんでデータは消えます。

```yaml
MyDynamodbTable:
    Type: AWS::DynamoDB::Table
    Properties:
        # TableName: MyTableName
        TableName: MyTableName2
        AttributeDefinitions:
            - AttributeName: MyHash
              AttributeType: S
            - AttributeName: MyRange
              AttributeType: S
        KeySchema:
            - AttributeName: MyHash
              KeyType: HASH
            - AttributeName: MyRange    # NEW!
              KeyType: RANGE            # NEW!
```

---

### 結論

1. 必須でないなら、置換が発生する変更は控える
    - 特に、活性環境でデータを保持したま
2. 必須の場合、データのバックアップ、PITR等を活用してデータを移し替える
   - 案1. 先にバックアップを取得し、カスタム名を替えて置換してからレストアする
   - 案2. カスタム名を替えたリソースをtemplateに併記し、一時的に二台ある状態に。データを移し替えてから旧リソースを削除
     - 活性環境で行う場合はこちら
3. コードでリソースを指す際には、名称を直接指定しない
    - 本件のようにリソース名が変わった場合、コード変更が必須になる
    - CloudformationのExport等を利用して参照する

ちなみに、Cloudformationを用いて置換や作成/削除を行う場合、基本的に新しいリソースを作ってから古いリソースを削除します。
   - [スタックのリソースの更新動作](https://docs.aws.amazon.com/ja_jp/AWSCloudFormation/latest/UserGuide/using-cfn-updating-stacks-update-behaviors.html)

---

{{< ad/a8/techacademy1 >}}

---
