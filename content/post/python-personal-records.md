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

BASEURL = 'https://baseball.yahoo.co.jp/'

NAME_HI = -1
TEAM_H1 = -2

EXCEPT_TITLE = 1
EXCEPT_TITLE_HEADER = 2

EXCEPT_HEAD_CONTENT = 1

CHANCE_STR_DIVIDER = 4

PITCHER_DUMP_VAL = 1
HITTER_DUMP_VAL = 2

TEAM_NUM_LIST = [376 if i == 10 else i for i in list(range(1, 13))]


def request_soup(url):
    res = requests.get(url)
    res.raise_for_status()
    return BeautifulSoup(res.content, "html.parser")


def link_tail_list(url):
    soup = request_soup(url)
    table = soup.find("table")
    td_player_list = table.find_all('td', class_='lt yjM')
    return [pl.find('a').get('href') for pl in td_player_list]


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
        if '投手成績' in table_type:
            records_table = table
        elif '左右打者別成績' in table_type:
            rl_table = table
    return records_table, rl_table


def confirm_hitter_tables(tables):
    """
    return basic, chance, right/left, count, runner records
    """
    records_table = chance_table = rl_table = count_table = runner_table = None
    for table in tables:
        table_type = table.find('tr').text.replace('\n', '')
        if '打者成績' in table_type:
            records_table = table
        elif '得点圏成績' in table_type:
            chance_table = table
        elif '左右投手別成績' in table_type:
            rl_table = table
        elif 'カウント別成績' in table_type:
            count_table = table
        elif '塁状況別成績' in table_type:
            runner_table = table
    return records_table, chance_table, rl_table, count_table, runner_table


def dict_records(records_table):
    rheader = [th.text for th in records_table.find_all('th')[EXCEPT_TITLE:]]
    rbody = [td.text for td in records_table.find_all('td')]
    return dict(zip(rheader, rbody))


def chance_records(chance_table):
    chheader_raw = [th.text for th in chance_table.find_all('th')]
    chheader = [chheader_raw[0][:CHANCE_STR_DIVIDER] + h for h in chheader_raw[EXCEPT_HEAD_CONTENT:]]

    chbody = [td.text for td in chance_table.find_all('td')]
    return dict(zip(chheader, chbody))


def records_by_rl(rl_table, dump_val):
    """
    dump_val: remove top contentof
            pitcher: 1 ('打者')
            hitter: 2 ('投手', '打席')
    """
    rl_header = [th.text for th in rl_table.find_all('th')][dump_val:]
    r_header = ['対右' + h for h in rl_header]
    l_header = ['対左' + h for h in rl_header]

    rl_trs = rl_table.find_all('tr')[EXCEPT_TITLE_HEADER:]
    rl_records = {}
    for rl_tr in rl_trs:
        rl_body = [td.text for td in rl_tr.find_all('td')]
        if '右' in rl_body[0]:
            rl_records['対右'] = dict(zip(rl_header, rl_body[dump_val:]))
        elif '左' in rl_body[0]:
            rl_records['対左'] = dict(zip(rl_header, rl_body[dump_val:]))

    return rl_records


def records_by_count_or_runner(table_by):
    header = [th.text for th in table_by.find_all('th')][EXCEPT_HEAD_CONTENT:]

    body_tr = table_by.find_all('tr')[EXCEPT_TITLE_HEADER:]
    records_by_count_or_runner = {}
    for tr in body_tr:
        body = [td.text for td in tr.find_all('td')]
        records_by_count_or_runner[body[0]] = dict(zip(header, body[EXCEPT_HEAD_CONTENT:]))
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
        records_table, chance_table, rl_table, count_table, runner_table = confirm_hitter_tables(tables)

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
        "防御率": "3.60",
        "登板": "2",
        "先発": "2",
        "完投": "0",
        "完封": "0",
        "無四球": "0",
        "QS": "0",
        "交代完了": "0",
        "勝利": "0",
        "敗戦": "1",
        "ホールド": "0",
        "HP": "0",
        "セーブ": "0",
        "勝率": ".000",
        "投球回": "10",
        "打者": "35",
        "被安打": "7",
        "被本塁打": "2",
        "奪三振": "9",
        "奪三振率": "8.10",
        "与四球": "2",
        "与死球": "0",
        "暴投": "0",
        "ボーク": "0",
        "失点": "4",
        "自責点": "4",
        "被打率": ".212",
        "K/BB": "4.50",
        "WHIP": "0.90",
        ...
```

---

### おわり

MLBはオープンデータがある程度提供されているが、日本だとそういうのは無さそうです。

Webサイトのちょっとした仕様変更とかで動かなくなりそうなので、定期的に取るならメンテナンスが大変。

---

{{< ad/con/wide/python_taikutsu >}}

---