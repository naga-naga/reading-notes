# 作業メモ

## ダミーデータの挿入

### 挿入クエリ
ChatGPT 君に出してもらった。

```SQL
INSERT INTO employees (first_name, last_name, date_of_birth, phone_number)
SELECT
  CONCAT('First', seq) AS first_name,
  CONCAT('Last', seq) AS last_name,
  DATE_ADD('1970-01-01', INTERVAL FLOOR(RAND() * 18000) DAY) AS date_of_birth,
  CONCAT(FLOOR(100 + RAND() * 899), '-', FLOOR(100 + RAND() * 899), '-', FLOOR(1000 + RAND() * 8999)) AS phone_number
FROM (
  SELECT @rownum := @rownum + 1 AS seq
  FROM (SELECT 0 UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) t1,
       (SELECT 0 UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) t2,
       (SELECT 0 UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) t3,
       (SELECT 0 UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) t4,
       (SELECT 0 UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) t5,
       (SELECT 0 UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) t6,
       (SELECT @rownum := 0) t7
) seqs;
```

サブクエリで `10^7` 件の連番のテーブルを作り、それを `first_name` と `last_name` に入れている。
`date_of_birth` と `phone_number` は `RAND()` で適当に生成している。

### 実行時間
インデックスの無い状態で10秒程度かかっている。

```
Query OK, 1000000 rows affected, 2 warnings (10.23 sec)
Records: 1000000  Duplicates: 0  Warnings: 2
```

## カラム追加
`ALTER TABLE` と `UPDATE` で追加。

```SQL
ALTER TABLE employees ADD subsidiary_id INT NOT NULL;

UPDATE employees
SET subsidiary_id = FLOOR(RAND() * 9) + 1;
```

### 実行計画
`subsidiary_id` のみを `WHERE` に指定したクエリの実行計画を見てみる。

まだインデックスを作っていないので、テーブルをフルスキャンしている（`type = ALL`）。

```
mysql> explain select * from employees where subsidiary_id = 7;
+----+-------------+-----------+------------+------+---------------+------+---------+------+--------+----------+-------------+
| id | select_type | table     | partitions | type | possible_keys | key  | key_len | ref  | rows   | filtered | Extra       |
+----+-------------+-----------+------------+------+---------------+------+---------+------+--------+----------+-------------+
|  1 | SIMPLE      | employees | NULL       | ALL  | NULL          | NULL | NULL    | NULL | 993170 |    10.00 | Using where |
+----+-------------+-----------+------------+------+---------------+------+---------+------+--------+----------+-------------+
1 row in set, 1 warning (0.01 sec)
```

### インデックスを作成する
```
mysql> CREATE INDEX index_subsidiary_id ON employees (subsidiary_id);
Query OK, 0 rows affected (3.58 sec)
Records: 0  Duplicates: 0  Warnings: 0
```

実行計画を見ると、`subsidiary_id` を指定したときの `type` は `ref` になっている。

```
mysql> explain select * from employees where subsidiary_id = 7;
+----+-------------+-----------+------------+------+---------------------+---------------------+---------+-------+--------+----------+-------+
| id | select_type | table     | partitions | type | possible_keys       | key                 | key_len | ref   | rows   | filtered | Extra |
+----+-------------+-----------+------------+------+---------------------+---------------------+---------+-------+--------+----------+-------+
|  1 | SIMPLE      | employees | NULL       | ref  | index_subsidiary_id | index_subsidiary_id | 4       | const | 218664 |   100.00 | NULL  |
+----+-------------+-----------+------------+------+---------------------+---------------------+---------+-------+--------+----------+-------+
1 row in set, 1 warning (0.02 sec)
```

`SELECT` で指定する列を `subsidiary_id`  のみにすると、`Extra` に `Using index` が出る。
テーブルアクセスが不要なため、高速。

```
mysql> explain select subsidiary_id  from employees where subsidiary_id = 7;
+----+-------------+-----------+------------+------+---------------------+---------------------+---------+-------+--------+----------+-------------+
| id | select_type | table     | partitions | type | possible_keys       | key                 | key_len | ref   | rows   | filtered | Extra       |
+----+-------------+-----------+------------+------+---------------------+---------------------+---------+-------+--------+----------+-------------+
|  1 | SIMPLE      | employees | NULL       | ref  | index_subsidiary_id | index_subsidiary_id | 4       | const | 218664 |   100.00 | Using index |
+----+-------------+-----------+------------+------+---------------------+---------------------+---------+-------+--------+----------+-------------+
1 row in set, 1 warning (0.00 sec)
```
