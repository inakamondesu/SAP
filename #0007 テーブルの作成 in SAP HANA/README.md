# テーブルの作成 in SAP HANA
本記事では、カラムテーブルの作成手順を記載しております。

内容
---
1. SQL文での作成
2. ファイルインポートでの作成
---

#### 1. SQL文での作成
基本的なフォーマットは以下になります。  
テーブルの作成：  
 `CREATE <テーブルタイプ> <スキーマ名.テーブル名> (<項目名 データ型>, <項目名 データ型>…);`  
 
データの追加：  
 `INSERT INTO <スキーマ名.テーブル名> VALUES ('Value1', 'Value2',…);`  
 
より詳しい情報は以下を参考  
[SAP HANA SQL Reference Guide](https://help.sap.com/docs/HANA_SERVICE_CF/7c78579ce9b14a669c1f3295b0d8ca16/20d58a5f75191014b2fe92141b7df228.html)

今回は、2項目保持するカラムテーブルを作成し、1データ追加の例になります。  
 `CREATE COLUMN TABLE Y_SCHEMA.USRAUTH (USERID CHAR(10) PRIMARY KEY, SALESORG NVARCHAR(4) NOT NULL);`  
 `INSERT INTO Y_SCHEMA.USRAUTH VALUES ('SAPHANADB', 'EMEA');`  
<img width="700" alt="画像1.png" src="https://user-images.githubusercontent.com/125335793/218929421-d8398bf8-f734-4daa-aeca-52f11e722c10.png">

作成したテーブルをData Previewし、結果を確認  
<img width="700" alt="画像2.png" src="https://user-images.githubusercontent.com/125335793/218929568-d632d2f8-eea2-4382-b4b8-fdbcc3bf0626.png">  

#### 2. ファイルインポートでの作成
メニューバーのFile > Import を押下  
<img width="700" alt="画像41.png" src="https://user-images.githubusercontent.com/125335793/218930404-96481c1a-c044-435b-8ebe-fc40f191b31c.png">  

「Data from lacal file」を押下  
<img width="700" alt="画像44.png" src="https://user-images.githubusercontent.com/125335793/218931058-b8c4a1b9-1fbe-411b-8e5f-62bf4fe2ccaf.png">  

Import先のシステムを選択し、「Next」を押下  
<img width="700" alt="画像45.png" src="https://user-images.githubusercontent.com/125335793/218931146-ba18beea-1c3b-4093-b5db-06908ca2c91b.png">  

アップロードファイルやファイルの仕様を設定し、作成するテーブルのスキーマ及びテーブル名を入力  
「Next」を押下  
<img width="700" alt="画像46.png" src="https://user-images.githubusercontent.com/125335793/218931404-d5a204f1-d949-4413-8f45-5a877c19a7fa.png">  

作成するテーブルの項目名やKey項目を設定し、「Next」を押下  
<img width="700" alt="画像47.png" src="https://user-images.githubusercontent.com/125335793/218931558-b02aac97-bc4e-417d-aa64-dc2ec9ed60b5.png">  

作成されるテーブルを確認し、「Finish」を押下  
<img width="700" alt="画像48.png" src="https://user-images.githubusercontent.com/125335793/218931691-357efbc3-f7d1-49ce-a02f-077b8d78d54e.png">  

テーブルが作成されたことを確認  
<img width="700" alt="画像49.png" src="https://user-images.githubusercontent.com/125335793/218931825-02a97d90-bdf9-4d4c-8328-470eadf13867.png">  

  
SQL文を理解することは大事ですが、Excelでファイル作成して、Importするのが楽そうですね
