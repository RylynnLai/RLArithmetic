//
//  RLArithmeticiable.h
//  RLArithmetic
//
//  Created by nathan on 2021/3/12.
//  Copyright © 2021 LLZ. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, RLComparisonResult) {RLNaNError = INT_MIN, RLOrderedAscending = -1L, RLOrderedSame, RLOrderedDescending};

@protocol RLArithmeticiable <NSObject>

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
@property (nonatomic, copy, readonly) NSString *(^itself)(id num);
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
@property (nonatomic, copy, readonly) NSString *(^roundDown)(short scale);//向下保留(只舍不入)
/**
 只舍不入（小数位数）末尾有0补位
 */
@property (nonatomic, copy, readonly) NSString *(^roundDownWithZeroFill)(short scale);//向下保留(只舍不入)
/**
 只入不舍（小数位数）
 */
@property (nonatomic, copy, readonly) NSString *(^roundUp)(short scale);//向上保留（只入不舍）
/**
 只入不舍（小数位数）末尾有0补位
 */
@property (nonatomic, copy, readonly) NSString *(^roundUpWithZeroFill)(short scale);//向上保留（只入不舍）

#pragma mark 千分位格式化
/**
 四舍五入（小数位数）千分位格式化输出（逗号分割），末尾有0补位
 */
@property (nonatomic, copy, readonly) NSString *(^formatToThousandsWithRoundPlain)(short scale);
/**
 只舍不入（小数位数）千分位格式化输出（逗号分割），末尾有0补位
 */
@property (nonatomic, copy, readonly) NSString *(^formatToThousandsWithRoundDown)(short scale);
/**
 只入不舍（小数位数）千分位格式化输出（逗号分割），末尾有0补位
 */
@property (nonatomic, copy, readonly) NSString *(^formatToThousandsWithRoundUp)(short scale);

#pragma mark 大小比较
/**
 比较（RLNaNError：操作数不是数字；RLOrderedAscending：self<num；RLOrderedSame：self==num；RLOrderedDescending：self>num）
 */
@property (nonatomic, copy, readonly) RLComparisonResult (^compare)(id num);
@end

NS_ASSUME_NONNULL_END
