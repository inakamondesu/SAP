# Privileges in HANA
本記事では、SAP HANAの権限について、後述します。

内容
---
1. 各権限の概要
2. 権限付与・削除の方法
---

#### 1. 各権限の概要
かなりざっくりではありますが、表に取りまとめてみました。  
|権限タイプ|適用対象&nbsp;&nbsp;&nbsp;|ターゲットユーザ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|概要|
|:-|:-|:-|:-|
|System privilege|System, database|管理者、開発者|System privilegeは、一般的なシステム操作を制御。主に、スキーマの作成、ユーザーとロールの作成と変更、監視とトレースなどの管理目的で使用される。また、リポジトリの基本的な操作を許可するためにも使用される。
|Object privilege|Database objects(schemas, tables, views etc...)|エンドユーザ、テクニカルユーザ|Object privilegeは、テーブルやビューなどのデータベースオブジェクトへのアクセスや変更を許可するために使用される。オブジェクトの種類に応じて、さまざまな操作(SELECT、CREATE ANY、ALTER、DROPなど)を制御。Schema privilegeは、スキーマおよびスキーマに含まれるオブジェクトへのアクセスおよび変更を許可するために使用されるObject privilegeである。
|Analytic privilege|HANA views|エンドユーザ|Analytic privilegeは、SAP HANA Information Models(Attribute/Analytic/Calculation View)おいて、特定の値または値の組み合わせに応じてデータへの読み取りアクセスを許可するために使用される。Viewのクエリ処理時に権限チェックがはしる。
|Package privilege|Packages in the classic repository of the SAP HANA database|開発者|Package privilegeは、SAP HANA Databaseのclassic repositoryにあるパッケージへのアクセスや開発を許可するために使用される。
|Application privilege|SAP HANA XS classic applications|エンドユーザ、テクニカルユーザ|Application privilegeは、SAP HANA XSアプリケーションへのアクセス(アプリケーションの起動や特定の機能および画面の表示など)に必要な権限を設定するために使用される。

より詳細な情報は、以下を参照ください。  
[SAP Help Portal - Privileges](https://help.sap.com/docs/SAP_HANA_PLATFORM/b3ee5778bc2e4a089d3299b82ec762a7/fb0f9b103d6940f28f3479b533c351e9.html)  

#### 2. 権限付与・削除の方法
各権限付与のSQLは以下になります。  
```SQL
GRANT <system_privilege>[{, <system_privilege>}...] TO <grantee> [ WITH ADMIN OPTION ]
GRANT <object_privilege>[{, <object_privilege>}...] ON <object_name> TO <grantee> [ WITH GRANT OPTION ]
GRANT <schema_privilege>[{, <schema_privilege>}...] ON SCHEMA <schema_name> TO <grantee> [ WITH GRANT OPTION ]
CALL GRANT_ACTIVATED_ANALYTICAL_PRIVILEGE ('<analytic_privilege>','<user or role>')
```

各権限削除のSQLは以下になります。  
```SQL
REVOKE <system_privilege>,... FROM <grantee>
REVOKE <schema_privilege>,... ON SCHEMA <schema_name> FROM <grantee> 
REVOKE <object_privilege>,... ON <object_name> FROM <grantee> 
CALL REVOKE_ACTIVATED_ANALYTICAL_PRIVILEGE ('<analytic_privilege>','<user or role>')
```

参考：  
[SAP Help Portal - GRANT](https://help.sap.com/docs/SAP_HANA_PLATFORM/4fe29514fd584807ac9f2a04f6754767/20f674e1751910148a8b990d33efbdc5.html?locale=en-US&version=2.0.03)  
[SAP Help Portal - REVOKE](https://help.sap.com/docs/SAP_HANA_PLATFORM/4fe29514fd584807ac9f2a04f6754767/20fc91cb75191014ac15eb4d6f2d7dde.html?locale=en-US&version=2.0.03)  
[SAP Help Portal - Analytic Privilege](https://help.sap.com/docs/SAP_HANA_PLATFORM/b3ee5778bc2e4a089d3299b82ec762a7/2a942546f16846d597177b3bfbd1df04.html?version=2.0.03&locale=en-US)  
