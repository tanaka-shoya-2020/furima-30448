# テーブル設計

## users テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------  |
| name             | string  | null: false |
| email            | string  | null: false |
| password         | string  | null: false |
| family-name      | string  | null: false |
| first-name       | string  | null: false |
| family-name-kana | string  | null: false |
| first-name-kana  | string  | null: false |
| birth-day        | date    | null: false |


### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column               | Type       | Options                        |
| -------------------  | ---------- | ------------------------------ |
| product-name         | string     | null: false                    |
| product-discription  | text       | null: false                    |
| product-category_id  | int        | null: false                    |
| product-status_id    | int        | null: false                    |
| delivery-burden_id   | int        | null: false                    |
| shipping-area_id     | int        | null: false                    |
| days-ship_id         | int        | null: false                    |
| price                | int        | null: false                    |
| user                 | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column           | Type       | Options                        |
| ---------------- | -------    | ------------------------------ |
| item             | references | null: false, foreign_key: true |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

### Addresses テーブル

| Column         | Type       | Options                        |
| ---------------| ---------- | ------------------------------ |
| postal-code    | string     | null: false                    |
| prefecture_id  | int        | null: false                    |
| municipality   | string     | null: false                    |
| address        | string     | null: false                    |
| building-name  | string     |                                |
| phone-number   | string     | null: false                    |
| purchase       | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase

