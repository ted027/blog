---
title: "CircleCIで定期実行"
date: 2019-05-26T14:27:01+09:00
draft: false
comments: true
toc: false
categories: ["CI"]
tags: ["CircleCI", "cron", "定期実行"]
---

CircleCIでジョブをcron設定し定期実行する。

<!--more-->

---

{{< ad/a8/techacademy2>}}

---

{{< ad/a8/onamae >}}

---

`config.yml`のworkflow設定で実現できる。

```yml
version: 2
jobs:
  build:
    steps:
      - checkout
      - run:
        name: build step
        command: |
          some commands

workflows:
  version: 2
  normal_build:
    jobs:
      - build
  nightly_build:
    triggers:
      - schedule:
          cron: "0 15 * * *" # UTC15:00, 日本時間0:00
          filters:
            branches:
              only:
                - master
    jobs:
      - build
```

`triggers: schedule`でcronを設定（UTCなので、日本時間マイナス9時間）する。

たとえば上のように、毎晩masterブランチでビルドし直したり、毎晩テストを実行したり。

自分はブログのアクセス数上位記事を毎晩取得するのに使ってます。

---

{{< ad/con/wide/devops >}}

---

{{< ad/a8/techacademy>}}

---
