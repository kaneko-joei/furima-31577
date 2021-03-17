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
| birth_date              | text   | null: false               |

has_many :products dependent: :destroy
belongs_to :destination dependent: :destroy



## destinations テーブル

| Column       | Type    | Options                        |
| ------------ | ------- | ------------------------------ |
| family_name  | string  | null: false                    |
| first_name   | string  | null: false                    |
| post_cord    | string  | null: false                    |
| adress       | string  | null: false                    |
| phone_number | string  | null: false                    |

belongs_to :user

## product テーブル

| Column           | Type      | Options     |
| ---------------- | --------- | ----------- |
| name             | string    | null: false |
| price            | integer   | null: false |
| description      | text      | null: false |
| status_id        | integer   | null: false |
| sipping_cost_id  | integer   | null: false |
| shipping_days_id | integer   | null: false |
| user_id          | reference | null: false |
| category_id      | integer   | null: false |
| prefecture_id    | integer   | null: false |

belongs_to :user dependent: :destroy
belongs_to :category dependent: :destroy
belongs_to :brand dependent: :destroy
has_many :images dependent: :destroy
belongs_to_active_hash :prefecture

## Purchase management テーブル

| Column          | Type      | Options                        |
| --------------- | -------   | ------------------------------ |
| user_id         | integer   | null: false, foreign_key: true |
| product_id      | integer   | null: false                    |

has_many :products dependent: :destroy