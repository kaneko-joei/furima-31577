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

has_many :products dependent: :destroy
belongs_to :destination dependent: :destroy



## sendding テーブル

| Column       | Type    | Options                        |
| ------------ | ------- | ------------------------------ |
| family_name  | string  | null: false                    |
| first_name   | string  | null: false                    |
| post_cord    | string  | null: false                    |
| adress       | string  | null: false                    |
| phone_number | string  | null: false                    |

belongs_to :user

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
belongs_to :category dependent: :destroy


## Purchase management テーブル

| Column       | Type      | Options                        |
| ------------ | -------   | ------------------------------ |
| user         | refrence  | null: false, foreign_key: true |
| product      | refrence  | null: false, foreign_key: true |

has_many :products dependent: :destroy