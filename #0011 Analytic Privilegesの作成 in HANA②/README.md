# Analytic Privilegesの作成 in SAP HANA②
本記事では、Analytic Privilegeの概要と作成手順を記載しております。  
また、下記内容の3を後述しております。

内容
---
1. Analytic Privilegeとは
2. Attibute Analytic Privilegeの作成
3. Dynamic Analytic Privilegeの作成
---

#### 3. Dynamic Analytic Privilegeの作成
手順としては、Procedure作成 → Analytic PrivilegeにProcedureを割当　になります。  
ではまず、Procedureを作成します。  
Repositoryタブにて、任意のPackageを右クリック > New > Other  
<img width="700" alt="画像9.png" src="https://user-images.githubusercontent.com/125335793/219255461-dcf8ff25-1e8b-4139-9471-48e87eacbf04.png">

Stored Procedureを選択し、「Next」を押下  
<img width="700" alt="画像10.png" src="https://user-images.githubusercontent.com/125335793/219255616-87cbc9ea-1157-4c98-b69b-2d96a80b8ff2.png">

File Name/File Format/Target Schemaを設定し、「Finish」を押下  
<img width="700" alt="画像11.png" src="https://user-images.githubusercontent.com/125335793/219255734-5482c56e-f88e-4388-a3da-c5b1acbd56b7.png">

作成するProcedureの内容は以下になります。  
>1. テーブル「USRAUTH」から実行ユーザのSALESORGを抽出  
>2. 変数 V_FILTER に、1で抽出した値を格納
>3. ProcedureのOUTPUT = 'SALESORG = V_FILTER'

SQL文を記述し、Activate  
<img width="700" alt="画像12.png" src="https://user-images.githubusercontent.com/125335793/219256701-d795e1f2-0971-4305-aa08-79358d7bc5d0.png">

Attributesと同様の手順でAnalytic Privilegeを作成  
表示されたタブ右上にて、Dynamicを選択し、作成したProcedureを割り当てる
<img width="700" alt="画像13.png" src="https://user-images.githubusercontent.com/125335793/219262990-81735349-b286-4b93-b472-25fd86a28e1a.png">

Validate > Acticate  
<img width="700" alt="画像14.png" src="https://user-images.githubusercontent.com/125335793/219263106-e6234d06-60f0-4a95-bacd-8b6dd297fc73.png">

対象のユーザに作成したAnalytic Privilegeを付与  
<img width="700" alt="画像16.png" src="https://user-images.githubusercontent.com/125335793/219263411-03feea2a-f671-4125-a76f-ec0677b418dc.png">

権限を付与したユーザにて、対象のHANA ViewをData Preview  
SALESORG ＝ EMEAの値のみアウトプットされている  
<img width="700" alt="画像17.png" src="https://user-images.githubusercontent.com/125335793/219263949-cb27aba5-b1ea-4cc0-8533-2ae432033dc3.png">

-補足-  
上記HANA Viewの実行ユーザは「SAPHANADB」になります。  
また、テーブル「USRAUTH」のデータは下図の通りであり、Procedureのアウトプットは、'SALESORG = EMEA'になります。  
<img width="700" alt="画像18.png" src="https://user-images.githubusercontent.com/125335793/219264406-4466cf71-3acb-43f7-9773-503f656f9feb.png">
