---
title: "規定打席, 規定投球回の到達/未到達を追加"
date: 2019-05-19T14:28:24+09:00
draft: false
comments: true
categories: ["野球"]
tags: ["Python", "規定打席", "規定投球回"]
---

以前取得したプロ野球の個人成績とチーム成績から、各人が規定打席/投球回に到達しているかを算出し、成績に書き加える。

<!--more-->

---

{{< ad/a8/skyperfect>}}

---

{{< ad/con/wide/purosupi2019>}}

---

- [[参考記事]Pythonでプロ野球の個人成績一覧をJSONにして取得する](https://www.ted027.com/post/python-personal-records)

---

いちいち使う場面にロジックを入れるのは面倒なので、計算して成績表に書き込んでおく。

### 規定打席, 規定投球回

それぞれ

- チーム試合数 * 3.1 (規定打席)
- チーム試合数 (規定投球回)

なので、各人の打席/投球回以外に、チームの試合数が必要。

---

### 実装

チームごとの試合数は、こちらもスクレイビングしてjsonに書き込んである。

今回作ったのは以下。

```py
def pick_dick(list_of_dict, str_key, str_value):
    for dic in list_of_dict:
        if dic[str_key] == str_value:
            return dic


def update_hitter_y_records(hitter_list, team_list):
    for hitter in hitter_list:
        if not hitter['試合']:
            reg_at_bat = False
        else:
            team = pick_dick(team_list, 'チーム', hitter['Team'])
            reg_at_bat = regulation_at_bat(team['試合'], hitter['打席'])
        hitter['規定'] = reg_at_bat

    return hitter_list


def update_pitcher_y_records(pitcher_list, team_list):
    for pitcher in pitcher_list:
        if not pitcher['登板']:
            reg_innings = False
        else:
            team = pick_dick(team_list, 'チーム', pitcher['Team'])
            reg_innings = regulation_innings(team['試合'], pitcher['投球回'])
        pitcher['規定'] = reg_innings

    return pitcher_list
```

[こちら](https://www.ted027.com/post/python-personal-records)で取得した個人成績と、チームごとの成績`team_list`から計算。

`pick_dick`はdickのリストから特定要素を見て、条件に合うdictを選択している。

こんなことをしなくても階層dictにすればいいんだけど、いずれjsonでなくDBに書き込みたいので、こうしておいた方が後々楽のような気がする。

---

{{< ad/con/wide/sabr>}}

---

{{< ad/a8/techacademy2>}}

---