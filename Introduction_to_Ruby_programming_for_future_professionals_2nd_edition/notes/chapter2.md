## 第2章
- メソッド呼び出しのカッコはスペースを空けない
  - OK: `add(a, b)`
  - NG: `add (a, b)`
    - おそらく `add` メソッドに `(a, b)` を渡す形になり、 `(a, b)` が構文エラーになる
- 変数名は基本的にスネークケース
- 多重代入が可能
  - `a, b = 10, 20`
- 数値にアンダースコアを使える
  - `a = 1_000_000`
- 整数同士の割り算は切り捨て
  - `5 / 3 #=> 1`
  - 小数にしたいなら `.0` をつける
- インクリメント、デクリメントはない
- 文字列と数値の暗黙的な変換はできない
- 有理数型
  - `Rational` 型
  - `0.1r` のように、 `r` をつける
- 複数行の文字列
  - 「ヒアドキュメント」というらしい
  - `<<TEXT ... TEXT` みたいにする
  - `TEXT` でなくてもよい
  - `<<~` とすると、内部の文字列の先頭の空白を無視する
    - このとき、行頭に `\` を入れるとそこから行が始まる
    - つまり内部の文字列の先頭に空白を入れることができる
  - 式展開も可能
- 文字列のフォーマット
  - `sprintf`
- デフォルト引数
  - `def method(a = 10, b = 20)`
