# BW/4HANA環境構築してみた②
SAP Cloud Appliance Libraryにて、BW/4HANAの環境を構築してみたので、ざっと手順をシェアしたいと思います。
本記事では、下記手順の2について、記述しております。

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

#### 2-1. SAP CAL：アカウント作成
下記URLを参考に、SAP P-Userを作成

[Information About Public User ID](https://blogs.sap.com/2022/05/03/information-about-public-user-id/)

#### 2-2. SAP CAL：BW/4HANA環境の構築
下記URLにアクセスし、上記で作成したユーザでログオン

[https://cal.sap.com/](https://cal.sap.com/)

<img width="700" alt="画像13.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3148468/7df06861-9aef-cae5-6f5b-1b6dcc8292b4.png">

画面下部の「I Accept」を押下  
<img width="700" alt="画像14.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3148468/c450c7ab-5ee6-8979-b6f8-cfcc38f552df.png">

左のメニューバーの「Appliance Tamplates」から検索ボックスにて「BW/4HANA」を入力  
検索結果より、構築したいテンプレートを選択(※)  
(私はType：Devを選択しました)  
<img width="700" alt="画像15.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3148468/2d0e274c-fb2f-b5bd-24e9-225f9c9bf86b.png">

※Typeについて
>・TRIAL is an appliance that can be tested for free for 30 days. Once the trial has been consumed, you can continue using the instance paying a SAP CAL subscription. This option is only possible if you have an SAP License for the product.
・DEV is an appliance that can be used for development purposes only. These appliances don’t have an expiration date in SAP CAL, but you still need a Hyperscaler to use the service.
・EDU is an appliance to be used only for educational purposes. It cannot be extended after the trial period. This is mainly used in opensap courses. You would need to read the terms and conditions for the appliance you would like to activate but usually the trial period is 90 days.

[引用元](https://gayoway.com/how-to-save-money-when-using-sap-cal/)

「Create Appliance」を押下  
「Get Started Guide」も忘れずにダウンロード  
<img width="700" alt="画像16.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3148468/6e2e8fe4-8054-bd7f-23ec-5b407380225c.png">

以下を入力し、「Test Connection」を押下 
|項目|値|備考|
|:-|:-|:-|
|Cloud Provider|Amazon Web Services|構築する環境を選択|
|Access Key|1-3で取得した値|1-3でダウンロードしたcsvファイルで確認|
|Secret Access Key|1-3で取得した値|1-3でダウンロードしたcsvファイルで確認|

<img width="700" alt="画像17.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3148468/484a92a1-0f34-af2f-d044-091413753442.png">

正常にテストが完了すると、下図のようAppliance Detailsが表示される  
必要な情報を入力・選択し、「Create」を押下  
<img width="700" alt="画像18.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3148468/48140071-45ab-04c3-02c2-acf8d5a52cd7.png">

下図のようなポップアップが表示されるため、「Store」を押下  
また、パスワードを入力し、「Download」を押下  
<img width="700" alt="画像19.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3148468/a5b9d5af-2d21-9a7d-ce54-c489511d7fac.png">

Applianceの初期設定が完了するまで待つ  
<img width="700" alt="画像20.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3148468/d83869bf-2329-6d38-885d-40cbbfb66feb.png">

完了したら下図のようStatusが「Activive」になる  
「Connect」を押下  
<img width="700" alt="画像21.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3148468/ca0f70ac-59cf-0cd4-ae9b-c8dc125d3fdb.png">

下図のようなポップアップが表示される  
|Service|Target|備考|
|:-|:-|:-|
|SAP GUI|SID:A4H, Instance number:00, Client:100|ローカルPC上にて、SAP GUIが立ち上がる|
|RDP|Virtual Machine:Windows Frontend|リモートデスクトップが立ち上がる|

<img width="700" alt="画像22.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3148468/1fd8a860-f188-c5bf-eb23-661ef60a2fa8.png">

RDPの「Connect」を押下し、リモートデスクトップを立ち上げる  
<img width="700" alt="画像23.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3148468/b4ab88ca-aeb9-f2c9-ebff-d683380b5ba7.png">

パスワードにAppliance Detailsで登録したパスワードを入力する  
<img width="700" alt="画像24.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3148468/46391b25-20c9-a87b-b8b0-a814889ec703.png">

「はい」を押下  
<img width="700" alt="画像25.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3148468/eb20c03e-b23f-c63a-6978-3de4f8ae58b3.png">

リモートデスクトップが立ち上がる  
<img width="700" alt="画像26.png" src="https://user-images.githubusercontent.com/125335793/218659800-8509d921-623b-4674-aa5a-493c59ca7075.png">

-補足-
ダウンロードした「Get Started Guide」に、各環境の接続情報や初期登録されているGUIやHANAのユーザ情報の記載あり
