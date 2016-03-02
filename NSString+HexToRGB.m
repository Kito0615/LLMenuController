//
//  NSString+HexToRGB.m
//  LLMenuController
//
//  Created by AnarL on 16/3/2.
//  Copyright © 2016年 AnarL. All rights reserved.
//

#import "NSString+HexToRGB.h"

@implementation NSString (HexToRGB)

+ (RGBColor)hexStringToRGB:(NSString *)hexString
{
    NSString * colorString = [hexString substringFromIndex:1];
    
    RGBColor returnColor;
    returnColor.red = strtol([[colorString substringWithRange:NSMakeRange(0, 2)] UTF8String], 0, 16);
    returnColor.green = strtol([[colorString substringWithRange:NSMakeRange(2, 2)] UTF8String], 0, 16);
    returnColor.blue = strtol([[colorString substringWithRange:NSMakeRange(4, 2)] UTF8String], 0, 16);
    
    return returnColor;
}

+ (NSString *)RGBToHexString:(RGBColor)rgbColor
{
    NSMutableString * returnStr = [[NSMutableString alloc] init];
    
    NSString * redHexStr = [NSString stringWithFormat:@"%1lx", (long)rgbColor.red];
    NSString * greenHexStr = [NSString stringWithFormat:@"%1lx", rgbColor.red];
    NSString * blueHexStr = [NSString stringWithFormat:@"%1lx", rgbColor.red];
    [returnStr appendString:[NSString stringWithFormat:@"#%@%@%@", redHexStr, greenHexStr, blueHexStr]];
    
    return returnStr;
}

@end
