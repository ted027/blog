---
title: "AWS Devday2020雑記"
date: 2020-10-24T14:17:05+09:00
draft: false
comments: true
toc: true
categories: ["AWS"]
tags: ["serverless", "docker", "データベース"]
---

<!--more-->

---

{{< ad/con/wide/devops >}}

---

[AWS DevDay Online Japan](https://aws.amazon.com/jp/about-aws/events/2020/devday/)に参加したので雑記。  
仕事の都合で部分部分しか参加できていないですが。

---

### サーバーレス

#### コスト削減

- CloudFront->S3でキャッシュ使え、ApiGatewayでキャッシュ使え
- ロググループの保持期間 1年も必要？RetentionInDays設定
- RestAPIよりHttpAPIの方が安い
- lambdaのcompute saving planで1年分/3年分まとめて購入
  - ec2,lambda,fargate

#### セキュリティ

- lambdaのメモリ設定に比例して割当CPUも変わる
  - lambda power tuningで確認
  - メモリ/CPU上げると実行時間も下がって安くなったりする
- vpc lambdaにするとネットワーク,リージョンサービスから切り離される
  - これを利用してセキュアに保ってもいい
- api gateway, lambdaともsourceIP, sourceArnをpolicyで設定できる
  - 属人化しないようにルール化できる

---

### コンテナ開発

#### 環境変数

- 動作環境毎に異なる情報を変数として切り出す
- コード/コンテナに入れない
  - セキュリティリスク ソースの属環境化
- 外から渡す
  - 起動時に渡す / アプリから必要な時に取得
  - AWS SystemsManager, SecretsManager, S3

#### デプロイ

- コンテナのデプロイ時間短縮
  - コンテナイメージサイズを小さく
    - BaseImageで軽量選択（alpine, scratch, busybox）
    - 言語（シングルバイナリ/Golang）
    - Dockerfileの書き方
      - 不要なものを入れない
      - .dockerignoreを利用
      - マルチステージビルド
  - アプリケーション起動時間を短縮
    - root以外で実行
    - 必要なファイルはイメージとしてパッケージング
    - 実行環境に近い（同一リージョン）ECRイメージレジストリ利用
- ECRイメージスキャンで定期的に脆弱性スキャン

#### ログ

- 利用目的によって構成を変える
- 保管目的（頻度低 期間長）
  - Kinesis Firehose -> S3で保管
- 分析目的（頻度中 期間中）
  - Kinesis Firehose / Stream -> S3 -> Athena / Redshift
  - Kinesis Firehose -> S3 -> Data Analytics
- 監視目的（期間少 リアルタイム）
  - Cloudwatch
  - Kinesis Firehose -> Elasticsearch / kibana

#### モニタリング

- ContainerInsights
- X-Ray

---

### DynamoDB初心者向け

- 適切なProvisionedCapacityUnit設定できるならOndemanより安い？
- 先にテーブルを作り始めるのはNG
  - DynamoDBはデータ操作アクションが限られ、欲しいデータが持ってこれない 力技で持ってくると高い
  - データ、アクセス形式を固めてから作り始める
- Streams、TTL、PointInTimeRecoveryは意識して使う
- Partition毎に極端にアクセス偏るKey設計すべきではないが、AdaptiveCapacityが対応してくれるのでそんなに気にしなくてよい？
- アイテムサイズは減らす
  - CUは4KB、大きくとも1アイテム4KB以内に納めるべき
  - Queryで複数とってもCU消費しないように、本当はもっと小さい方がいい
  - 画像データとか入れない、S3に置いて配置先を入れる
  - Scanは高いからあまり使わないように
- 本当に最新データが必要か考える
  - 基本結果整合性で読む
  - アプリでキャッシュしていいものはキャッシュ
- GSI OVERLOADING使う
  - GSIで1つCU節約しつつ柔軟にクエリ出来る
- 先にローカル設計綿密にしてから作る
  - DynamoDB Local
    - ローカル環境向けDynamoDB
    - Dockerコンテナで提供、TTLとStream対応
  - WorkBench
    - データモデル設計、そのままimportとかできる

---

### DBの使い分け

- 要件をブレイクダウンして高い開発効率、低い運用負荷のDBを選ぶ
- アクセスパターン、データ量、スケールパターン、ユースケース、機能要件、エンジニアのスキルセット
- Working Backwards クエリを想定したデザイン 目的→必要なデータ→必要なクエリ
- 例①
  - 文書管理 タグや著者名、コメントを付与
    - データ量TB/そんなに多くない、不定形データ、ピークあり スパイクアクセスは無い  想定リクエスト数万/sec
  - →DoucumentDB
    - データは大きくない 開発効率の良さ 柔軟なデータ構造、クエリ
  - クエリベース
    - 記事IDで記事取得、作成日時でソートしX件取得、執筆者/タグで検索、記事IDでコメント一覧取得
- 例②
  - 例①から変化→スパイクアクセスあり 想定リクエストが数百万/sec  
→オートスケールが必要
  - DynamoDB Ondemandでピーク対応しながら全体コストを下げられる
  - 検索はDynamoDBstreamでElasticsearchに振ってもよい

---

### lambdaでtensorflowを使う

- 厳しいインフラ条件への対応で予測モデルを複数起動
  - SageMakerだとスケーリング遅い、無駄スケーリング、高コスト
- lambda上でtensorflow
  - 実行時間課金、不規則アクセスに強い
  - 環境制約強く高負荷の機械学習に向かない、環境が毎回リセットされる
- lambda用に工夫
  - serverlessでモジュールサイズ削減
    - python serverles1プラグインでサイズ落とす
  - 初期化処理をinitで吸収
    - lambdaのinit関数でモデルダウンロード、予測関数抽出を行い二回目以降は実行しない
- lambdaのデメリットは環境構築とサイズ上限

---

### アジャイルでクラウド開発

- ソフトウェアは無形で柔軟性が高い
- ソフトウェア開発の競合優位性とはアジリティである
  - アジリティを高め、顧客からのフィードバックを中心に経験主義的アプローチを重ねて価値を高めることが競合優位性になる
- ソフトウェア全体のアジリティを高める必要がある
  - バージョン管理、CI/CD、TDD、InfraAsCode、マイクロサービス
- アジリティを高めるためにアジャイル開発をする
  - 機能は細かくリリース
  - 都度リファクタリング リアーキテクチャリングを行う
- アジャイル開発で成果物を作る、リリースするのにマネージドなクラウドベンダサービスは有効だから使う
- クラウド活用アンチパターン
  - EC2インスタンス使いがち マネージドサービスを使わずEC2上にアプリ構築→インフラマネージで苦労
  - リザーブドインスタンス買いがち 予算立てやすいから買っちゃう→買った分は使うマインドで無駄設計
  - CI/CD整ってない リリースに人の手が多分に入りリリースに心理的負荷→リリース頻度低下、アジリティ低下
  - 本番と乖離した検証環境
  - 顧客目線でないサービス選定 マーケティング視点で新規サービス利用→SLA÷障害
- 教訓
  - 価格やマーケティングなど、システム以外の事案を中心に設計すべきではない

---

{{< ad/con/wide/aws >}}

---

{{< ad/a8/techacademy_py_ai >}}

---
