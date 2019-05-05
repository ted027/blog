---
title: "Pythonでプロ野球の個人成績一覧をJSONにして取得する"
date: 2019-05-02T12:11:56+09:00
draft: false
comments: true
categories: ["野球"]
tags: ["プロ野球", "Python", "個人成績"]
---

スコア速報と同じく、Pythonでスクレイピングして各チーム最新の個人成績を取得したい。

<!--more-->

---

{{< ad/a8/skyperfect>}}

---

{{< ad/con/wide/python_analytics >}}

---

### やること

プロ野球の個人成績を見れるサイトのhtmlから要素を引っこ抜き、個人成績ページから適当に情報をつまんでJSONにまとめる。

---

### 書いてみる

```python:records.py
import requests
import json
from bs4 import BeautifulSoup

NAME_HI = -1
TEAM_H1 = -2
EXCEPT_TITLE = 1
EXCEPT_TITLE_HEADER = 2
EXCEPT_HEAD_CONTENT = 1
CHANCE_STR_DIVIDER = 3
PITCHER_DUMP_VAL = 1
HITTER_DUMP_VAL = 2

...

def request_soup(url):
    res = requests.get(url)
    res.raise_for_status()
    return BeautifulSoup(res.content, 'html.parser')


def link_tail_list(url):
    soup = request_soup(url)
    table = soup.find('table')
    td_player_list = table.find_all('td', class_='lt yjM')
    return [pl.find('a').get('href') for pl in td_player_list]


def full_val(str_val):
    if str_val == '-':
        return '0'
    return str_val


def basic_information(personal_soup):
    name = personal_soup.find_all('h1')[NAME_HI].text.split('（')[0]
    team = personal_soup.find_all('h1')[TEAM_H1].text
    return {'Name': name, 'Team': team}


def confirm_pitcher_tables(tables):
    """
    return basic and right/left records
    """
    records_table = rl_table = None
    for table in tables:
        table_type = table.find('tr').text.replace('\n', '')
        if table_type == '投手成績':
            records_table = table
        elif table_type == '左右打者別成績':
            rl_table = table
    return records_table, rl_table


def confirm_hitter_tables(tables):
    """
    return basic, chance, right/left, count, runner records
    """
    records_table = chance_table = rl_table = count_table = runner_table = None
    for table in tables:
        table_type = table.find('tr').text.replace('\n', '')
        if table_type == '打者成績':
            records_table = table
        elif table_type == '得点圏成績':
            chance_table = table
        elif table_type == '左右投手別成績':
            rl_table = table
        elif table_type == 'カウント別成績':
            count_table = table
        elif table_type == '塁状況別成績':
            runner_table = table
    return records_table, chance_table, rl_table, count_table, runner_table


def dict_records(records_table):
    rheader = [th.text for th in records_table.find_all('th')[EXCEPT_TITLE:]]
    rbody = [full_val(td.text) for td in records_table.find_all('td')]
    return dict(zip(rheader, rbody))


def chance_records(chance_table):
    chheader_raw = [th.text for th in chance_table.find_all('th')]
    chheader = [
        chheader_raw[0][:CHANCE_STR_DIVIDER] + h
        for h in chheader_raw[EXCEPT_HEAD_CONTENT:]
    ]

    chbody = [full_val(td.text) for td in chance_table.find_all('td')]
    return dict(zip(chheader, chbody))


def records_by_rl(rl_table, dump_val):
    """
    dump_val: remove top contentof
            pitcher: 1 ('打者')
            hitter: 2 ('投手', '打席')
    """
    rl_header = [th.text for th in rl_table.find_all('th')][dump_val:]

    rl_trs = rl_table.find_all('tr')[EXCEPT_TITLE_HEADER:]
    rl_records = {}
    for rl_tr in rl_trs:
        rl_text = rl_tr.find('td').text
        rl_body = [full_val(td.text) for td in rl_tr.find_all('td')[dump_val:]]
        if '右' in rl_text:
            rl_records['対右'] = dict(zip(rl_header, rl_body))
        elif '左' in rl_text:
            rl_records['対左'] = dict(zip(rl_header, rl_body))

    return rl_records


def records_by_count_or_runner(table_by):
    header = [th.text for th in table_by.find_all('th')][EXCEPT_HEAD_CONTENT:]

    body_tr = table_by.find_all('tr')[EXCEPT_TITLE_HEADER:]
    records_by_count_or_runner = {}
    for tr in body_tr:
        situation = tr.find('td').text
        body = [
            full_val(td.text) for td in tr.find_all('td')[EXCEPT_HEAD_CONTENT:]
        ]
        records_by_count_or_runner[situation] = dict(zip(header, body))
    return records_by_count_or_runner


def append_team_pitcher_array(link_tail_list):
    team_pitcher_list = []
    for ptail in link_tail_list:

        personal_link = BASEURL + ptail
        personal_soup = request_soup(personal_link)

        personal_dict = basic_information(personal_soup)

        tables = personal_soup.find_all('table')
        records_table, rl_table = confirm_pitcher_tables(tables)

        records = dict_records(records_table)

        if rl_table:
            records_rl = records_by_rl(rl_table, PITCHER_DUMP_VAL)
            records.update(records_rl)

        personal_dict['Records'] = records

        team_pitcher_list.append(personal_dict)

    return team_pitcher_list


def append_team_hitter_array(link_tail_list):
    team_hitter_list = []
    for htail in link_tail_list:

        personal_link = BASEURL + htail
        personal_soup = request_soup(personal_link)

        personal_dict = basic_information(personal_soup)

        tables = personal_soup.find_all('table')
        records_table, chance_table, rl_table, count_table, runner_table = confirm_hitter_tables(
            tables)

        records = dict_records(records_table)

        if chance_table:
            ch_records = chance_records(chance_table)
            records.update(ch_records)

        if rl_table:
            records_rl = records_by_rl(rl_table, HITTER_DUMP_VAL)
            records.update(records_rl)

        if count_table:
            records_by_count = records_by_count_or_runner(count_table)
            records.update({'カウント': records_by_count})

        if runner_table:
            records_by_runner = records_by_count_or_runner(runner_table)
            records.update({'走者': records_by_runner})

        personal_dict['Records'] = records

        team_hitter_list.append(personal_dict)

    return team_hitter_list


def append_records_array():
    pitcher_list = []
    hitter_list = []
    for i in TEAM_NUM_LIST:

        purl = BASEURL + 'npb/teams/' + str(i) + '/memberlist?type=p'
        hurl = BASEURL + 'npb/teams/' + str(i) + '/memberlist?type=b'

        pit_link_tail_list = link_tail_list(purl)
        hit_link_tail_list = link_tail_list(hurl)

        team_pitcher_list = append_team_pitcher_array(pit_link_tail_list)
        pitcher_list.extend(team_pitcher_list)

        team_hitter_list = append_team_hitter_array(hit_link_tail_list)
        hitter_list.extend(team_hitter_list)

    return pitcher_list, hitter_list


pitcher_list, hitter_list = append_records_array()

with open('pitchers.json', 'w') as pf:
    json.dump({'Pitcher': pitcher_list}, pf, indent=2, ensure_ascii=False)

with open('hitters.json', 'w') as hf:
    json.dump({'Hitter': hitter_list}, hf, indent=2, ensure_ascii=False)
```

