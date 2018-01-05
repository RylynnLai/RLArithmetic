//
//  NSNumber+RLArithmetic.m
//  精确计算
//
//  Created by LLZ on 2016/11/23.
//  Copyright © 2016年 LLZ. All rights reserved.
//

#import "NSNumber+RLArithmetic.h"

@implementation NSNumber (RLArithmetic)

-(NSString *(^)(id))cou
{
    return self.stringValue.cou;
}

- (NSString *(^)(id))add
{
    return self.stringValue.add;
}

- (NSString *(^)(id))sub
{
    return self.stringValue.sub;
}

- (NSString *(^)(id))mul
{
    return self.stringValue.mul;
}

- (NSString *(^)(id))div
{
    return self.stringValue.div;
}

- (NSString *(^)(short))roundPlain
{
    return self.stringValue.roundPlain;
}

- (NSString *(^)(short))roundPlainWithZeroFill
{
    return self.stringValue.roundPlainWithZeroFill;
}

- (NSString *(^)(short))formatToThousandsWithRoundPlain
{
    return self.stringValue.formatToThousandsWithRoundPlain;
}

- (NSString *(^)(short))roundUp
{
    return self.stringValue.roundUp;
}

- (NSString *(^)(short))roundUpWithZeroFill
{
    return self.stringValue.roundUpWithZeroFill;
}

- (NSString *(^)(short))formatToThousandsWithRoundUp
{
    return self.stringValue.formatToThousandsWithRoundUp;
}

- (NSString *(^)(short))roundDown
{
    return self.stringValue.roundDown;
}

- (NSString *(^)(short))roundDownWithZeroFill
{
    return self.stringValue.roundDownWithZeroFill;
}

- (NSString *(^)(short))formatToThousandsWithRoundDown
{
    return self.stringValue.formatToThousandsWithRoundDown;
}

- (NSString *(^)(void))roundPlainAndDown
{
    return self.stringValue.roundPlainAndDown;
}

-(NSString *(^)(void))roundPlainAndDownWithZeroFill
{
    return self.stringValue.roundPlainAndDownWithZeroFill;
}

- (NSString *(^)(void))formatToThousandsWithPlainAndDown
{
    return self.formatToThousandsWithPlainAndDown;
}

- (RLComparisonResult (^)(id))compare {
    return self.stringValue.compare;
}
@end

