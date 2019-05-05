---
title: "Pythonで有効数字を指定し四捨五入する"
date: 2019-05-05T11:47:48+09:00
draft: false
comments: true
categories: ["Python"]
tags: ["有効数字", "decimal", "round"]
---

指定の桁で四捨五入する。

<!--more-->

---

{{< ad/a8/techacademy>}}

---

{{< ad/con/wide/python_taikutsu >}}

---

以前記事で`K/BB`やら`wOBA`やらを算出するスクリプトを書いた。

- [[参考記事]JSONで取得したプロ野球個人成績にQS率,K/BB,WHIP(,他)を追加する](https://www.ted027.com/post/sabr-1)

- [[参考記事]JSONで取得したプロ野球個人成績にwOBA,BB/Kを追加する](https://www.ted027.com/post/sabr-2)

この際、有効数字や小数点以下の桁数を気にせず計算結果を格納している。

これを成績表記でよく見る桁数にしたい。

---

### 山本由伸のWHIP

```py
>>> whip = (int(pitcher['Records']['被安打']) + int(pitcher['Records']['与四球'])) / int(pitcher['Records']['投球回'])
>>> whip
0.6923076923076923
```

普通に計算すると、このように桁数が膨れ上がることがある。

---

### roundで丸める

Pythonの組み込み関数`round`を使うと値を丸めることができる。

引数なしで使うと整数に丸める。

```py
>>> round(whip)
1
```

引数`x`をつけると、$10^{-x}$の桁に丸める。

```py
>>> round(whip, 2)
0.69
```

これで見慣れた`WHIP`の表記になる。

---

### roundで四捨五入をする際の問題点

`round`は厳密な四捨五入ではなく、偶数への丸めを行っている。

`端数が0.5より小さいなら切り捨て、端数が0.5より大きいならは切り上げ、端数がちょうど0.5なら切り捨てと切り上げのうち結果が偶数となる方へ丸める。`(Wikipedia)

よって、ちょうど5の値を扱う際、正確な四捨五入がされない問題がある。

```py
>>> round(0.5)
0
>>> round(1.5)
2
>>> round(2.5)
2
>>> round(3.5)
4
```

ちなみに、今回のように小数点以下2桁以降の値を扱う際は、必ずしも偶数への丸めがされるわけではないが、正確な四捨五入でないことに変わりはない。

---

### decimal.quantize()で丸める

decimalモジュールのquantizeメソッドを使って丸めを行うことができる。

この際、引数に`ROUND_HALF_UP`を指定すると、0.5 → 1とする一般的な四捨五入となる。

(引数に`ROUND_HALF_EVEN`を指定すると、偶数への丸めとなる。)

```py
>>> from decimal import Decimal, ROUND_HALF_UP
>>> Decimal('0.5').quantize(Decimal('1'), ROUND_HALF_UP)
Decimal('1')
>>> Decimal('1.5').quantize(Decimal('1'), ROUND_HALF_UP)
Decimal('2')
>>> Decimal('2.5').quantize(Decimal('1'), ROUND_HALF_UP)
Decimal('3')
>>> Decimal('3.5').quantize(Decimal('1'), ROUND_HALF_UP)
Decimal('4')
```

山本由伸の`WHIP`も、ちゃんと桁数を指定して出せる。

```py
>>> whip
0.6923076923076923
>>> Decimal(str(whip)).quantize(Decimal('0.01'), ROUND_HALF_UP)
Decimal('0.69')
```

---

### decimal.quantize()で指標の桁数を指定する

指標計算の実装に小数点以下桁数指定を追加した。

```py:sabr.py
...
def _digits_under_one(value, digits):
    base = 10**(-1 * digits)
    return Decimal(str(value)).quantize(Decimal(str(base)),
                                        rounding=ROUND_HALF_UP)
...
def whip(pitcher):
    ...
    else:
        raw_whip = (int(pitcher['Records']['与四球']) + int(pitcher['Records']['被安打']) * 3 / outcounts
        whip = _digits_under_one(raw_whip, 2)
    pitcher['Records']['WHIP'] = str(whip)
...
def woba(hitter):
    ...
        raw_woba = numerator / denominator
        woba = _digits_under_one(raw_whip, 3)
    hitter['Records']['wOBA'] = str(woba)
```

これで、データサイトでよく見る指標の桁数に合わせることができた。

---

{{< ad/con/wide/python_dokugaku >}}

---

{{< ad/a8/skyperfect>}}

---