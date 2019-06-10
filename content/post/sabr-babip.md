---
title: "BABIPは本当に運を表す指標なのか？"
date: 2019-05-14T17:24:52+09:00
draft: false
comments: true
categories: ["野球"]
tags: ["Python", "セイバーメトリクス", "BABIP"]
---

<!--more-->

---

{{< ad/a8/skyperfect>}}

---

{{< ad/con/wide/pawapuro2018>}}

---

### BABIP (Batting Average on Balls In Play)

`BABIP`は、フェアグラウンド内に飛んだ打球が安打になる確率を表す指標。

$\frac{安打 - 本塁打}{打数 - 奪三振 - 本塁打 + 犠飛}$

「`BABIP`は.300程度に収束するもので、これを大きく上回る/下回る場合、その選手の成績は運によるものである」という使われ方をすることがある。

が、`BABIP`は運が全てではないことも明言されており、前述は不適切な使い方といえる。

実際に、運以外にも以下の要因が収束を妨げる。

---

### BABIPの収束を阻害する要因

#### 走力

一塁に到達するスピードが速ければ、フェアグラウンド内打球の安打率は上がる。

#### 守備力

守っているチームの守備力が高ければ、フェアグラウンド内に飛んだ打球をアウトにする確率は高くなり、`BABIP`は低くなる。

#### 守備シフト

打球方向に偏りのある打者の場合、シフトを敷くことで`BABIP`を低く抑えることができる。

#### フライ率、ゴロ率

一般的にフライのほうがゴロよりもアウトになりやすいといわれている。そのため、フライ率の多い選手は`BABIP`が低くなりやすい。

（ただし、統計的には、フライボールのうち本塁打になる割合は一定の範囲に収束する≒フライボール率の多い投手は被本塁打も増える、という考え方もある。※フライボール・レボリューション）

#### 打撃力

当然ながら、強い打球や安打になりやすいコースへの打球を打つ能力の高い選手は、そうでない選手と比べて`BABIP`が高くなる。

---

### 総じて

`BABIP`はリーグ全体、投手の通算成績といった長い目で見れば.300程度に収束することが多い。

一方、打者に関しては、.300ではなくその選手特有の値に収束しやすい。

なので、「`BABIP`が.400だから運がいい」のではなく、「10年プレイして平均`BABIP`が.300の選手が今年は.400だから運がいい」というような見方が正しい。はず。

---

### 実装

例によって、以下の記事で取得した個人成績から算出する。

- [[参考記事]Pythonでプロ野球の個人成績一覧をJSONにして取得する](https://www.ted027.com/post/python-personal-records)

ただし、投手の被犠飛数が取得できなかったため、今回は無視して算出している。

```py:sabr.py
def babip_p(pitcher):
    # denominator = Decimal(pitcher['被打数']) - Decimal(pitcher['奪三振']) - Decimal(
    #     pitcher['被本塁打']) + Decimal(pitcher['犠飛'])
    denominator = Decimal(pitcher['被打数']) - Decimal(pitcher['奪三振']) - Decimal(
        pitcher['被本塁打'])
    if not denominator:
        return '0'
    numerator = Decimal(pitcher['被安打']) - Decimal(pitcher['被本塁打'])
    raw_babip = numerator / denominator
    babip = digits_under_one(raw_babip, 3)
    return str(babip)


def babip_h(hitter):
    denominator = Decimal(hitter['打数']) - Decimal(hitter['三振']) - Decimal(
        hitter['本塁打']) + Decimal(hitter['犠飛'])
    if not denominator:
        return '0'
    numerator = Decimal(hitter['安打']) - Decimal(hitter['本塁打'])
    raw_babip = numerator / denominator
    babip = digits_under_one(raw_babip, 3)
    return str(babip)
```

---

### おわり

フェアグラウンド内に飛んだらあとは運（が絡むから無視）、という考え方が`BABIP`や[`DIPS`](https://www.ted027.com/post/sabr-pitch-fip#dipsという概念)に通じている。

ただ、数値化が難しいだけで、強い打球を打つ打者、捉えにくい球を投げる投手、というのは当然ある。`Soft%`や`Mid%`、`Hard%`といった指標があるが、NPBで個人で取得するのは難しい。

---

- [[参考記事]Pythonでプロ野球の個人成績一覧をJSONにして取得する](https://www.ted027.com/post/python-personal-records)

- [[参考記事]【RC, RC27, XR, XR27】NPB(2019)セイバーメトリクス野手指標の算出④](https://www.ted027.com/post/sabr-hit-rc)

- [[参考記事]【RCWIN, XRWIN】NPB(2019)セイバーメトリクス野手指標の算出⑥](https://www.ted027.com/post/sabr-hit-rcaa)

---

{{< ad/con/wide/sabr_omata>}}

---

{{< ad/afb/codecamp>}}

---
