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
| birth-year       | int     | null: false |
| birth-month      | int     | null: false |
| birth-day        | int     | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| image               | string     | null: false                    |
| product-name        | string     | null: false                    |
| product-discription | text       | null: false                    |
| product-category    | string     | null: false                    |
| product-status      | string     | null: false                    |
| delivery-burden     | int        | null: false                    |
| shipping-area       | string     | null: false                    |
| days-ship           | int        | null: false                    |
| price               | int        | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column           | Type       | Options                        |
| ---------------- | -------    | ------------------------------ |
| purchase_history | boolean    | null: false                    |
| item             | references | null: false, foreign_key: true |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item


