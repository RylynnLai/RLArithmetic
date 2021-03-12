//
//  NSNumber+RLArithmetic.h
//  精确计算
//
//  Created by LLZ on 2016/11/23.
//  Copyright © 2016年 LLZ. All rights reserved.
//

/*
 特点：
 1、支持四则运算，小数点格式化，比较大小
 2、支持NSString和NSNumber运算，支持混合使用
 3、运算顺序从左到右
 4、除了compare，其他所有的运算统一返回字符串
 5、任意一个操作数是非NSString和非NSNumber，都会返回字符串@“”
 
 注意点：
 1、第一个操作数是一个变量时，必须要判空，否则可能会崩溃。（原因：第一个操作数为nil，则后面的block都是nil）
 2、同级运算中，除法放最后运算。（避免除法出现的误差，传递到后面的运算）
 */

#import <Foundation/Foundation.h>
#import "NSString+RLArithmetic.h"
#import "RLArithmeticiable.h"
@interface NSNumber (RLArithmetic)<RLArithmeticiable>

@end
