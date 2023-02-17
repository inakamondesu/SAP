# Dynamic filter in calculation view
本記事では、Dynamic filterの概要及び作成手順を記載しております。

内容
---
1. Dynamic filterとは
2. Dynamic filterの作成手順
---

#### 1. Dynamic filterとは
その名の通り、動的なフィルタになります。  
HANA Viewをクエリした際に、フィルタの値が都度変わるような時に使用されます。  
例)「前年当年のデータのみ参照」や「直近3カ月のデータのみ参照」など  

上記例では、クエリ結果にフィルタをかけることもできますが、Dynamic filterを実装すると、必要なデータのみを計算できるので、パフォーマンスの観点から効果を発揮すると思います。  

後述する手順では、上記例であげた前年当年のみのデータを取得するDynamic filterを作成します。  

#### 2. Dynamic filterの作成手順
作成手順は、以下になります。  
>① 前年当年の8桁の値をOUTPUTするProcedureの作成  
② Calculation ViewのInput ParameterにProcedureを割当  
③ Filter Expressionにて、Input Parameterを用いたフィルタの設定  

では、実際にやっていきます。  

① 前年当年の8桁の値をOUTPUTするProcedureの作成  
[DYNAMIC_FILTER_PROCEDURE](Procedure.sql)  
<img width="700" alt="画像1.png" src="https://user-images.githubusercontent.com/125335793/219526917-eff3fa3c-22c8-493b-832a-8ec9b1cf4021.png">

ProcedureのOUTPUT結果を確認します。  
```SQL
CALL "Y_SCHEMA"."Training::DYNAMIC_FILTER_PROCEDURE"(?)
```  
前年当年の20222023がアウトプットされていることがわかります。  
<img width="700" alt="画像2.png" src="https://user-images.githubusercontent.com/125335793/219527524-850d3b30-2ee0-42cc-85df-c2d005d25e82.png">

② Calculation ViewのInput ParameterにProcedureを割当  
Input Parameterを作成し、Procedureを割り当てます。  
Parameter Type : Derived From Procedure/Scalar Function  
Procedure/Scalar Function : 手順①で作成したProcedure    
<img width="700" alt="画像4.png" src="https://user-images.githubusercontent.com/125335793/219529667-fb570b3c-7ee0-463a-9d4b-cf46c65b5ebc.png">  

③ Filter Expressionにて、Input Parameterを用いたフィルタの設定  
対象のCalculation Viewは、下図のよう4つのProjection(Year＝ノード名)をUnionし、Union後のProjectionにて、Dynamic filterを設定します。  
<img width="700" alt="画像3.png" src="https://user-images.githubusercontent.com/125335793/219529172-bbbd121b-52a9-4160-b5ce-9132a33aaa18.png">  

ProcedureのOUTPUTが前年当年の8桁なので、以下のようなフィルタを設定します。  
```SQL
"YAER" >= LEFTSTR('$$IP_YEAR$$',4) AND "YAER" <= RIGHTSTR('$$IP_YEAR$$',4)
```
<img width="700" alt="画像5.png" src="https://user-images.githubusercontent.com/125335793/219530833-38d4d92c-00a9-4f18-b8ce-199ff7411160.png">  

Calculation ViewをData Previewすると、2022年と2023年のデータのみアウトプットされている。  
<img width="700" alt="画像6.png" src="https://user-images.githubusercontent.com/125335793/219531088-5d057ab3-c9b1-4e73-8806-f8ba44b3e8c3.png">  
