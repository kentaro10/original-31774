# README

## Usersテーブル
| Column     | Type   | Options     | 
| ---------- | ------ | ----------- | 
| nickname   | string | null: false | 
| last_name  | string | null: false | 
| first_name | string | null: false | 
| profile    | text   |             | 
### Association
has_many :Posts
has_many :comments

## Postsテーブル

| Column             | Type       | Options           | 
| ------------------ | ---------- | ----------------- | 
| title              | string     | null: false       | 
| genre1_id          | integer    | null: false       | 
| genre2_id          | integer    | null: false       | 
| shop_name          | string     |                   | 
| explanation        | string     |                   | 
| self_assessment_id | integer    | null: false       | 
| user               | references | foreign_key: true | 

### Association
belongs_to :user
has_many :comments
## Commentsテーブル

| Column | Type       | Options           | 
| ------ | ---------- | ----------------- | 
| text   | text       | null: false       | 
| user   | references | foreign_key: true | 
| post   | references | foreign_key: true | 

### Association
belongs_to :user
belongs_to :post