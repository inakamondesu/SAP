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



