# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last-name       | string | null: false |
| first-name      | string | null: false |
| last-name-kana  | string | null: false |
| first-name-kana | string | null: false |
| birth-date      | date   | null: false |

### Association

- has_many :items
- has_many :purchase-records

## Items テーブル

| Column   | Type       | Options           |
| -------- | ---------- | ----------------- |
| product  | text       | null: false       |
| text     | text       | null: false       |
| category | string     | null: false       |
| status   | string     | null: false       |
| fee      | string     | null: false       |
| day      | string     | null: false       |
| price    | integer    | null: false       |
| user     | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase-record

## Purchase-Records テーブル

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has one :shipping-address

## Shipping-Addresses テーブル

| Column          | Type       | Options           |
| --------------- | ---------- | ----------------- |
| Postal-code     | integer    | null: false       |
| Prefecture      | string     | null: false       |
| City            | string     | null: false       |
| Address         | string     | null: false       |
| Phone-number    | integer    | null: false       |
| Purchase-Record | references | foreign_key: true |

### Association

- belongs_to :purchase-record
