# Dynamic filter パフォーマンス検証
本記事では、Dynamic filterのパフォーマンスについて記載しております。

内容  
---
1. Calculation Viewのフィルタ設定  
①Procedureを使用したDynamic filter  
②CE Functionにべた書きしたfilter  
③SQL Codeでべた書きしたfilter
2. Calculation Viewのクエリ結果の比較  
3. まとめ
---

#### 1. Calculation Viewのフィルタ設定  
項目「YEAR」にて、前年と当年のデータのみを抽出するようなフィルタを3つのアプローチでそれぞれ以下のよう設定しました。  
①Procedureを使用したDynamic filter(#0012で作成) 
```SQL
"YEAR" = LEFTSTR('$$IP_YEAR$$',4) OR "YEAR" = RIGHTSTR('$$IP_YEAR$$',4)
```  

②CE Functionにべた書きしたfilter  
```SQL
"YEAR" = LEFTSTR(ADDMONTHS(DATE(NOW()),-12),4) OR "YEAR" = LEFTSTR(DATE(NOW()),4)
```  

③SQL Codeでべた書きしたfilter  
```SQL
"YEAR" = LEFT(TO_CHAR(CURRENT_DATE),4) OR "YEAR" = LEFT(TO_CHAR(ADD_YEARS(CURRENT_DATE,-1)),4)
```  

#### 2. Calculation Viewのクエリ結果の比較
Calculation Viewのクエリ結果の比較は、以下になりました。  
|フィルタ|コンパイル時間 (ms)|実行時間 (s)|メモリ使用量 (GB)|  
|:-|:-|:-|:-|    
|Dyanamic filter|1.55|12.2|1.3|  
|CE Function|52.93|2.1|0.64|  
|SQL Code|0.18|13.6|1.3|  

①Procedureを使用したDynamic filter  
<img width="700" alt="画像10.png" src="https://user-images.githubusercontent.com/125335793/219946410-ceb3b830-1fee-4bba-9f09-366561004a77.png">

②CE Functionにべた書きしたfilter  
<img width="700" alt="画像11.png" src="https://user-images.githubusercontent.com/125335793/219946451-98262b7f-d818-4577-af3c-c557eb3fcb8b.png">

③SQL Codeでべた書きしたfilter  
<img width="700" alt="画像12.png" src="https://user-images.githubusercontent.com/125335793/219946483-f78961dc-6e72-4c1f-8974-05fbafe7c320.png">  


#### 3. まとめ  
実行時間・メモリ使用量を比較すると、CE Functionにべた書きしたCalculation Viewのパフォーマンスが優れていました。  
また、Dynamic filterとSQL Codeを比較すると、差異はほとんどない結果でしたた。  
このことから、単純なパフォーマンスであれば、CE Functionにべた書きがよさそうです。  
ただ、同様のフィルタを複数のHANA Viewに設定する際は、Dynamic filterを設定することで、修正が発生した際、1つのProcedureを修正するだけでよい場合があるため、保守性の観点では、Dynamic filterが優位になると思います。  

※本検証は、かなり簡単なフィルタ設定であったため、より複雑になった際のフィルタ設定では、また違った結果になるかもしれません。  
　また、検証してみます。
