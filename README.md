# テーブル設計

## users テーブル

| Column                  | Type   | Options                   |
| ----------------------- | ------ | ------------------------- |
| nickname                | string | null: false               |
| email                   | string | null: false, unique: true |
| encrypted_password      | string | null: false               |
| family_name             | string | null: false               |
| first_name              | string | null: false               |
| family_name_kana        | string | null: false               |
| first_name_kana         | string | null: false               |
| birth_date              | date   | null: false               |

has_one :product dependent: :destroy



## sendding テーブル

| Column        | Type    | Options                        |
| ------------- | ------- | ------------------------------ |
| post_cord     | string  | null: false                    |
| prefecture_id | integer | null: false                    |
| municipality  | string  | null: false                    |
| adress        | string  | null: false                    |
| building name | string  |                                |
| phone_number  | string  | null: false                    |


belongs_to :user dependent: :destroy

## product テーブル

| Column           | Type      | Options                        |
| ---------------- | --------- | ------------------------------ |
| name             | string    | null: false                    |
| price            | integer   | null: false                    |
| description      | text      | null: false                    |
| status_id        | integer   | null: false                    |
| sipping_cost_id  | integer   | null: false                    |
| shipping_days_id | integer   | null: false                    |
| user             | reference | null: false, foreign_key: true |
| category_id      | integer   | null: false                    |
| prefecture_id    | integer   | null: false                    |

belongs_to :user dependent: :destroy

## Purchase management テーブル

| Column       | Type      | Options                        |
| ------------ | -------   | ------------------------------ |
| user         | refrence  | null: false, foreign_key: true |
| product      | refrence  | null: false, foreign_key: true |

belong_to :user dependent: :destroy
has_one :product dependent: :destroy