---

### 結果

以下のような`JSON`ファイルで保存される。

```json
{
  "Pitcher": [
    {
      "Name": "山口 俊",
      "Team": "読売ジャイアンツ",
      "Records": {
        "防御率": "1.59",
        "登板": "5",
        "先発": "5",
        "完投": "0",
        "完封": "0",
        "無四球": "0",
        "QS": "4",
        "交代完了": "0",
        "勝利": "4",
        "敗戦": "0",
        "ホールド": "0",
        "HP": "0",
        "セーブ": "0",
        "勝率": "1.000",
        "投球回": "34",
        "打者": "137",
        "被安打": "19",
        "被本塁打": "1",
        "奪三振": "30",
        "奪三振率": "7.94",
        "与四球": "16",
        "与死球": "4",
        "暴投": "1",
        "ボーク": "0",
        "失点": "7",
        "自責点": "6",
        "被打率": ".168",
        "K/BB": "1.88",
        "WHIP": "1.03",
        "対右": {
          "被打率": ".082",
          "被打数": "49",
          "被安打": "4",
          "被本塁打": "1",
          "奪三振": "15",
          "与四球": "10",
          "与死球": "4"
        },
        "対左": {
          "被打率": ".234",
          "被打数": "64",
          "被安打": "15",
          "被本塁打": "0",
          "奪三振": "15",
          "与四球": "6",
          "与死球": "0"
        }
      }
    },
    ...
```

---

### おわり

MLBはオープンデータがある程度提供されているが、日本だとそういうのは無さそう。

Webサイトのちょっとした仕様変更とかで動かなくなりそうなので、定期的に取るならメンテナンスが大変。

[[参考記事]JSONで取得したプロ野球個人成績にQS率,K/BB,WHIP(,他)を追加する](https://www.ted027.com/post/sabr-1)

[[参考記事]JSONで取得したプロ野球個人成績にwOBA,BB/Kを追加する](https://www.ted027.com/post/sabr-2)

[[参考記事]Pythonでプロ野球スコア速報を取得する](https://www.ted027.com/post/python-score)

---

{{< ad/con/wide/python_taikutsu >}}

---

{{< ad/a8/skyperfect>}}

---