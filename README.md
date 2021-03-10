# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| nickname           | string | null: false              |
| email              | string | null: false, unique:true |
| encrypted_password | string | null: false              |
| last_name          | string | null: false              |
| first_name         | string | null: false              |
| last_name_kana     | string | null: false              |
| first_name_kana    | string | null: false              |
| birth_date         | date   | null: false              |

### Association

- has_many :items
- has_many :purchase-records

## Items テーブル

| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| name        | text       | null: false       |
| text        | text       | null: false       |
| category_id | integer    | null: false       |
| status_id   | integer    | null: false       |
| fee_id      | integer    | null: false       |
| day_id      | integer    | null: false       |
| price       | integer    | null: false       |
| user        | references | foreign_key: true |

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
