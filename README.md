# テーブル設計

## users テーブル

| Column             | Type   | Options                 |
| ------------------ | ------ | ----------------------- |
| email              | string | null: false unique: true|
| encrypted_password | string | null: false             |
| nickname           | string | null: false             |
| last_name          | string | null: false             |
| first_name         | string | null: false             |
| last_name_kana     | string | null: false             |
| first_name_kana    | string | null: false             |
| birthday           | date   | null: false             |

### Association
has_many :orders
has_many :items


## ship_addresses テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| post_code          | string     | null: false                   |
| prefecture_id      | integer    | null: false                   |
| city               | string     | null: false                   |
| block              | string     | null: false                   |
| building           | string     |                               |
| phone_number       | string     | null: false                   |
| order              | references | null: false foreign_key: true |

### Association
belongs_to :order


## items テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| user               | references | null: false foreign_key: true |
| name_item          | string     | null: false                   |
| details_item       | text       | null: false                   |
| category_item_id   | integer    | null: false                   |
| status_item_id     | integer    | null: false                   |
| shipping_fee_id    | integer    | null: false                   |
| prefecture_id      | integer    | null: false                   |
| lead_time_id       | integer    | null: false                   |
| price              | integer    | null: false                   |

### Association
belongs_to :user
has_one :order


## orders テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| user               | references | null: false foreign_key: true |
| item               | references | null: false foreign_key: true |

### Association
has_one :ship_address
belongs_to :user
belongs_to :item