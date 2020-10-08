# アプリケーション名
BirthPlan(バースプラン)

# アプリケーション概要
自分だけのMyバースプラン(出産の計画書)が作成できるアプリです。

# URL
 [BirthPlan] (https://birth-plan.herokuapp.com/)

# テスト用アカウント
- ログインemail:test1234@gmail.com
- ログインパスワード:test1234
- Basic認証 ID:admin
- Basic認証 Pass:smile83

# 利用方法
ユーザー登録をすると自分だけのMyバースプランを作成できます。Myバースプランにはコメント機能がついており、ご家族の方もユーザー登録をしていただくと、妊婦さんのバースプランの作成に協力することができます。ご家族全員で赤ちゃんを迎えるためのご準備にお役立てください。
バースプランの作成には、助産師が紹介するバースプランに関する情報やバースプラン例を参考にすることができます。世界に1つだけのMyバースプランで笑顔で赤ちゃんを迎えるためのお手伝いをさせていただきます。

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
- 自分のバースプランを家族と一緒に作成できることで出産への不安を軽減することが課題です。
- バースプラン作成時の情報収集の手間と不確かな情報に対する不安を解決するために、バースプランに関する確かな情報の提供も目標にしております。

## ●なぜその課題解決が必要なのか
今回の花子さんの例だけでなく、出産やバースプランに対して不安を抱えている妊婦さんは大勢います。しかし、臨床現場で助産師が1人1人のバースプランに向き合う時間は限られており、紙媒体でバースプランを書いて持参するように言われてしまうのが現状です。少しでも妊婦さんの出産に対する不安を軽減し、家族全員が幸せな気持ちで赤ちゃんを迎えるために、課題の解決を目指しています。

## ●問題を解決する実装の内容
- ユーザー登録をしてログインをするとアプリが利用できるようになり、世界にたった1つのMyバースプランを作成することができます。
- 作成したMyバースプランに対するコメント機能で家族と意見交換をしながら、Myバースプランを更新していけます。コメント機能により、家族全員でコミュニケーションを図りながら、出産に向き合うことができます。
- ログインしているユーザーが、助産師が紹介するバースプランの各情報(陣痛時、分娩時、お産後と育児)を閲覧できるようにし、Myバースプラン作成時の参考にできます。

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
1.このリポジトリを複製
$ git clone https://github.com/sali-k/birth-plan.git

2.インストールしたリポジトリに移動
$ cd birth-plan

3.gemをアプリケーションに適用
$ bundle install

4.DBの作成&反映
$ rails db:create
$ rails db:migrate

5.アプリケーションの起動
$ rails s
👉http://localhost:3000

## アプリケーション開発に使用した環境
- ruby '2.6.5'
- rails '~> 6.0.0'
- ysql2 '0.5.3'