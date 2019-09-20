---
title: "Pythonでの日時取得とタイムゾーン"
date: 2019-09-20T12:43:09+09:00
draft: false
comments: true
toc: true
categories: ["Python"]
tags: ["datetime", "タイムゾーン"]
---

<!--more-->

---

{{< ad/con/wide/python_analytics >}}

---

### 日時取得

```py
from datetime import datetime

# 現在日時取得
datetime.now()

# 指定の日時
datetime(2019, 9, 20, 12, 30, 59, 100000)
```

### 日時表示形式（文字列）

```py
# 文字列表示
>>> datetime(2019, 9, 20, 12, 30, 59, 100000).strftime('%Y/%m/%d(%a) %H:%M:%S.%f')
'2019/9/20(Fri) 12:30:59.100000'

# 定形文字列表示
## ISO 8601形式
>>> datetime(2019, 9, 20, 12, 30, 59, 100000).isoformat()
'2019-09-20T12:30:59.100000'

## ctime形式
>>> datetime(2019, 9, 20, 12, 30, 59, 100000).strftime('%c')
'Fri Sep 20 12:30:59 2019'

## unixtime
>>> datetime(2019, 9, 20, 12, 30, 59, 100000).strftime('%s')
'1568950259'

# %Yで年4桁表示、%yで年下2桁表示
>>> datetime(2019, 9, 20, 12, 30, 59, 100000).strftime('%Y %y')
'2019 19'

# %Hで24時間表記、%Iで12時間表記,  %pでAM/PM表示
>>> datetime(2019, 9, 20, 15, 30, 59, 100000).strftime('%H / %p %I')
'15 / PM 3'

# %xで年月日, %Xで時分秒を2桁ずつ表示
>>> datetime(2019, 9, 20, 12, 30, 59, 100000).strftime('%x %X')
'09/20/19 12:30:59'

# %Bで月名, %bで月名（短縮）
>>> datetime(2019, 9, 20, 12, 30, 59, 100000).strftime('%B %b')
'September Sep'

# %Aで曜日名, %aで曜日名（短縮）
>>> datetime(2019, 9, 20, 12, 30, 59, 100000).strftime('%A %a')
'Friday Fri'
```

### 日時表示形式（datetime型）

```py
# 文字列からdatetime型
>>> datetime.strptime('2019-09-20 12:30:59.100000', '%Y-%m-%d %H:%M:%S.%f')
datetime.datetime(2019, 9, 20, 12, 30, 59, 100000)
# unixtimeからdatetime型
>>> datetime.fromtimestamp(1568950259)
datetime.datetime(2019, 9, 20, 12, 30, 59, 100000)
```

### 日時を加算/減算

```py
from datetime import datetime, timedelta

# 現在日時取得
datetime.now() + timedelta(weeks=1)
datetime.now() - timedelta(days=3)
datetime.now() + timedelta(hours=10)
datetime.now() - timedelta(minutes=30)
datetime.now() + timedelta(milliseconds=1)
datetime.now() - timedelta(microseconds=1)
```

### ミリ秒以下を削除

```py
>>> dt = datetime(2019,9,20,12,30,59,1000).replace(microsecond=0)
>>> dt.isoformat()
'2019-09-20T12:30:59'
```

### タイムゾーン設定

`pytz`を使う。

```py
from datetime import datetime, timedelta
import pytz

# UTC時間を取得
>>> datetime.now(pytz.utc)
datetime.datetime(2019, 9, 20, 3, 30, 59, 100000 tzinfo=<UTC>)
>>> datetime.now(pytz.utc).isoformat()
'2019-09-20T12:30:59.100000+00:00'
>>> datetime.now(pytz.utc).isoformat().replace('+00:00', 'Z')
'2019-09-20T12:30:59.100000Z'

# LocalTimeを取得
>>> tz = pytz.timezone('Asia/Tokyo')
>>> dt = datetime.now()
>>> tz.localize(dt)
datetime.datetime(2019, 9, 20, 12, 30, 59, 100000, tzinfo=<DstTzInfo 'Asia/Tokyo' JST+9:00:00 STD>)
>>> tz.localize(dt).isoformat()
'2019-09-20T12:30:59.100000+09:00'

# TimeZoneを取得
>>> tz.localize(dt).tzinfo
<DstTzInfo 'Asia/Tokyo' JST+9:00:00 STD>
```

---

{{< ad/con/wide/python_taikutsu >}}

---

{{< ad/a8/techacademy >}}

---
