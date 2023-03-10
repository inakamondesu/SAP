# BW/4HANA環境構築してみた①  
SAP Cloud Appliance Libraryにて、BW/4HANAの環境を構築してみたので、ざっと手順をシェアしたいと思います。  
本記事では、下記手順の1について、記述しております。  

手順  
---
1. AWS
    1. アカウント作成
    2. ユーザ作成
    3. アクセスキー作成
2. SAP CAL
    1. アカウント作成
    2. BW/4HANA環境の構築
3. BW/4HANA
    1. 移送設定
    2. タスクの実行
    3. External viewの設定
4. HANA Studio
    1. HANA Studioのインストール
    2. システムの追加
    3. BW Modeling Toolのインストール
    4. BW Projectの作成
---

#### 1-1. AWS：アカウント作成
以下URLからアカウントを作成

[AWS - アカウント作成](https://aws.amazon.com/jp/free/?gclid=CjwKCAiAuaKfBhBtEiwAht6H7w2NRGDC202LQMDN-XDJo1KKdI34LeFDoV0lrvgm77aZZ3HIfdc9nhoCQ_oQAvD_BwE&trk=340f68be-e761-4b5a-b753-222dc31677b5&sc_channel=ps&s_kwcid=AL!4422!3!618145042463!p!!g!!amazon%20web%20services&ef_id=CjwKCAiAuaKfBhBtEiwAht6H7w2NRGDC202LQMDN-XDJo1KKdI34LeFDoV0lrvgm77aZZ3HIfdc9nhoCQ_oQAvD_BwE:G:s&s_kwcid=AL!4422!3!618145042463!p!!g!!amazon%20web%20services&all-free-tier.sort-by=item.additionalFields.SortRank&all-free-tier.sort-order=asc&awsf.Free%20Tier%20Types=*all&awsf.Free%20Tier%20Categories=*all)

下図中央左の「無料アカウントを作成」を押下
<img width="700" alt="画像1.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3148468/70868209-7af6-c962-db65-e917356a6955.png">

メールアドレスを入力し、入力したメールアドレスに届いた認証コードを入力
<img width="700" alt="画像2.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3148468/ee3cf296-e4af-dc5a-efb1-2470213def01.png">
<img width="700" alt="画像3.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3148468/2da2b462-39a6-bcb7-e635-fcd0e7c73da8.png">

サポートプランを選択
(私は無料の「ベーシックサポート」を選択しました)  
<img width="700" alt="画像4.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3148468/d009ab1d-2077-1305-7cb8-0bcdea906c90.png">

<img width="700" alt="画像5.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3148468/ce907bed-33be-bd77-ecb3-6b8fc5b73201.png">

これでAWSアカウントの作成は完了です。

#### 1-2. AWS：ユーザ作成
AWSにログインし、ユーザ名の右にある▼から「セキュリティ認証情報」を押下  
<img width="700" alt="画像6.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3148468/c01b17f7-1ba8-608c-1503-085d7667c10e.png">

アクセス管理配下の　ユーザー ＞ ユーザーを追加　から下図のようユーザを作成 
<img width="700" alt="画像7.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3148468/5a8e69ff-b69d-ce51-9f37-80fd5d92a037.png">

ユーザーの詳細情報を指定  
<img width="700" alt="画像8.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3148468/e0122ee6-2592-09d6-2f18-117f7813386d.png">

許可を設定  
(私の場合、ポリシー「AdministratorAccess」のみを選択しました)  
<img width="700" alt="画像9.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3148468/1ff9f116-2bc6-cf67-4ca4-99d1ce021db4.png">

ユーザの作成を押下  
<img width="700" alt="画像10.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3148468/43fb77a2-f4af-a0ee-e992-eb6b1bfd3b95.png">

これでユーザの作成は完了です。

#### 1-3. AWS：アクセスキー作成
先ほど作成したユーザにて、AWSにログイン  
ダッシュボード　＞　アクセスキー管理　より、アクセスキーを作成  
<img width="700" alt="画像11.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3148468/2969d503-cb54-e909-fc94-b60c7ac20789.png">

アクセスキーを取得し、csvファイルをダウンロード  
<img width="700" alt="画像12.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3148468/de051871-374b-fab0-aed6-b84f240dc735.png">

これでアクセスキーの作成は完了です。
