# BW/4HANA環境構築してみた④-b
SAP Cloud Appliance Libraryにて、BW/4HANAの環境を構築してみたので、ざっと手順をシェアしたいと思います。  
本記事では、下記手順4-ⅲ、4-ⅳについて、記述しております。

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

#### 4-ⅲ. HANA Studio：BW Modeling Toolのインストール
メニューバーのHelp > Install New Software を押下  
<img width="700" alt="画像17.png" src="https://user-images.githubusercontent.com/125335793/218676400-0434ba4a-8eec-4cbd-b640-78606b33e00d.png">

Work withに「`http://download.eclipse.org/releases/neon`」を入力し、Group items by categoryのチェックを外す  
以下にチェックを入れ、「Next」を押下  
>・Model Comparison (EMF Compare)   
・Mylyn Commons  
・Mylyn Task-Focused Interface

<img width="700" alt="画像18.png" src="https://user-images.githubusercontent.com/125335793/218676458-6fdb48f1-c528-4b87-9344-b76be4f50c8c.png">

「Next」を押下  
<img width="700" alt="画像19.png" src="https://user-images.githubusercontent.com/125335793/218676529-3eac4fa6-e97e-47e9-afd0-b264c1aee5bb.png">

「I accept the items of the license agreement」を選択し、「Finish」を押下  
<img width="700" alt="画像20.png" src="https://user-images.githubusercontent.com/125335793/218676586-16712f53-a768-4528-8702-7b72cb7bfd32.png">

しばしインストールを待つ  
<img width="700" alt="画像21.png" src="https://user-images.githubusercontent.com/125335793/218676649-cbc3eabc-b2d7-4e00-81a6-3540fd026b11.png">

インストールが完了したら、「Restart Now」を押下  
<img width="700" alt="画像22.png" src="https://user-images.githubusercontent.com/125335793/218676704-6f139080-e56b-445d-abc4-85dfa043a3c3.png">

以下URLにアクセスし、ADT(ABAP Development Tool)をダウンロード  
[Sofware download](https://support.sap.com/en/my-support/software-downloads.html)

メニューバーのHelp > Install New Software を押下  
<img width="700" alt="画像23.png" src="https://user-images.githubusercontent.com/125335793/218676769-381cab65-2e5b-4ad7-b9fa-14575507e955.png">

「Add」を押下し、以下を入力
|項目|値|
|:-|:-|
|Name|任意の値|
|Location|上記でダウンロードしたファイルを指定|

<img width="700" alt="画像24.png" src="https://user-images.githubusercontent.com/125335793/218676855-13290ccd-9808-4969-8947-bb644724de73.png">

以下にチェックを入れ、「Next」を押下

>・ABAP Core Development Tools  
・ABAP Enterprise Services and integration Development Tools

<img width="700" alt="画像25.png" src="https://user-images.githubusercontent.com/125335793/218676931-ba55316f-dd9e-4802-9310-d28dbf325715.png">

「Next」を押下  
<img width="700" alt="画像26.png" src="https://user-images.githubusercontent.com/125335793/218676999-f9001a32-d9dd-4d00-9d36-3162bac4ae69.png">

「I accept the items of the license agreement」を選択し、「Finish」を押下  
<img width="700" alt="画像28.png" src="https://user-images.githubusercontent.com/125335793/218677062-e0b78ff6-1f51-4417-9cea-31de63d7ab80.png">

しばしインストールを待つ  
<img width="700" alt="画像27.png" src="https://user-images.githubusercontent.com/125335793/218677178-f1439e49-b80d-4a79-b707-e53f09a323d4.png">

インストールが完了したら、「Restart Now」を押下  
<img width="700" alt="画像29.png" src="https://user-images.githubusercontent.com/125335793/218677229-6f9eee82-2ea2-4657-8d4c-95fd773c1900.png">

以下URLにアクセスし、BWMT(BW Modeling Tool)をダウンロード  
[Software download](https://support.sap.com/en/my-support/software-downloads.html)

ADTのインストールと同様の手順でBWMTをインストール

これでBW Modeling Toolのインストールが完了です


#### 4-ⅳ. HANA Studio：BW Projectの作成
メニューバーのWindow > Perspective > Open Perspective > Other を押下  
<img width="700" alt="画像30.png" src="https://user-images.githubusercontent.com/125335793/218677279-4ccb2414-5fbe-466f-bc87-48ad60dacbc2.png">

BW Modelingを選択し、「Open」を押下  
<img width="700" alt="画像32.png" src="https://user-images.githubusercontent.com/125335793/218677326-52f2bda8-d974-45bb-99ba-f56ec9114077.png">

「BW Project」を押下  
<img width="700" alt="画像33.png" src="https://user-images.githubusercontent.com/125335793/218677382-e5ef93bf-90e2-4629-a214-98a8e945bb00.png">

構築したBW/4HANAの環境を選択し、「Next」を押下  
<img width="700" alt="画像34.png" src="https://user-images.githubusercontent.com/125335793/218677444-31e4cde8-1072-4541-9687-3eb5887573a9.png">

「Next」を押下  
(System ID/Application Server/Instance Numberは、上記で選択したシステムの各値がデフォルトで入っている)
<img width="700" alt="画像35.png" src="https://user-images.githubusercontent.com/125335793/218677502-5eb40d28-00ce-48ce-802d-f1dd01c4014c.png">

Client/User/Passwordを入力し、「Finish」を押下  
<img width="700" alt="画像36.png" src="https://user-images.githubusercontent.com/125335793/218677555-da4cf701-5ea5-4bd5-8a17-ffd3af1a88c5.png">

Project Explorerタブに、システムが追加されたことを確認  
<img width="700" alt="画像37.png" src="https://user-images.githubusercontent.com/125335793/218677603-c3e37166-7bff-4622-a1ee-6552bdc11438.png">

これでBW Projectの作成は完了です
