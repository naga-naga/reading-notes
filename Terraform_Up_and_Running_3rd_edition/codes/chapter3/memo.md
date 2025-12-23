# 適用手順
1. `terraform` ブロックをコメントアウトしたまま `terraform apply` する
2. コメントアウトを外して `terraform init` する

# 削除手順
1. `terraform` ブロックをコメントアウトして `terraform init -migrate-state` する
2. `aws_s3_bucket` の `lifecycle` ブロックをコメントアウトし、 `force_destroy = true` を付けて `terraform apply` する（諸説あり）
   - バケットを空にする必要があるかもしれない
3. `terraform destroy` する
