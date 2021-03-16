# テーブル設計

## users テーブル

| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| nickname      | string | null: false |
| email         | string | null: false |
| user_password | string | null: false |
| family_name   | string | null: false |
| first_name    | string | null: false |
| user_image    | string |             |



## destination テーブル

| Column       | Type    | Options                        |
| ------------ | ------- | ------------------------------ |
| user_id      | integer | null: false, foreign_key: true |
| family_name  | string  | null: false                    |
| first_name   | string  | null: false                    |
| post_cord    | string  | null: false                    |
| adress       | string  | null: false                    |
| phone_number | string  |                                |

## product テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| name             | string  | null: false |
| price            | string  | null: false |
| description      | string  | null: false |
| status_id        | string  | null: false |
| size             | string  | null: false |
| judgment         | string  |             |
| sipping_cost_id  | string  | null: false |
| shipping_days_id | string  | null: false |
| user_id          | string  | null: false |
| category_id      | string  | null: false |
| prefecture_id    | string  | null: false |

## image テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| image      | string     | null: false                    |
| product_id | string     | null: false, foreign_key: true |

