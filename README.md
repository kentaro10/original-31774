# README

## アプリケーション名
ひるめし  

## アプリケーション概要
食べたいと思えるようなお昼ご飯をいろんな角度から探すことができます。また、食べたお昼ご飯を自由に投稿することができるアプリです。  
 お昼ご飯をお店で食べるか、家で食べたいのか考えて、食べるかたちによってジャンル分けをしています。  
 Ruby on Railsで制作しました。  

 ## URL
 https://original-31774.herokuapp.com/

 ## テスト用アカウント
 ・メールアドレス： taro@taro  
  パスワード： 123456a  

  ## 機能
Ruby on Railsで制作したアプリです。  
 ・ユーザー管理機能：ユーザー登録することによって投稿機能、フォロー機能を使うことができます。  
 ・フォロー機能：気になったユーザーをフォローすることができます。  
 ・マイページ機能：自分が投稿した記事の確認とフォロー関係を確認することができます。  
 ・s3設定：投稿された画像はs３に保存されます。
  

 ## 利用方法
 1.トップページから,新着記事、ジャンルごとの新着記事を閲覧することができます。  
 2.ユーザー登録を行うことで記事の投稿ができます。  
 3.気になったユーザーをフォローすることができ、フォローしたユーザーのページへアクセスすることができます。  

 ## 目指した課題解決
  今日のお昼ご飯何にしようか悩んでいる人に対して、食べたいものを見つけることができる。  
  今日食べたお昼ご飯を紹介することができて、情報を発信することができる。

 ## 実装予定の機能
  現在も開発を継続しており、順次実装予定です。  
 ・音声による検索の実装  
 ・画像に情報を入れる機能の実装  
 ・AWSでのデプロイ  
 ・料理のジャンルを分けてトップページにジャンルごとのアイコンを載せる。

 ## ローカル環境へのインストール方法
```
 $ git clone https://github.com/kentaro10/original-31774.git
 $ cd full-gi-collection
 $ bundle install
 $ rails db:create
 $ rails db:migrate
 ```




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
