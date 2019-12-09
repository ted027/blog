---
title: "TypeScriptのOptional Property"
date: 2019-12-09T23:25:07+09:00
draft: false
comments: true
toc: false
categories: ["TypeScript"]
tags: ["property", "型"]
---

<!--more-->

---

{{< ad/a8/techacademy2 >}}

---

TypeScriptで、指定しなくてもいいpropertyも含めた型宣言をしてしまうと、指定しなかった場合にエラーが出てしまう。

```ts
interface Props extends WithStyles<typeof styles> {
  title: string
  default_order: 'asc' | 'desc';
  default_orderBy: string;
  league: 'Central' | 'Pacific';
  ...
}

class CommonTable extends React.Component<Props, State> {
    ...
}
...

class Main extends React.Component<MainProps> {

render() {
    return (
        <CommonTable
            title="交流戦順位表"
            default_order="desc"
            default_orderBy="勝率"
            // league を指定しないとエラーになる
        />
        ...
    )
}
```

---

Optionalな値は、宣言の際に`?`をつけることで、存在しない場合もあるが、存在する場合はこの型、といった指定ができる。

```ts
interface Props extends WithStyles<typeof styles> {
  title: string
  default_order: 'asc' | 'desc';
  default_orderBy: string;
  league?: 'Central' | 'Pacific';
  ...
}
```

---

{{< ad/con/wide/react >}}

---

{{< ad/a8/techacademy_nodejs >}}

---
