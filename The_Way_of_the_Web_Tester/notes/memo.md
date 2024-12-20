# 第1章
- 自動テストで大事なこと
  - 自動テストの種類によって向き・不向きがある
  - あるテストを「書くことができる」ことは、必ずしも「書くべきだ」という理由にはならない
  - 高速にテストを実行し、フィードバックを素早く得ることが大事
- テストのピラミッド
  - UI テスト
    - UI 層に対応
  - 統合テスト
    - サービス層に対応
  - ユニットテスト
    - ロジック層に対応
- 各テストの特徴
  - UI テスト
    - 利用者の視点でのテスト
    - E2E（エンドツーエンド）テスト
    - 全てがつながっていることを検証できる
    - 遅く、壊れやすい
  - 統合テスト
    - UI の変更に影響されない
    - 複数の機能の繋がりを検証できる
    - 詳細さに欠ける
  - ユニットテスト
    - 高速
    - テスト失敗時、どの部分が上手くいかなかったのかが厳密に分かる
    - 統合部分の確認には弱い
- テストに関する経験則
  - ユニットテストを優先すること
  - ユニットテストで埋められない部分を統合テストでカバーすること
  - UI テストは限定的に使うこと
  - テストは出来る限り下の層に入れるのが良い
  - 全てを自動化しようとするのではなく、過不足なく自動化する

# 第2章
- UI テストの話
- スモークテスト
  - システムが基本的なレベルで動作していることを確認する高レベルのテスト
  - 最低限動いていることを保証してくれる

# 第3章
- CSS セレクタの話
  - ID があると楽
- UI テストは緩く保つのが良い
  - 例：メッセージの存在のみをチェックし、文言まではチェックしない
  - 理由：詳細に書きすぎると、UI とテストの結合が密になりすぎ、テストが壊れやすくなるため

# 第4章
- 統合テストの話
- 複数の部品が繋がっていることを確認できる堅牢性と、十分な機動性がある
- REST について
  - リソースの名前を URL として定義し、4つの動詞で操作する

# 第5章
- RESTful な Web サービスの統合テストについて
- CRUD の各操作に対してのテストの書き方の例
  - リクエストを投げて、指定のリソースが取得、作成、更新、削除されることを確認する