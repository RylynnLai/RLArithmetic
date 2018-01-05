//
//  NSString+RLArithmetic.h
//  精确计算
//
//  Created by LLZ on 2016/11/22.
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
#define ErrorResult @""
#define NotAnNum @"NaN"
#define NOT_NULL(num) num == nil ? NotAnNum : num
#define COU(num) @"0".cou(num)

typedef NS_ENUM(NSInteger, RLComparisonResult) {RLNaNError = INT_MIN, RLOrderedAscending = -1L, RLOrderedSame, RLOrderedDescending};

@interface NSString (RLArithmetic)
//在分类中@property不会生成_变量，也不会实现getter和setter方法,但是可以手动实现getter和setter
#pragma mark 四则运算
/**
 加法（NSString或NSNumber）
 */
@property (nonatomic, copy, readonly) NSString *(^add)(id num);
/**
 减法（NSString或NSNumber）
 */
@property (nonatomic, copy, readonly) NSString *(^sub)(id num);
/**
 乘法（NSString或NSNumber）
 */
@property (nonatomic, copy, readonly) NSString *(^mul)(id num);
/**
 除法（NSString或NSNumber）
 */
@property (nonatomic, copy, readonly) NSString *(^div)(id num);
/**
 返回本身（NSString或NSNumber）
 */
@property (nonatomic, copy, readonly) NSString *(^cou)(id num);

#pragma mark 格式化输出
/**
 四舍五入（小数位数）
 */
@property (nonatomic, copy, readonly) NSString *(^roundPlain)(short scale);
/**
 四舍五入（小数位数）末尾有0补位
 */
@property (nonatomic, copy, readonly) NSString *(^roundPlainWithZeroFill)(short scale);
/**
 只舍不入（小数位数）
 */
@property (nonatomic, copy, readonly) NSString *(^roundDown)(short scale);
/**
 只舍不入（小数位数）末尾有0补位
 */
@property (nonatomic, copy, readonly) NSString *(^roundDownWithZeroFill)(short scale);
/**
 只入不舍（小数位数）
 */
@property (nonatomic, copy, readonly) NSString *(^roundUp)(short scale);
/**
 只入不舍（小数位数）末尾有0补位
 */
@property (nonatomic, copy, readonly) NSString *(^roundUpWithZeroFill)(short scale);

#pragma mark 千分位格式化
/**
 四舍五入（小数位数）千分位格式化输出（逗号分割），小数末尾有0补位
 */
@property (nonatomic, copy, readonly) NSString *(^formatToThousandsWithRoundPlain)(short scale);
/**
 只舍不入（小数位数）千分位格式化输出（逗号分割），小数末尾有0补位
 */
@property (nonatomic, copy, readonly) NSString *(^formatToThousandsWithRoundDown)(short scale);
/**
 只入不舍（小数位数）千分位格式化输出（逗号分割），小数末尾有0补位
 */
@property (nonatomic, copy, readonly) NSString *(^formatToThousandsWithRoundUp)(short scale);

#pragma mark 金额格式化处理
/**
 四舍五入保留四位小数，然后截取保留两位小数
 */
@property (nonatomic, copy, readonly) NSString *(^roundPlainAndDown)(void);
/**
 四舍五入保留四位小数，然后截取保留两位小数，小数末尾有0补位
 */
@property (nonatomic, copy, readonly) NSString *(^roundPlainAndDownWithZeroFill)(void);
/**
 四舍五入保留四位小数，然后截取保留两位小数，小数末尾有0补位，并格式化为千分位
 */
@property (nonatomic, copy, readonly) NSString *(^formatToThousandsWithPlainAndDown)(void);

#pragma mark 大小比较
/**
 比较（RLNaNError：操作数不是数字；RLOrderedAscending：self<num；RLOrderedSame：self==num；RLOrderedDescending：self>num）
 */
@property (nonatomic, copy, readonly) RLComparisonResult (^compare)(id num);

@end

#pragma mark ------------------------------------------------------------
#pragma mark 用于格式化的分类方法
@interface NSDecimalNumber (Round)
- (NSString *)roundingWithMode:(NSRoundingMode)mode scale:(short)scale;
- (NSString *)roundingZeroFillWithMode:(NSRoundingMode)mode scale:(short)scale;
- (NSString *)formatToThousandsWithRoundingMode:(NSRoundingMode)mode scale:(short)scale;
@end
