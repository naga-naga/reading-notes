## ハッシュ
- `==` の比較はキーと値を見る
  - 両方がすべて一致すれば等しい
- `**` で展開
  - ハッシュを結合させたり、キーワード引数として渡したり
- メソッド呼び出しの最後の引数の `{ }` は省略可能
  - 配列でも同じ
- 第1引数としてハッシュを渡したい場合は `( )` が必要
  - `{ } ` がブロックとして解釈されるため

## シンボル
- 内部的には整数らしい
  - 比較が速い

## キーワード引数
- `**nil`
  - キーワード引数を受け取らない