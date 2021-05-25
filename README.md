# ShelfTalker

## 概要
#### ShelfTalkerとは...  本アプリはCRUD処理を基盤とした映画レビューサイト  
<img width="80%" alt="ShelfTalker_gif" src="https://github.com/rwrw96/Shelf-talker/blob/readme/app/assets/images/ShelfTalker_gif.gif">  
TMDbのAPIを使用して映画、キャスト情報を取得。    
ユーザーは気に入ったレビューを保存することで作品をブックマークすることが可能。   
マイページにお気に入りの映画を陳列することができます。   
        
        
        
**まさにShelfTalker**(棚と商品の間に敷いて使用するPOPの意)


### サイトテーマ
#### UIを意識した映画レビューサイトを
後述しますが日本の映画サイトは情報が多く、一見してわかりづらいものが多いです。本サイトは広告もなく見やすく直感的に使用できるように仕上げました。  
#### シンプル != 質素  
とはいえ、シンプルすぎると機能が実装できないのではないかと思いましたが  
新規登録時の二段階認証やGit Actionsによる自動デプロイ等目に見えない機能を実装することを意識しました。


### テーマを選んだ理由
1. 自己表現の場が必要だと思った。ここ最近でSNSはTwitter、Instagram、そしてclubhouseと表現方法を変えながらも承認欲求を満たしていった。  
2. 映画は"**もう一つの人生**" 普段体験し得ないような出来事を味わうことのできるコンテンツであり私の大好きなもの一つであった。
  
1と2を組み合わせたアプリケーションが必要だと思いました。そして既存の映画レビューサイトは必要以上に情報が多く使いづらい。  
これに気づいた時自身で作ることができればと思い制作に挑みました。


### ターゲットユーザー
#### 年齢、性別問わず。  
映画が好きな者、他の人の好きな映画が知りたい者、自分の好きな映画を教えたい者


### 主な利用シーン
良い映画に出会った時。それを伝えたい時。自分用のメモとして。映画を見つけたい時。


## 設計書
- [テーブル定義書](https://docs.google.com/spreadsheets/d/1UsjkKhIVXtB9PnCAEK7Vd1-GZrmUWdXkW_lXzY0Bxuo/edit#gid=0)
- [アプリケーション詳細設計](https://docs.google.com/spreadsheets/d/14Rikx16Nuci44hd96XxTP6Z8oM6dCLXFhRET6CUoZDY/edit#gid=0)  
- [ER図](https://app.diagrams.net/#G1I006FXINbQOdTCJ8BpH3_jH6-LXL1cpQ)

## チャレンジ要素一覧
[実装した機能](https://docs.google.com/spreadsheets/d/1EvaT_Lskz77sVSPdANoSPh19_rkRdEzevJ_vdld5fxI/edit#gid=0)

### 機能概要
- 新規登録時、認証メールが送信され添付されているURLをクリックすると登録完了となります(それらの作業を飛ばしたゲストログイン機能もあります)  
- 任意の映画をクリックするとすぐにレビューを投稿できるようになっています  
- 映画だけでなくキャスト情報も取得しており出演作品で絞って検索することも可能です  
- 全てのレビューはヘッダーのREVIEWSから確認し、リンク先の詳細画面から保存することができます(保存した映画はマイページから確認できます)  
- ヘッダーのUSERSからユーザーをフォローでき相互フォローになると相手のレビューやブックマークが表示されるような仕組みになっています  
- 退会機能には論理削除を適用し、謝ってユーザーが削除されないようになっています  
- 管理人ユーザーを真偽値で判断しており管理人は任意のユーザー、レビュー等を削除することができます  



## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS
  - JavaScript
  - Ruby 2.6.3
  - SQL
- フレームワーク：Ruby on Rails 5.2.5
- JSライブラリ：jQuery
- IDE：Cloud9

## 使用素材
- https://developers.themoviedb.org/3/getting-started/introduction　
- TMDb API
