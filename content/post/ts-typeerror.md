---
title: "TypeScriptの型割り当てエラー"
date: 2019-11-10T23:29:05+09:00
draft: false
comments: true
toc: false
categories: ["TypeScript"]
tags: ["型", "エラー"]
---

<!--more-->

---

{{< ad/afb/codecamp >}}

---

TypeScriptで型宣言をする際、適当に`string`や`number`のようなレベルで宣言していると、外部モジュールを使った際にエラーが出ることがある。

```js
import * as React from "react";
import Slide from "@material-ui/core/Slide";
...

interface HideOnScrollProps {
  children: React.FC;
  direction: string;
}

export const HideOnScroll: React.FC<HideOnScrollProps> = ({ children, direction }) => {
  const trigger = useScrollTrigger({ target: undefined });
  return (
    <Slide appear={false} direction={direction} in={!trigger}> // <- directionがエラー
      {children}
    </Slide>
  );
}
```

```
型 'string' を型 '"left" | "right" | "up" | "down"' に割り当てることはできません。
```

実際に`Material-UI`の`Slide.d.ts`を覗いてみると、directionというattributeがstringの限定的な型で宣言されていることがわかる。

```js
export interface SlideProps extends TransitionProps {
  direction: 'left' | 'right' | 'up' | 'down';
  ref?: React.Ref<unknown>;
  theme?: Theme;
}

declare const Slide: React.ComponentType<SlideProps>;

export default Slide;
```

こうした場合、このattributeに入れる変数が`string`なだけでは不十分で、型を満たさない値が入らないように型宣言しなくてはならない。

```js
import * as React from "react";
import Slide from "@material-ui/core/Slide";
...

interface HideOnScrollProps {
  children: React.FC;
  direction: 'up' | 'down';
}

export const HideOnScroll: React.FC<HideOnScrollProps> = ({ children, direction }) => {
  const trigger = useScrollTrigger({ target: undefined });
  return (
    <Slide appear={false} direction={direction} in={!trigger}>
      {children}
    </Slide>
  );
}
```

これで`direction`に想定外の値が入ることを防ぐことができる。

---

{{< ad/con/wide/react >}}

---

{{< ad/a8/techacademy_nodejs >}}

---
