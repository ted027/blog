---
title: "PlantUMLでAWSアイコンを使ったシステム構成図を作る"
date: 2019-04-25T17:02:54+09:00
draft: true
comments: true
categories: ["PlantUML"]
tags: ["AWS", "PlantUML", "構成図"]
---

公開されているAWS Simple Iconsのpumlファイルをincludeすることで、PlantUMLで簡単に図に導入できる。

 <!--more-->

---

<div class="kaerebalink-box" style="text-align:left;padding-bottom:20px;font-size:small;zoom: 1;overflow: hidden;"><div class="kaerebalink-image" style="float:left;margin:0 15px 10px 0;"><a href="//af.moshimo.com/af/c/click?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062&amp;url=https%3A%2F%2Fwww.amazon.co.jp%2F%25E3%2583%2580%25E3%2582%25A4%25E3%2582%25A2%25E3%2582%25B0%25E3%2583%25A9%25E3%2583%25A0%25E5%2588%25A5UML%25E5%25BE%25B9%25E5%25BA%2595%25E6%25B4%25BB%25E7%2594%25A8-%25E7%25AC%25AC2%25E7%2589%2588-DB-Magazine-SELECTION%2Fdp%2F4798118443" rel="nofollow" target="_blank"><img src="https://images-fe.ssl-images-amazon.com/images/I/51l0OwohmdL._SL160_.jpg" style="border: none;"/></a><img height="1" src="//i.moshimo.com/af/i/impression?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062" style="border:none;" width="1"/></div><div class="kaerebalink-info" style="line-height:120%;zoom: 1;overflow: hidden;"><div class="kaerebalink-name" style="margin-bottom:10px;line-height:120%"><a href="//af.moshimo.com/af/c/click?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062&amp;url=https%3A%2F%2Fwww.amazon.co.jp%2F%25E3%2583%2580%25E3%2582%25A4%25E3%2582%25A2%25E3%2582%25B0%25E3%2583%25A9%25E3%2583%25A0%25E5%2588%25A5UML%25E5%25BE%25B9%25E5%25BA%2595%25E6%25B4%25BB%25E7%2594%25A8-%25E7%25AC%25AC2%25E7%2589%2588-DB-Magazine-SELECTION%2Fdp%2F4798118443" rel="nofollow" target="_blank">ダイアグラム別UML徹底活用 第2版</a><img height="1" src="//i.moshimo.com/af/i/impression?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062" style="border:none;" width="1"/></div><div class="kaerebalink-detail" style="margin-bottom:5px;"></div><div class="kaerebalink-link1" style="margin-top:10px;"><div class="shoplinkamazon" style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 0 no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;"><a href="//af.moshimo.com/af/c/click?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062&amp;s_v=b5Rz2P0601xu&amp;url=https%3A%2F%2Fwww.amazon.co.jp%2Fgp%2Fsearch%3Fkeywords%3DUML%25E3%2580%2580%25E8%25A8%25AD%25E8%25A8%2588%26__mk_ja_JP%3D%25E3%2582%25AB%25E3%2582%25BF%25E3%2582%25AB%25E3%2583%258A" rel="nofollow" target="_blank">Amazonで調べる</a><img height="1" src="//i.moshimo.com/af/i/impression?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062" style="border:none;" width="1"/></div><div class="shoplinkrakuten" style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 -50px no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;"><a href="//af.moshimo.com/af/c/click?a_id=1414727&amp;p_id=54&amp;pc_id=54&amp;pl_id=616&amp;s_v=b5Rz2P0601xu&amp;url=https%3A%2F%2Fsearch.rakuten.co.jp%2Fsearch%2Fmall%2FUML%25E3%2580%2580%25E8%25A8%25AD%25E8%25A8%2588%2F-%2Ff.1-p.1-s.1-sf.0-st.A-v.2%3Fx%3D0" rel="nofollow" target="_blank">楽天市場で調べる</a><img height="1" src="//i.moshimo.com/af/i/impression?a_id=1414727&amp;p_id=54&amp;pc_id=54&amp;pl_id=616" style="border:none;" width="1"/></div><div class="shoplinkyahoo" style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 -150px no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;"><a href="//af.moshimo.com/af/c/click?a_id=1418766&amp;p_id=1225&amp;pc_id=1925&amp;pl_id=18502&amp;s_v=b5Rz2P0601xu&amp;url=http%3A%2F%2Fsearch.shopping.yahoo.co.jp%2Fsearch%3Fp%3DUML%25E3%2580%2580%25E8%25A8%25AD%25E8%25A8%2588" rel="nofollow" target="_blank">Yahooショッピングで調べる</a><img height="1" src="//i.moshimo.com/af/i/impression?a_id=1418766&amp;p_id=1225&amp;pc_id=1925&amp;pl_id=18502" style="border:none;" width="1"/></div><div class="shoplinkseven" style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 -100px no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;"><a href="//af.moshimo.com/af/c/click?a_id=1414728&amp;p_id=932&amp;pc_id=1188&amp;pl_id=12456&amp;s_v=b5Rz2P0601xu&amp;url=http%3A%2F%2F7net.omni7.jp%2Fsearch%2F%3Fkeyword%3DUML%25E3%2580%2580%25E8%25A8%25AD%25E8%25A8%2588%26searchKeywordFlg%3D1" rel="nofollow" target="_blank"><img src=" af="" height="1" i="" i.moshimo.com="" impression?a_id='1414728&amp;p_id=932&amp;pc_id=1188&amp;pl_id=12456"' style="border:none;" width="1">7netで調べる</img src="></a></div></div></div><div class="booklink-footer" style="clear: left"></div></div>

