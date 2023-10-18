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
has_many :order
has_many :items


## ship_address テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| post_code          | string     | null: false unique: true      |
| prefecture_id      | text       | null: false                   |
| city               | string     | null: false                   |
| block              | string     | null: false                   |
| building           | string     | null: false                   |
| phone_number       | string     | null: false unique: true      |

### Association
belongs_to :users


## items テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| user               | references | null: false foreign_key: true |
| name_item          | string     | null: false                   |
| details_item       | text       | null: false                   |
| category_items_id  | text       | null: false                   |
| status_items_id    | text       | null: false                   |
| shipping_fees_id   | text       | null: false                   |
| ship_regions_id    | text       | null: false                   |
| lead_times_id      | datetime   | null: false                   |
| price              | integer    | null: false                   |

### Association
belongs_to :users


## order テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| user               | references | null: false foreign_key: true |
| item               | references | null: false foreign_key: true |

### Association
belongs_to :ship_address