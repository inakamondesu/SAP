# Analytic Privilegesの作成① in SAP HANA  
本記事では、Analytic Privilegeの概要と作成手順を記載しております。

内容
---
1. Analytic Privilegeとは
2. Attibute Analytic Privilegeの作成
3. Dynamic Analytic Privilegeの作成
---

#### 1. Analytic Privilegeとは
一言でいうと、HANA Viewへのアクセス権限です。  
Analytic Privilegeでは、単純なViewのクエリを制限するだけでなく、行レベルのデータアクセスを制限することができます。  
例えば、全地域の売上情報を保持しているViewがあるとします。  
上記Viewに対して、Analytic Privilegeを作成し、ユーザは、自身が属する地域の売上情報のみ参照できるようにする　といったことができます。  

Analytic Privilegeでは、以下3つの方法で様々な設定が可能です。

|種別|内容|
|:-|:-|
|Attributes|Viewの項目・条件を指定し、容易に設定できる|
|SQL Editor|SQL文を記述し、フレキシブルに設定できる|
|Dynamic|Procedureを設定し、動的な条件を設定できる|

AttributesとDynamicについて、作成手順を後述します。

