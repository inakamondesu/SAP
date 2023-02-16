# BW/4HANA環境構築してみた③
SAP Cloud Appliance Libraryにて、BW/4HANAの環境を構築してみたので、ざっと手順をシェアしたいと思います。
本記事では、下記手順3について、記述しております。
また、構築した環境で検証するうえで、必要な設定等のみピックアップしております。  

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

#### 3-1. BW/4HANA：移送設定
SAP GUIを立ち上げ、対象のシステムのClient 000にログイン
Trcd:STMS > Extras > Delete TMS configuration を押下

<img width="700" alt="画像50.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3148468/48667e2d-8a42-bd4d-eb73-d63c8c2da8ac.png">

ポップアップが表示されるので、「Yes」を押下

<img width="700" alt="画像51.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3148468/f6683481-9c26-20b4-0e46-05523cb2faa8.png">

Descriptionに任意の値を入力  
(System/Nameは、デフォルト値)  
<img width="700" alt="画像53.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3148468/625cd0c7-893a-9aad-8dff-d26d2acdfee6.png">

パスワードを設定  
<img width="700" alt="画像54.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3148468/4d97ed24-ac58-38ec-1b4b-48c4d5f10969.png">

Overview > System を押下  
<img width="700" alt="画像55.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3148468/f8c5eb21-494d-936d-5d53-09297aea64b1.png">

Create > Virtual System を押下  
<img width="700" alt="画像56.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3148468/12fe9f9a-1570-5c8e-fce4-fbcd035d317a.png">

Descriptionに任意の値を入力  
(Systemは、デフォルト値)  
<img width="700" alt="画像58.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3148468/5cf1d53d-9a4b-fc0f-9bee-5f596cbc7a7a.png">

Systemのエントリ数が2であることを確認  
<img width="700" alt="画像60.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3148468/bfe0a5bc-d01f-37f8-9947-68eab394e895.png">

これで移送設定は完了です。

#### 3-2. BW/4HANA：タスクの実行
SAP GUIを立ち上げ、対象のシステムにログイン(自身がセットアップしたいクライアント)  
Trcd:STC01 > Task Listに「SAP_FIORI_LAUNCHPAD_INIT_SETUP」を入力し、実行  
<img width="700" alt="画像61.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3148468/43a107de-61fd-e6e4-bed2-cc65b6c7fca3.png">

左の項目にチェックをつけ、実行  
<img width="700" alt="画像62.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3148468/e06c5c45-c9df-c953-274d-957ceea49af7.png">

実行したタスクがオールグリーンになったことを確認  
<img width="700" alt="画像63.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3148468/90ceff37-bacc-b6a3-a2b8-eba4b230a4cc.png">

上記同様、Task List「SAP_BW4_SETUP_SIMPLE」を実行  
<img width="700" alt="画像64.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3148468/851aea3c-e6b8-8f90-7499-9438f22e6aa2.png">

必要なタスクを処理し、左の項目にチェックをつけ、実行  
筆者の場合、以下3つのタスクを実行  

>・Checks and assigns privileges for Search: Enter SYSTEM User and Password of tenant DB  
・Create Background User in BW – BWREMOTE  
・Creates virtual Time Hierarchies for BW4 – recommendation: switch on

<img width="700" alt="画像65.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3148468/f90b1302-a709-bc51-4ca0-2f9093e43c42.png">

これでタスクの実行は完了です。

#### 3-3. BW/4HANA：External viewの設定
(筆者が構築した環境では、既に設定済みであったため、確認のみ実施)  
SAP GUIを立ち上げ、対象のシステムにログイン(自身がセットアップしたいクライアント)  
Trcd:SPRO > SAP Reference IMG  
<img width="700" alt="画像66.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3148468/89b02ca9-ecd0-d89b-2579-aa77c458ca5d.png">

SAP BW/4HANA Customizing Implementation Guide > SAP BW/4HANA > Data Modeling  
\> Settings for Generating External SAP HANA View for BW Objects を押下  
<img width="700" alt="画像67.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3148468/2294c8dc-58e6-bf63-34e9-ee200c95e099.png">

既にSAP HANA Packageが設定されていることを確認  
<img width="700" alt="画像68.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3148468/4bb12dcd-65a0-fe7d-86db-98918ead8840.png">

これでExternal viewの設定は完了です。
