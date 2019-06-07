---
title: "PlantUMLでいろんなアイコンを使ったシステム構成図を作る"
date: 2019-05-16T23:08:58+09:00
draft: false
comments: true
categories: ["UML"]
tags: ["PlantUML", "アイコン", "構成図"]
---

PlantUMLで図を作るとき、各種サービスやその他色々なアイコンを入れ込むことができる。

<!--more-->

---

{{< ad/a8/techstars>}}

---

{{< ad/con/wide/uml >}}

---

- [[参考記事]PlantUML + Visual Studio Codeを導入する（Windows環境）](https://www.ted027.com/post/puml-win)

- [[参考記事]PlantUML + Visual Studio Codeを導入する（Ubuntu環境）](https://www.ted027.com/post/puml-ubu)

---

UML図とかちょっとした説明に使う図に、あんなアイコンを入れたい、あのサービスのアイコンを入れたい…と思うときがある。

自分はそういう時、`plantuml-icon-font-sprites`を使っています。

- https://github.com/tupadr3/plantuml-icon-font-sprites

適当なフォルダを覗くと、画像ファイルも一緒に入っているので、確認しながら選ぶことができる。

---

### 使ってみる

適当に使ってみる。

```plantuml
@startuml

!define ICONURL https://raw.githubusercontent.com/tupadr3/plantuml-icon-font-sprites/v2.0.0
!includeurl ICONURL/common.puml
!includeurl ICONURL/font-awesome/amazon.puml
!includeurl ICONURL/font-awesome/android.puml
!includeurl ICONURL/font-awesome/apple.puml
!includeurl ICONURL/font-awesome/chrome.puml
!includeurl ICONURL/font-awesome/facebook_square.puml
!includeurl ICONURL/font-awesome/google.puml

!includeurl ICONURL/font-awesome-5/amazon_pay.puml
!includeurl ICONURL/font-awesome-5/app_store_ios.puml
!includeurl ICONURL/font-awesome-5/aws.puml
!includeurl ICONURL/font-awesome-5/apple_pay.puml
!includeurl ICONURL/font-awesome-5/facebook_messenger.puml
!includeurl ICONURL/font-awesome-5/google_drive.puml
!includeurl ICONURL/font-awesome-5/google_play.puml
!includeurl ICONURL/font-awesome-5/instagram.puml
!includeurl ICONURL/font-awesome-5/itunes.puml

FA_AMAZON(amazon) #White {
    FA5_AMAZON_PAY(amazonpay) #White
    FA5_AWS(aws) #White
}

FA_FACEBOOK_SQUARE(fb) #White {
    FA5_FACEBOOK_MESSENGER(mes) #White
    FA5_INSTAGRAM(insta) #White
}

FA_APPLE(apple) #White {
    FA5_APP_STORE_IOS(appstore) #White
    FA5_APPLE_PAY(apppay) #White
    FA5_ITUNES(itunes) #White
}

FA_GOOGLE(google) #White {
    FA_ANDROID(android) #White
    FA_CHROME(chrome) #White
    FA5_GOOGLE_DRIVE(drive) #White
    FA5_GOOGLE_PLAY(play) #White
}

google .[hidden]r. apple
apple .[hidden]r. fb
fb .[hidden]r. amazon

@enduml
```

{{< img src="/img/puml-various-1.png" >}}

どこかで見たことあるアイコン。

---

```plantuml
@startuml

!define ICONURL https://raw.githubusercontent.com/tupadr3/plantuml-icon-font-sprites/v2.0.0
!includeurl ICONURL/common.puml
!includeurl ICONURL/devicons/aws.puml
!includeurl ICONURL/devicons/docker.puml
!includeurl ICONURL/devicons/python.puml
!includeurl ICONURL/devicons/ubuntu.puml

!includeurl ICONURL/font-awesome-5/baseball_ball.puml
!includeurl ICONURL/font-awesome-5/bitcoin.puml
!includeurl ICONURL/font-awesome-5/jedi_order.puml
!includeurl ICONURL/font-awesome-5/user.puml

FA5_USER(user) #White {
    FA5_JEDI_ORDER(jedi) #White
    FA5_BITCOIN(bit) #White
    FA5_BASEBALL_BALL(baseball) #White
    DEV_PYTHON(python) #White
    DEV_AWS(myaws) #White
    DEV_DOCKER(docker) #White
    DEV_UBUNTU(ubuntu) #White
}

@enduml
```

{{< img src="/img/puml-various-2.png" >}}

`jedi_order`がある…！

---


`example`にはこんなのが載ってます。

```plantuml
@startuml

skinparam defaultTextAlignment center

!define ICONURL https://raw.githubusercontent.com/tupadr3/plantuml-icon-font-sprites/v2.0.0

!includeurl ICONURL/common.puml
!includeurl ICONURL/font-awesome-5/server.puml
!includeurl ICONURL/font-awesome-5/gitlab.puml
!includeurl ICONURL/font-awesome/gears.puml
!includeurl ICONURL/font-awesome/fire.puml
!includeurl ICONURL/font-awesome/clock_o.puml
!includeurl ICONURL/font-awesome/lock.puml
!includeurl ICONURL/font-awesome/cloud.puml

!includeurl ICONURL/devicons/nginx.puml
!includeurl ICONURL/devicons/mysql.puml
!includeurl ICONURL/devicons/redis.puml
!includeurl ICONURL/devicons/docker.puml
!includeurl ICONURL/devicons/linux.puml

FA_CLOUD(internet,internet,cloud) #White {

}

DEV_LINUX(debian,Linux,node){

	FA_CLOCK_O(crond,crond) #White
	FA_FIRE(iptables,iptables) #White

	DEV_DOCKER(docker,docker,node)  {
		DEV_NGINX(nginx,nginx,node) #White
		DEV_MYSQL(mysql,mysql,node) #White
		DEV_REDIS(redis,redis,node) #White
		FA5_SERVER(nexus,nexus3,node) #White
		FA5_GITLAB(gitlab,gitlab,node) #White
		FA_GEARS(gitlabci,gitlab-ci-runner,node) #White

		FA_LOCK(letsencrypt,letsencrypt-client,node) #White
	}
}

internet ..> iptables : http

iptables ..> nginx : http
nginx ..> nexus : http
nginx ..> gitlab : http
gitlabci ..> gitlab : http
gitlab ..> mysql : tcp/ip
gitlab ..> redis : tcp/ip

crond --> letsencrypt : starts every month

@enduml
```

{{< img src="/img/puml-various-3.png" >}}

---

- [[参考記事]PlantUMLでAWSアイコンを使ったシステム構成図を作る](https://www.ted027.com/post/puml-aws)

- [[参考記事]PlantUML + Visual Studio Codeを導入する（Windows環境）](https://www.ted027.com/post/puml-win)

- [[参考記事]PlantUML + Visual Studio Codeを導入する（Ubuntu環境）](https://www.ted027.com/post/puml-ubu)

---

---

{{< ad/con/wide/aws >}}

---

{{< ad/a8/techacademy1>}}

---
