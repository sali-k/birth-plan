# アプリケーション名
BirthPlan(バースプラン)

# アプリケーション概要
自分だけのMyバースプラン(出産の計画書)が作成できるアプリです。

# URL
 [BirthPlan] (https://birth-plan.herokuapp.com/)

# テスト用アカウント
ログインemail:test@gmail.com
ログインパスワード:test1234
Basic認証 ID:admin
Basic認証 Pass:smile83

# 利用方法
ユーザー登録をすると自分だけのMyバースプランを作成できます。Myバースプランにはコメント機能がついており、ご家族の方もユーザー登録をしていただくと、妊婦さんのバースプランの作成に協力することができます。ご家族全員で赤ちゃんを迎えるためのご準備にお役立てください。
バースプランの作成には、助産師が紹介するバースプランに関する情報やバースプラン例を参考にすることができます。世界に1つだけのMyバースプランで笑顔で赤ちゃんを迎えるためのお手伝いをさせてください。

# ペルソナ
氏名：田中花子（旧姓：山本）
女性：26歳
職業：元看護師(老人福祉施設で看護師として働いていた)、現専業主婦
趣味：ハンドメイド（編み物・アクセサリー）、料理とお菓子作り
初産婦。妊娠7ヶ月(27週)。赤ちゃんが男の子と最近わかりました。
夫は今から子供とのキャッチボールが楽しみだと出産に対して前向きな姿勢です。
実家は県内で、花子さんは２姉妹の姉です。山本家での出産は花子さんが初めてで、両親は初孫を楽しみにしています。

# 目指した課題解決
自分だけのMyバースプラン(出産の計画書)をアプリで簡単にまとめることができることと、家族で一緒に出産に向き合うことができることを課題として解決を目指します。

# ユーザーストーリー(背景)
花子さんは、産科クリニックからバースプラン用紙(出産の計画書)を、夫や家族と相談して記入し、妊娠32週の検診時に助産師へ提出するように言われました。用紙内に簡単なバースプランの例は載っていましたが、初めてのお産への期待と不安が大きくどう記入していいかわか了解しましたません。そして、確かな情報を参考にできて、自分にぴったりのバースプランを家族で相談しながら作成ができたら嬉しいのにと思いました。そこで、大学時代の友人(助産師&エンジニア)へ相談し、バースプランアプリが生まれました。

# 洗い出した要件
## ●解決したい課題
自分のバースプランを夫や家族と一緒に考えて作成したい
## ●なぜその課題解決が必要なのか
- 1人で出産のことを考えるのは不安なので、家族全員で赤ちゃんを迎える準備がしたいため
## ●問題を解決する実装の内容
- マイページに世界にたった1つのMyバースプランを作成できる機能
- 夫や家族の意見も交換できるメッセージ機能
## ●解決したい課題
- バースプランに関する確かな情報を簡単に知りたい
●なぜその課題解決が必要なのか
-バースプランの情報を探すのに時間と手間がかかるため
-ネットの情報は誰が書いたものかわからず、信憑性にかけるため
## ●問題を解決する実装の内容
- バースプランの各情報(陣痛時、分娩時、お産後)を閲覧することができる機能

# 実装予定の機能
- ユーザー登録とユーザー情報の管理機能
- Myバースプランの作成と閲覧、編集と削除機能
- Myバースプランに対する他ユーザー（家族）からのコメントの追加と削除機能
- 助産師が紹介するバースプラン情報の閲覧

# 実装した機能についてのGIFと説明
現在、作成中です。

# ER図
  [ER図](https://app.lucidchart.com/invitations/accept/d1635fc0-21f7-4739-a530-2f08f5ae1e9f)

# DB設計
## users テーブル

|      Column      |  Type  |          Options          |
| ---------------- | ------ | ------------------------- |
| name             | string | null: false               |
| email            | string | null: false, default: "", |
|                  |        | unique: true              |
| introduction     | text   |                           |
| relationship     | string |                           |

### Association
- has_many :births
- has_many :comments

## birthsテーブル

|      Column      |    Type    |             Options            |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| plan_name        | string     | null: false                    |
| thought          | text       | null: false                    |
| hope_id          | integer    | null: false                    |
| attend_id        | integer    | null: false                    |
| contraction      | text       |                                |
| childbirth       | text       |                                |
| breastfeeding_id | integer    | null: false                    |
| postpartum       | text       |                                |
| memo             | text       |                                |

### Association
- belongs_to :user
- belongs_to_active_hash :hope
- belongs_to_active_hash :attend
- belongs_to_active_hash :Breastfeeding
- has_many :comments

## commentsテーブル

|     Column     |    Type    |            Options             |
| -------------- | ---------- | ------------------------------ |
| user_id        | integer    | null: false, foreign_key: true |
| birth_id       | integer    | null: false, foreign_key: true |
| content        | text       | null: false                    |

### Association
- belongs_to :user
- belongs_to :birth

# ローカルでの動作方法

## アプリケーション開発に使用した環境