# アプリケーション名
## BirthPlan(バースプラン)

# アプリケーション概要
## 自分だけのMyバースプラン(出産の計画書)が作成できるアプリ

# URL
 [BirthPlan] ()

# テスト用アカウント
## ログインemail
## ログインパスワード
## Basic認証 ID
## Basic認証 Pass

# 利用方法
## バースプランの例や助産師からの情報を参考に、マイページに自分だけのバースプランを作成する

# ペルソナ
## 氏名：田中花子（旧姓：山本）
## 女性：26歳
## 職業：元看護師(老人福祉施設で看護師として働いていた)、現専業主婦
## 趣味：ハンドメイド（編み物・アクセサリー）、料理とお菓子作り
## 初産婦。妊娠7ヶ月(27週)。赤ちゃんが男の子と最近わかった。
## 夫は今から子供とのキャッチボールが楽しみだと出産に対して前向き。
## 実家は県内。２姉妹の姉で山本家での出産は花子が初めて。両親は初孫を楽しみにしている。

# 目指した課題解決
## 安心かつ楽しく自分だけのMyバースプラン(出産の計画書)をアプリで簡単にまとめることができる。家族で一緒に出産に向き合うことができる。

# ユーザーストーリー(背景)
## 産科クリニックからバースプラン用紙(出産の計画書)を、夫や家族と相談して記入し、妊娠32週の検診時に助産師へ提出するように言われる。用紙内に簡単なバースプランの例は載っていたが、初めてのお産への期待と不安が大きくどう記入していいかわからなくなってしまった。確かな情報を参考にできて、自分にぴったりのバースプランを家族で相談しながら作成ができたら嬉しいのにと思った。そこで、大学時代の友人(助産師&エンジニア)へ相談を行った。

# 洗い出した要件
## ●解決したい課題
### ・バースプランに関する確かな情報を簡単に知りたい
## ●なぜその課題解決が必要なのか
### ・バースプランの情報を探すのに時間と手間がかかるため
### ・ネットの情報は誰が書いたものかわからず、信憑性にかけるため
## ●問題を解決する実装の内容
### ・バースプランの各情報(陣痛時、分娩時、お産後)を閲覧することができる機能

## ●解決したい課題
### ・自分のバースプランを夫や家族と一緒に考えて作成したい
## ●なぜその課題解決が必要なのか
### ・1人で出産のことを考えるのは不安なので、家族全員で赤ちゃんを迎える準備がしたいため
## ●問題を解決する実装の内容
### ・マイページに世界にたった1つのMyバースプランを作成できる機能
### ・夫や家族の意見も交換できるメッセージ機能

# 実装した機能についてのGIFと説明

# 実装予定の機能

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
| birth_date       | date   |                           |

### Association
- has_many :births
- has_many :messages

## birthsテーブル

|      Column      |    Type    |             Options            |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| plan_name        | string     | null: false                    |
| description      | text       | null: false                    |
| hope_id          | integer    | null: false                    |
| attend_id        | integer    | null: false                    |
| contraction      | text       |                                |
| childbirth       | text       |                                |
| postpartum       | text       |                                |
| memo             | text       |                                |

### Association
- belongs_to :user
- belongs_to_active_hash :hope
- belongs_to_active_hash :attend
- has_many :messages

## messagesテーブル

|     Column     |    Type    |            Options             |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| birth          | references | null: false, foreign_key: true |
| content        | text       | null: false                    |

### Association
- belongs_to :user
- belongs_to :birth

# ローカルでの動作方法
## アプリケーション開発に使用した環境