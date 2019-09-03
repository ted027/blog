---
title: "jqでドットが入ったkeyを扱う"
date: 2019-09-03T20:45:28+09:00
draft: false
comments: true
toc: true
categories: ["Shell"]
tags: ["json", "jq"]
---

jsonのkey名に"."が入っていると困惑することになる。

<!--more-->

---

{{< ad/a8/techacademy1>}}

---

### jqの基本用法

シェルでjsonを扱う際、jqを使って要素を取り出すことができる。

```json
{
    "result": {
        "yomiuri": {
            "first_pick": "sasaki"
        }
    }
}
```

```sh
$ cat draft.json | jq .result.yomiuri.first_pick

sasaki
```

要素がリストの場合、`[]`を指定すればリストを剥がして取得できる。
`Elasticsearch`に直接クエリをかける場合に以下のように使える。

```sh
$ curl -XGET "https:DomainfElasticSearch/myIndex/_serach" | jq .hits.hits

[ {<index1>}, {<index2>}, {<index3>}, ... ]
```

```sh
$ curl -XGET "https:DomainfElasticSearch/myIndex/_serach" | jq .hits.hits[]

{<index1>}, {<index2>}, {<index3>}, ...
```

引き抜いた要素を組み替えて出力したりもできる。

```sh
$ curl -XGET "https:DomainfElasticSearch/myIndex/_serach" | jq .hits.hits[]._source | [.header.myid1, .body.myid2]

["ID101", "ID201"], ["ID102", "ID202"], ...
```

---

### keyにドットが入っている場合

"."(ドット)で階層を繋いで要素を指定するので、key名にドットが使われていたりすると困ることになる。

```json
{
    "result": {
        "yomiuri.giants": {
            "first_pick": "sasaki"
        }
    }
}
```

```sh
$ cat draft.json | jq .result.yomiuri.giants.first_pick

null
```

この場合、ドットでなく角括弧["key名"]で要素を指定するとちゃんと取れる。

その際、角括弧もしくは全体を'(シングルクオート)で括る。

```sh
$ cat draft.json | jq .result'["yomiuri.giants"]'.first_pick

sasaki

$ cat draft.json | jq '.result["yomiuri.giants"].first_pick'

sasaki
```

keyに数字やハイフンが入っていても同様で、ドットでは指定できないが角括弧で指定できる。

```json
{
    "result": {
        "2019": {
            "yomiuri-giants": {
                "1位": "sasaki"
            }
        }
    }
}
```

```sh
$ cat draft.json | jq .result'["2019"]["yomiuri-giants"]["1位"]'

sasaki
```

---

### おわり

今年のドラフト、自分は佐々木君がいいんですけどどうですかね？

ミーハーであれなんですけどU-18見てたら石川君も好きになっちゃいますね。

---

{{< ad/con/wide/unix >}}

---

{{< ad/con/wide/sabr_omata >}}

---
