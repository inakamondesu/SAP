# BW/4HANA環境構築してみた④-a
SAP Cloud Appliance Libraryにて、BW/4HANAの環境を構築してみたので、ざっと手順をシェアしたいと思います。  
本記事では、下記手順4-i、4-iiについて、記述しております。  

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

#### 4-i. HANA Studio：HANA Studioのインストール
以下にアクセスし、SAP CAR(.SARファイルの解凍ツール)及びHANA Studioをダウンロード
[Software Download](https://support.sap.com/en/my-support/software-downloads.html)


ダウンロードが完了したら、SAP CARを実行し、.SARファイルを解凍  
手順は以下を参照  
[SAP CAR 実行方法](https://help.sap.com/doc/saphelp_nw70ehp1/7.01.4/ja-JP/48/360d61bbdd31c3e10000000a42189d/content.htm?no_cache=true)  
<img width="700" alt="画像1.png" src="https://user-images.githubusercontent.com/125335793/218662217-053c5283-74f0-465c-ba7a-2d78b84a6d4c.png">

<img width="700" alt="画像2.png" src="https://user-images.githubusercontent.com/125335793/218662316-140a7010-dbd6-4847-b9fd-3d8dbb750b6c.png">

解凍完了後、「hdbsetup」を実行  
<img width="700" alt="画像4.png" src="https://user-images.githubusercontent.com/125335793/218662125-d857dc0e-8e04-414c-b763-0487163329fc.png">

Install new SAP HANA Studioに、任意のディレクトリを指定し、「Next」を押下  
<img width="700" alt="画像5.png" src="https://user-images.githubusercontent.com/125335793/218675001-d3551f67-9e86-4fa9-93f8-e9c7c463e9d4.png">

Select features to installにて、すべてのチェックボックスにチェックをつけ、「Next」を押下  
<img width="700" alt="画像6.png" src="https://user-images.githubusercontent.com/125335793/218675153-123c85ae-2555-4e4c-bc2a-acf58c55e11e.png">

「Install」を押下  
<img width="700" alt="画像8.png" src="https://user-images.githubusercontent.com/125335793/218675222-59c641bc-7010-44f3-b3f4-6eef9e5f984e.png">

しばしインストールの完了を待つ  
<img width="700" alt="画像9.png" src="https://user-images.githubusercontent.com/125335793/218675298-4bf3a1d7-2b81-4c09-a5e8-0364128b8b43.png">

これでHANA Studioのインストールは完了です

#### 4-ii. HANA Studio：システムの追加
HANA Studioを起動  
<img width="700" alt="画像10.png" src="https://user-images.githubusercontent.com/125335793/218675352-fcdb638e-9957-4d17-890c-6694c5e2f73e.png">

Workspaceに任意のディレクトリを指定し、「Launch」を押下  
<img width="700" alt="画像11.png" src="https://user-images.githubusercontent.com/125335793/218675422-04869369-d3ac-4fe5-948b-ee3caaf1be35.png">

下図赤枠のドロップダウンからAdd System...を選択  
<img width="700" alt="画像12.png" src="https://user-images.githubusercontent.com/125335793/218675464-479fce71-59ed-40e6-ac2b-bfbc36383875.png">

Host Name/Instance Numberを入力  
(上記情報は、2-2でダウンロードしたGetting started guideで確認)  
<img width="700" alt="画像13.png" src="https://user-images.githubusercontent.com/125335793/218675530-c106c1d7-3249-4743-a00c-8abffbd7f5f6.png">

以下を入力し、「Finish」を押下  
|項目|値|
|:-|:-|
|User Name|SYSTEM|
|Password|2-2で登録したマスタパスワード|

<img width="700" alt="画像14.png" src="https://user-images.githubusercontent.com/125335793/218675581-0b471fc8-53a0-46b3-b9c7-a6d4d4630e72.png">

システムが追加されたことを確認  
同様に、テナントDBも追加しておく  
<img width="700" alt="画像15.png" src="https://user-images.githubusercontent.com/125335793/218675637-fdb856c0-c449-4d67-9d84-87fc3445c7e8.png">

<img width="700" alt="画像16.png" src="https://user-images.githubusercontent.com/125335793/218675697-e0486c6a-c998-4a8a-bfca-f9085b9044b6.png">

これでシステムの追加は完了です
