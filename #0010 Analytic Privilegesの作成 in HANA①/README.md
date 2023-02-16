# Analytic Privilegesの作成① in HANA  
本記事では、Analytic Privilegeの概要と作成手順を記載しております。  
また、下記内容の1、2を後述しております。  

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

詳細は、以下を参照してみてください。  
[SAP Help Portal - Analytic Privileges](https://help.sap.com/docs/SAP_HANA_PLATFORM/b3ee5778bc2e4a089d3299b82ec762a7/db08ea0cbb571014a386f851122958b2.html)

Analytic Privilegeでは、以下3つの方法で様々な設定が可能です。

|種別|内容|
|:-|:-|
|Attributes|Viewの項目・条件を指定し、容易に設定できる|
|SQL Editor|SQL文を記述し、フレキシブルに設定できる|
|Dynamic|Procedureを設定し、動的な条件を設定できる|

AttributesとDynamicについて、作成手順を後述します。

#### 2. Attibute Analytic Privilegeの作成
任意のPackageを右クリック > New > Analytic Privilege  
<img width="700" alt="画像1.png" src="https://user-images.githubusercontent.com/125335793/219235364-1e610fb4-6234-4773-a60f-c8ca80586cbd.png">

Nameに任意の値を入力し、「Finish」を押下  
<img width="700" alt="画像2.png" src="https://user-images.githubusercontent.com/125335793/219235721-b77410f2-ee5d-4e77-ad3d-5097f29bef3f.png">

対象のHANA Viewを選択し、「Finish」を押下  
<img width="700" alt="画像3.png" src="https://user-images.githubusercontent.com/125335793/219236024-3e566b67-82cd-4bd2-9fe0-d07cb7b72d47.png">

表示されたタブ右上にて、Attributesを選択  
以下を設定する。  
|フィールド|設定内容|
|:-|:-|
|Privilege Validity|有効期限|
|Associated Attributes Restrictions|制限対象の項目を設定|
|Assign the restrictions for 項目名|制限値を設定|

今回は、項目「ORDERID」に対して、値が「500000001」以下という設定をしました。  
<img width="700" alt="画像4.png" src="https://user-images.githubusercontent.com/125335793/219236353-a9944118-7128-450f-b8d4-fa58ffeb81e2.png">

下図赤枠のValidationを実行し、Activate  
<img width="700" alt="画像5.png" src="https://user-images.githubusercontent.com/125335793/219236788-5a90193d-3ffe-4e49-a21a-bfdc28dde851.png">

Security > Users > 権限を付与するユーザを選択  
Analytic Privilegesタブを開き、＋ボタンから作成したAnalytic Privilegeを選択  
<img width="700" alt="画像6.png" src="https://user-images.githubusercontent.com/125335793/219237115-1ac9f256-7d84-483d-985c-2bf594fad768.png">

Activate  
<img width="700" alt="画像7.png" src="https://user-images.githubusercontent.com/125335793/219237414-ee20bd3b-abd1-4bbd-9800-bff1f30c9ee3.png">

権限を付与したユーザにて、対象のHANA ViewをData Preview  
ORDERIDが500000001以下の値のみアウトプットされている  
<img width="700" alt="画像8.png" src="https://user-images.githubusercontent.com/125335793/219237693-219cefec-a8be-4750-be1a-f781d28a3cea.png">

