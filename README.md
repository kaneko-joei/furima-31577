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
| birth_date              | string | null: false               |

has_many :products dependent: :destroy
belongs_to :destination dependent: :destroy



## destinations テーブル

| Column       | Type    | Options                        |
| ------------ | ------- | ------------------------------ |
| user_id      | integer | null: false, foreign_key: true |
| family_name  | string  | null: false                    |
| first_name   | string  | null: false                    |
| post_cord    | string  | null: false                    |
| adress       | string  | null: false                    |
| phone_number | string  |                                |

belongs_to :user

## product テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| name             | string  | null: false |
| price            | string  | null: false |
| description      | string  | null: false |
| status_id        | text    | null: false |
| sipping_cost_id  | string  | null: false |
| shipping_days_id | string  | null: false |
| user_id          | string  | null: false |
| category_id      | string  | null: false |
| prefecture_id    | string  | null: false |

belongs_to :user dependent: :destroy
belongs_to :category dependent: :destroy
belongs_to :brand dependent: :destroy
has_many :images dependent: :destroy
belongs_to_active_hash :prefecture

## Purchase management テーブル

| Column          | Type    | Options        |
| --------------- | ------- | -------------- |
| seller          | reference | null: false  |
| buyer           | reference | null: false  |
| preparation_day | integer   | null: false  |
| price           | integer   | null: false  |
| item            | integer   | null: false  |


belongs_to :seller.class_name:"User"
belongs_to :buyer,class_name:"User"
has_many :item_images,dependent::destroy 
belongs_to_active_hash :preparation_day