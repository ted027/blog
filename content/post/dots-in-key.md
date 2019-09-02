---
title: "jqでドットが入ったkeyを扱う"
date: 2019-09-02T15:45:28+09:00
draft: true
comments: true
toc: true
categories: ["Shell"]
tags: ["json", "jq"]
---

jsonのkey名に"."が入っていると困惑することになる。

<!--more-->

---

{{< ad/ >}}

---

### jqの基本用法

シェルでjsonを扱う際、jqを使って要素を取り出すことができる。

```json
{
    "result": {
        "2019": {
            "yomiuri": "sasaki"
        }
    }
}
```

```sh
$ cat draft.json | jq .result.2019.yomiuri

sasaki
```

jsonを取得して、パイプで繋いでjq…という使われ方が多い気がする。

要素がリストの場合、`[]`を指定すればリストを剥がして取得できる。
`Elasticsearch`に直接クエリをかける場合なんかは以下のように使える。

```sh
$ curl -XGET "https:DomainfElasticSearch/myIndex/_serach" | jq .hits.hits

[ {"index1"}, {"index2"}, {"index3"}, ... ]
```

```sh
$ curl -XGET "https:DomainfElasticSearch/myIndex/_serach" | jq .hits.hits[]

{"index1"}, {"index2"}, {"index3"}, ...
```

引き抜いた要素を組み替えて出力したりもできる。

```sh
$ curl -XGET "https:DomainfElasticSearch/myIndex/_serach" | jq .hits.hits[]._source | [.header.myid1, .body.myid2]

["ID101", "ID201"], ["ID102", "ID202"], ...
```

---

### keyにドットが入っている場合

---

{{< ad/ >}}

---
