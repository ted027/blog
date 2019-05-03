---
title: "PlantUMLでAWSアイコンを使ったシステム構成図を作る"
date: 2019-04-25T17:02:54+09:00
draft: false
comments: true
categories: ["PlantUML"]
tags: ["AWS", "PlantUML", "構成図"]
---

公開されているAWS Simple Iconsのpumlファイルをincludeすることで、PlantUMLで簡単に図に導入できる。

<!--more-->

---

{{< ad/a8/techstars>}}

---

{{< ad/con/wide/uml >}}

---

- [[参考記事]Windows環境にVSCode+PlantUMLを導入する](https://www.ted027.com/post/puml-win)

- [[参考記事]Ubuntu環境にVSCode+PlantUMLを導入する](https://www.ted027.com/post/puml-ubu)

---

AWSを使ったクラウドサービスを開発している人は、一度はPowerPointやVisioで構成図を作って説明したことがあるはず。

これも簡単なものならPlantUMLでさらっと書ける。

### 概要

GitHubで公開されてます。

- [AWS-PlantUML](https://github.com/milo-minderbinder/AWS-PlantUML)

### 使い方

`.pu`ファイル内でincludeする。

```sample.pu
@startuml

!define AWSPUML https://raw.githubusercontent.com/milo-minderbinder/AWS-PlantUML/release/18-2-22/dist
!includeurl AWSPUML/common.puml

!includeurl AWSPUML/ApplicationServices/AmazonAPIGateway/AmazonAPIGateway.puml
!includeurl AWSPUML/Compute/AWSLambda/LambdaFunction/LambdaFunction.puml
!includeurl AWSPUML/Database/AmazonDynamoDB/table/table.puml
...
```

サービスのパスは上のGitHubを見ながら、ほしいものをincludeしていく。

### 書いてみる

includeしたAWSアイコンは、基本的に以下の書式で書ける。

```plantuml
AWS_SERVICE_NAME_UPPERCASE(puml resource name, display name)
```

`cloud`みたいに、`{}`で括って他のサービスを入れられる。

```sample.pu
@startuml

!define AWSPUML https://raw.githubusercontent.com/milo-minderbinder/AWS-PlantUML/release/18-2-22/dist
!includeurl AWSPUML/common.puml
!includeurl AWSPUML/ApplicationServices/AmazonAPIGateway/AmazonAPIGateway.puml
!includeurl AWSPUML/Compute/AWSLambda/LambdaFunction/LambdaFunction.puml
!includeurl AWSPUML/Database/AmazonDynamoDB/table/table.puml
!includeurl AWSPUML/General/AWScloud/AWScloud.puml
!includeurl AWSPUML/General/client/client.puml
!includeurl AWSPUML/General/users/users.puml
!includeurl AWSPUML/NetworkingContentDelivery/AmazonCloudFront/AmazonCloudFront.puml
!includeurl AWSPUML/NetworkingContentDelivery/AmazonRoute53/AmazonRoute53.puml
!includeurl AWSPUML/NetworkingContentDelivery/AmazonVPC/AmazonVPC.puml
!includeurl AWSPUML/Storage/AmazonS3/bucket/bucket.puml

AWSCLOUD(aws) {
    AMAZONROUTE53(route53)
    AMAZONCLOUDFRONT(cloudfront)

    AMAZONVPC(vpc) {
        LAMBDAFUNCTION(lambda,RestFunction)
        AMAZONAPIGATEWAY(api,RestApi)
        BUCKET(web_bucket,web)
        BUCKET(log_bucket,log)
        TABLE(table, records)
    }
}

USERS(users,Users)
CLIENT(client)

users -> client
client -> route53
client -> cloudfront
cloudfront -> api

api -> lambda
lambda -> web_bucket
lambda -> table

web_bucket .> log_bucket

route53 .[hidden]. cloudfront
table .[hidden]. web_bucket

@enduml
```

図にすると以下のような感じ。

{{< img src="/img/puml_aws.png" >}}

あまり複雑なシステムになると、PlantUMLで綺麗に書くのは難しい。

そういう時はおとなしくVisioとかで書きましょう。

---

{{< ad/con/wide/aws >}}

---

{{< ad/a8/techacademy1>}}

---