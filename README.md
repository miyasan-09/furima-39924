# テーブル設計

## users テーブル

| Column             | Type   | Options                 |
| ------------------ | ------ | ----------------------- |
| email              | string | null: false unique: true|
| token_password     | string | null: false unique: true|
| nickname           | string | null: false unique: true|
| last_name          | string | null: false unique: true|
| first_name         | string | null: false unique: true|
| last_name_kana     | string | null: false unique: true|
| first_name_kana    | string | null: false unique: true|
| birthday           | string | null: false unique: true|

### Association
has_one :order
has_many :items


## ship_address テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| post_code          | string     | null: false unique: true      |
| prefecture_id      | text       | null: false                   |
| city               | text       | null: false                   |
| block              | text       | null: false                   |
| building           | text       | null: false                   |
| phone_number       | string     | null: false unique: true      |

### Association
belongs_to :users


## items テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| user_id            | references | null: false foreign_key: true |
| image_item         | text       | null: false                   |
| name_item          | text       | null: false                   |
| details_item       | text       | null: false                   |
| category_item      | text       | null: false                   |
| status_item        | text       | null: false                   |
| shipping_fee       | text       | null: false                   |
| ship_region        | text       | null: false                   |
| lead_time          | datetime   | null: false                   |
| price              | integer    | null: false                   |

### Association
has_many :users


## order テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| user_id            | references | null: false foreign_key: true |
| item_id            | references | null: false foreign_key: true |

### Association
belongs_to :users