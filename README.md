# アプリケーション名
スノリゾルック (Look for Snowresorts)

# アプリケーション概要
スキー場に関するリアルタイムな情報をユーザーは入手できる。
スキー場情報の投稿やコメントをユーザーが行い、最新のゲレンデコンディションなどを把握することができる。
ゲレンデ情報に関するSNS。

# 実装機能
・会員登録、ログイン、ログアウト機能
・マイページにて自身の投稿一覧表示機能
・プロフィール編集機能
・投稿機能（編集、削除機能もあり）
・コメント機能
・投稿されたゲレンデの検索機能

# 本番環境、テスト用アカウント
・本番環境：https://snowresort-app.herokuapp.com/
・メールアドレス：test@test.com
・パスワード：test08

#　使用技術
Ruby / Ruby on Rails / HTML / CSS / MySQL / GitHub / Heroku / Visual Studio Code 

# 目指した課題解決
リアルタイムのゲレンデのコンディションや混雑状況などを把握できるまとまったサイトがなく、
LINEのオープンチャットなどで直近の情報を入手する方法が今は主流となっている。
しかし、それでは返答がなかったり、情報入手に時間がかかってしまう。
そこで実際にそのゲレンデに行っている人たちに情報を共有してもらえるアプリを作った。
ゲレンデに行っている人がそこの状況を投稿することで、別のユーザーは自ら検索をかけることで情報を素早く入手できる。
行きたいスキー場の直近のゲレンデコンディションを1つのアプリケーションで素早く把握できる。

# 今後実装したい内容
・互いにフォローできる機能
・相互フォロワーのメッセージ機能
・スキー場をお気に入り登録できる機能

# DB設計
## usersテーブル
| Column             | Type   | Options     |
| -------------------| ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| lastname           | string | null: false |
| firstname          | string | null: false |
| furigana_last      | string | null: false |
| furigana_first     | string | null: false |
| birthday           | date   | null: false |
### Association
- has_many :snowresorts
- has_many :comments

## snowresortsテーブル
| Column             | Type       | Options                       |
| -------------------| ---------- | ----------------------------- |
| resort_name        | string     | null: false                   |
| introduction       | text       | null: false                   |
| details            | text       | null: false                   |
| user               | references | null: false, foreign_key:true |
### Association
- belongs_to :user
- has_many :comments

## commentsテーブル
| Column             | Type       | Options                       |
| -------------------| ---------- | ----------------------------- |
| user               | references | null: false, foreign_key:true |
| snowresort         | references | null: false, foreign_key:true |
| comment            | text       | null: false                   |
### Association
- belongs_to :user
- belongs_to :snowresort