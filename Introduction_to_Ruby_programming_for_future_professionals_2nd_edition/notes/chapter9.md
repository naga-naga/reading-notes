## 例外処理
- `rescue` は複数並べられる
- `retry`
  - `begin` の最初からやり直せる
- `full_message`
  - 発生した例外、エラーメッセージ、バックトレースを返す
- `rescue` にも `else` を繋げられる
  - `ensure` より前に書く
- 例外処理も返り値を持つ
  - そのまま変数に格納したり、メソッドの返り値として使ったり出来る
- `rescue` を後置できる
  - `1 / 0 rescue 0 #=> 0`
  - ただし、例外クラスの指定はできない
    - `StandardError` になる
- `$!` と `$@`
  - `$!` には例外メッセージが入る
  - `$@` にはバックトレースが入る
- `rescue` 内部で `raise`
  - 引数を省略すると、補足した例外をもう一度投げる