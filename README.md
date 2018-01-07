# RLArithmetic
封装NSDecimalNumber的四则运算和比较的api，可以很方便地进行链式调用。

```
NSLog(@"%@", @"3".add(@"3").mul(@"2").div(@2));
```

## feature
- 支持四则运算，小数点格式化，比较大小
- 支持NSString和NSNumber运算，支持混合使用
- 运算顺序从左到右
- 除了compare，其他所有的运算统一返回字符串
- 任意一个操作数是非NSString和非NSNumber，都会返回字符串@“”

## note
- 第一个操作数是一个变量时，必须要判空，否则可能会崩溃。（原因：第一个操作数为nil，则后面的block都是nil）
- 同级运算中，除法放最后运算。（避免除法出现的误差，传递到后面的运算）
