---
title: "Functional Componentで'missing display name'エラー"
date: 2020-01-21T12:46:18+09:00
draft: false
comments: true
toc: false
categories: ["React"]
tags: ["TypeScript", "JavaScript", "Functional Component"]
---

<!--more-->

---

{{< ad/con/wide/react >}}

---

### 問題

`React`の`Functional Component`で、引数を適用して関数を返したい場合がある。

この際、関数内部で関数を定義することになるが、この内部の関数を無名関数にすると`ESLint`でエラーが出る。

```ts
const createIcon = (name: string) => {
    return (props => <i {...props} class={name}>)
}
```

`Component definition is missing display name react/display-name`

---

### 原因と対策

デバッグのために、全てのコンポーネントに名前を付けることが推奨されるため。上だと`createIcon`の返り値が無名コンポーネントになるので怒られる。

対策としては、関数名をつければよい。

```ts
const createIcon = (name: string) => {
    return (
        function icon(props) {
            return <i {...props} class={name}>
        }
    )
}
```

`missing display name`と言われているが、`displayName`を指定する必要はない。（が、指定を推奨されている）

- https://stackoverflow.com/questions/41581130/what-is-react-component-displayname-is-used-for

---

{{< ad/a8/techacademy_ui >}}

---
