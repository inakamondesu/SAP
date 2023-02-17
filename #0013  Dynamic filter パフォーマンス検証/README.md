# Dynamic filter パフォーマンス検証
本記事では、Dynamic filterのパフォーマンスについて記載しております。

内容
---
1. Calculation Viewのフィルタ設定  
①#0012で作成したDynamic filter  
②Projectionノードにべた書きしたfilter  
2. Calculation Viewのクエリ結果の比較
---

#### 1. Calculation Viewのフィルタ設定    
①#0012で作成したDynamic filter 
```SQL
"YAER" >= LEFTSTR('$$IP_YEAR$$',4) AND "YAER" <= RIGHTSTR('$$IP_YEAR$$',4)
```  
<img width="700" alt="画像8.png" src="https://user-images.githubusercontent.com/125335793/219692830-fa32c9f6-2573-42d7-a6d1-90e6d85e50a8.png">  

②Projectionノードにべた書きしたfilter  
```SQL
"YEAR" >= LEFTSTR(ADDMONTHS(DATE(NOW()),-12),4) AND "YEAR" <= LEFTSTR((DATE(NOW()),4)
```  
<img width="700" alt="画像9.png" src="https://user-images.githubusercontent.com/125335793/219695260-7548449b-a2a2-4280-8375-ea7da05cb093.png">  

#### 2. Calculation Viewのクエリ結果の比較
Calculation Viewのクエリ結果の比較は、以下になりました。  
|フィルタ||||  
|:-|:-|:-|:-|    
|Dyanamic filter||||  
|べた書きfilter||||  