---

- [Windows環境にVSCode+PlantUMLを導入する](https://www.ted027.com/post/puml-win)

- [Ubuntu環境にVSCode+PlantUMLを導入する](https://www.ted027.com/post/puml-ubu)

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

```
AWS_SERVICE_NAME_UPPERCASE(puml resource name, display name)
```

`cloud`みたいに、`{}`で括って他のサービスを入れたりできる。

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

users -r-> client
client -r-> route53
client -r-> cloudfront
cloudfront --> api

api -r-> lambda
lambda -r-> web_bucket
lambda -r-> table

web_bucket .r.> log_bucket

route53 .[hidden]. cloudfront
table .[hidden]. web_bucket

@enduml

```

矢印中の`r`は右方向矢印、の意味。

- `r`(right), `l`(left), `t`(top), `b`(bottom)

指定しなければ`b`(bottom)にしようとするはず。

自由に配置を変えることはできないけど、これを使ってある程度配置を整えられる。

図にすると以下のような感じ。

{{< img src="/img/puml_aws.png" >}}

あまり複雑なシステムになると、PlantUMLで綺麗に書くのは難しい。

そういう時はおとなしくVisioとかで書きましょう。

---

<div class="kaerebalink-box" style="text-align:left;padding-bottom:20px;font-size:small;zoom: 1;overflow: hidden;"><div class="kaerebalink-image" style="float:left;margin:0 15px 10px 0;"><a href="//af.moshimo.com/af/c/click?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062&amp;url=https%3A%2F%2Fwww.amazon.co.jp%2F%25E5%25BE%25B9%25E5%25BA%2595%25E6%2594%25BB%25E7%2595%25A5-AWS%25E8%25AA%258D%25E5%25AE%259A-%25E3%2582%25BD%25E3%2583%25AA%25E3%2583%25A5%25E3%2583%25BC%25E3%2582%25B7%25E3%2583%25A7%25E3%2583%25B3%25E3%2582%25A2%25E3%2583%25BC%25E3%2582%25AD%25E3%2583%2586%25E3%2582%25AF%25E3%2583%2588-%25E2%2580%2593-%25E3%2582%25A2%25E3%2582%25BD%25E3%2582%25B7%25E3%2582%25A8%25E3%2582%25A4%25E3%2583%2588%25E6%2595%2599%25E7%25A7%2591%25E6%259B%25B8%2Fdp%2F4295005495" rel="nofollow" target="_blank"><img src="https://images-fe.ssl-images-amazon.com/images/I/51ODtT%2BwepL._SL160_.jpg" style="border: none;"/></a><img height="1" src="//i.moshimo.com/af/i/impression?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062" style="border:none;" width="1"/></div><div class="kaerebalink-info" style="line-height:120%;zoom: 1;overflow: hidden;"><div class="kaerebalink-name" style="margin-bottom:10px;line-height:120%"><a href="//af.moshimo.com/af/c/click?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062&amp;url=https%3A%2F%2Fwww.amazon.co.jp%2F%25E5%25BE%25B9%25E5%25BA%2595%25E6%2594%25BB%25E7%2595%25A5-AWS%25E8%25AA%258D%25E5%25AE%259A-%25E3%2582%25BD%25E3%2583%25AA%25E3%2583%25A5%25E3%2583%25BC%25E3%2582%25B7%25E3%2583%25A7%25E3%2583%25B3%25E3%2582%25A2%25E3%2583%25BC%25E3%2582%25AD%25E3%2583%2586%25E3%2582%25AF%25E3%2583%2588-%25E2%2580%2593-%25E3%2582%25A2%25E3%2582%25BD%25E3%2582%25B7%25E3%2582%25A8%25E3%2582%25A4%25E3%2583%2588%25E6%2595%2599%25E7%25A7%2591%25E6%259B%25B8%2Fdp%2F4295005495" rel="nofollow" target="_blank">徹底攻略 AWS認定 ソリューションアーキテクト – アソシエイト教科書</a><img height="1" src="//i.moshimo.com/af/i/impression?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062" style="border:none;" width="1"/></div><div class="kaerebalink-detail" style="margin-bottom:5px;"></div><div class="kaerebalink-link1" style="margin-top:10px;"><div class="shoplinkamazon" style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 0 no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;"><a href="//af.moshimo.com/af/c/click?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062&amp;s_v=b5Rz2P0601xu&amp;url=https%3A%2F%2Fwww.amazon.co.jp%2Fgp%2Fsearch%3Fkeywords%3DAWS%26__mk_ja_JP%3D%25E3%2582%25AB%25E3%2582%25BF%25E3%2582%25AB%25E3%2583%258A" rel="nofollow" target="_blank">Amazonで調べる</a><img height="1" src="//i.moshimo.com/af/i/impression?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062" style="border:none;" width="1"/></div><div class="shoplinkrakuten" style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 -50px no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;"><a href="//af.moshimo.com/af/c/click?a_id=1414727&amp;p_id=54&amp;pc_id=54&amp;pl_id=616&amp;s_v=b5Rz2P0601xu&amp;url=https%3A%2F%2Fsearch.rakuten.co.jp%2Fsearch%2Fmall%2FAWS%2F-%2Ff.1-p.1-s.1-sf.0-st.A-v.2%3Fx%3D0" rel="nofollow" target="_blank">楽天市場で調べる</a><img height="1" src="//i.moshimo.com/af/i/impression?a_id=1414727&amp;p_id=54&amp;pc_id=54&amp;pl_id=616" style="border:none;" width="1"/></div><div class="shoplinkyahoo" style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 -150px no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;"><a href="//af.moshimo.com/af/c/click?a_id=1418766&amp;p_id=1225&amp;pc_id=1925&amp;pl_id=18502&amp;s_v=b5Rz2P0601xu&amp;url=http%3A%2F%2Fsearch.shopping.yahoo.co.jp%2Fsearch%3Fp%3DAWS" rel="nofollow" target="_blank">Yahooショッピングで調べる</a><img height="1" src="//i.moshimo.com/af/i/impression?a_id=1418766&amp;p_id=1225&amp;pc_id=1925&amp;pl_id=18502" style="border:none;" width="1"/></div><div class="shoplinkseven" style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 -100px no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;"><a href="//af.moshimo.com/af/c/click?a_id=1414728&amp;p_id=932&amp;pc_id=1188&amp;pl_id=12456&amp;s_v=b5Rz2P0601xu&amp;url=http%3A%2F%2F7net.omni7.jp%2Fsearch%2F%3Fkeyword%3DAWS%26searchKeywordFlg%3D1" rel="nofollow" target="_blank"><img src=" af="" height="1" i="" i.moshimo.com="" impression?a_id='1414728&amp;p_id=932&amp;pc_id=1188&amp;pl_id=12456"' style="border:none;" width="1">7netで調べる</img src="></a></div></div></div><div class="booklink-footer" style="clear: left"></div></div>

---