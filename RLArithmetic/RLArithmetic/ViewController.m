//
//  ViewController.m
//  RLArithmetic
//
//  Created by LLZ on 2018/1/5.
//  Copyright © 2018年 LLZ. All rights reserved.
//

#import "ViewController.h"
#import "RLArithmetic.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //(3 + 3) * 2 / 2
    NSLog(@"%@", @"3".add(@"3").mul(@"2").div(@2));
    //(3 + 3 * 2) / 2
    NSLog(@"%@", @"3".add(@"3".mul(@"2")).div(@2));
    
    NSLog(@"%@", @"sdf".add([UIView new]));
    
    NSLog(@"%@", @"3235234.34".formatToThousandsWithRoundDown(4));//输出 3,235,234.3400
    NSLog(@"%@", @"3235234.34553".formatToThousandsWithRoundDown(3));
    NSLog(@"%@", @"3235234.344".formatToThousandsWithRoundDown(2));//输出 3,235,234.34
    //
    //    NSLog(@"%@", @"1.455".roundUp(2));
    //    NSLog(@"%@", @"1.00000".roundUp(2));
    //    NSLog(@"%@", @"1.00000".roundUpWithZeroFill(3));
    //
    //    //((3 + 3 * 2) / 2) / 7  只入不舍，2位小数
    //    NSLog(@"%@", (@3).add(@"3".mul(@"2")).div(@2).div(@7).roundUp(2));
    //    //(2 + 11 - dsg) * 123  操作数错误的情况
    //    NSLog(@"%@", @"2".add(@"11").sub(@"dsg").mul(@"123"));
    
    //    NSString *num = @"2";
    NSString *num = nil;
    //第一个操作数必须要判空，括号内的操作数可以不判空
    //    if (num) {
    //        NSLog(@"%@", num.add(@1).mul(nil));
    //    }
    
    //    NSLog(@"%@", NOT_NULL(num).add(@1));
    //
    //    NSLog(@"%@", CAL(num).add(num));
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@", @"3235234.34".formatToThousandsWithRoundPlain(4));
}

- (void)test {
    //1、字符串 -> NSDecimalNumber
    NSDecimalNumber *num1 = [NSDecimalNumber decimalNumberWithString:@"123"];
    //2、NSNumber -> NSDecimalNumber(基础类型的话，先转成NSNumber)
    NSDecimalNumber *num2 = [NSDecimalNumber decimalNumberWithDecimal:[@124.2 decimalValue]];
    NSLog(@"num2 == %@",num2);
    
    //相关运算
    
    
    /*加 +
     - (NSDecimalNumber *)decimalNumberByAdding:(NSDecimalNumber *)decimalNumber;
     - (NSDecimalNumber *)decimalNumberByAdding:(NSDecimalNumber *)decimalNumber withBehavior:(nullable id <NSDecimalNumberBehaviors>)behavior;//带保留小数位数
     */
    NSDecimalNumber *num3 = [num1 decimalNumberByAdding:num2];
    NSLog(@"num3 == %@",num3);
    
    
    /*减 -
     - (NSDecimalNumber *)decimalNumberBySubtracting:(NSDecimalNumber *)decimalNumber;
     - (NSDecimalNumber *)decimalNumberBySubtracting:(NSDecimalNumber *)decimalNumber withBehavior:(nullable id <NSDecimalNumberBehaviors>)behavior;//带保留小数位数
     */
    NSDecimalNumber *num4 = [num1 decimalNumberBySubtracting:num2];
    NSLog(@"num4 == %@",num4);
    
    /*乘 *
     - (NSDecimalNumber *)decimalNumberByMultiplyingBy:(NSDecimalNumber *)decimalNumber;
     - (NSDecimalNumber *)decimalNumberByMultiplyingBy:(NSDecimalNumber *)decimalNumber withBehavior:(nullable id <NSDecimalNumberBehaviors>)behavior;//带保留小数位数
     */
    NSDecimalNumber *num5 = [num1 decimalNumberByMultiplyingBy:num2];
    NSLog(@"num5 == %@",num5);
    
    /*除 \
     - (NSDecimalNumber *)decimalNumberByDividingBy:(NSDecimalNumber *)decimalNumber;
     - (NSDecimalNumber *)decimalNumberByDividingBy:(NSDecimalNumber *)decimalNumber withBehavior:(nullable id <NSDecimalNumberBehaviors>)behavior;//带保留小数位数
     */
    NSDecimalNumber *num6 = [num1 decimalNumberByDividingBy:num2];
    NSLog(@"num6 == %@",num6);
    
    /*比较
     - (NSComparisonResult)compare:(NSNumber *)decimalNumber;
     */
    
    NSComparisonResult result = [num1 compare:num2];
    NSLog(@"result == %ld",(long)result);
    
    
    //保留小数及相关参数含义
    /*保留小数
     + (instancetype)decimalNumberHandlerWithRoundingMode:(NSRoundingMode)roundingMode scale:(short)scale raiseOnExactness:(BOOL)exact raiseOnOverflow:(BOOL)overflow raiseOnUnderflow:(BOOL)underflow raiseOnDivideByZero:(BOOL)divideByZero;
     */
    //1、 NSRoundingMode
    
    // Rounding policies :
    // Original
    //    value 1.2  1.21  1.25  1.35  1.27
    // Plain    1.2  1.2   1.3   1.4   1.3
    // Down     1.2  1.2   1.2   1.3   1.2
    // Up       1.2  1.3   1.3   1.4   1.3
    // Bankers  1.2  1.2   1.2   1.4   1.3
    /* typedef NS_ENUM(NSUInteger, NSRoundingMode) {
     NSRoundPlain,   // Round up on a tie        四舍五入
     NSRoundDown,    // Always down == truncate  向下保留
     NSRoundUp,      // Always up                向上保留
     NSRoundBankers  // on a tie round so last digit is even 貌似是：
     
     if(四舍五入位 == 5)（四舍五入位（5）+  保留位 ）%2 == 0 ？ 入 ： 舍 ；
     
     if(四舍五入位 ！= 5) 遵从四舍五入
     };
     */
    //2、scale 保留小数个数
    //3、其它：溢出等是否报错
    
    NSDecimalNumber *num_1 = [NSDecimalNumber decimalNumberWithString:@"1.2"];
    NSDecimalNumber *num_2 = [NSDecimalNumber decimalNumberWithString:@"3.4"];
    NSDecimalNumberHandler *handel = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundBankers scale:2 raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    
    NSDecimalNumber *num_3 = [num_1 decimalNumberByDividingBy:num_2 withBehavior:handel];
    NSLog(@"num_3 == %@",num_3);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
