//
//  NSString+HexToRGB.h
//  LLMenuController
//
//  Created by AnarL on 16/3/2.
//  Copyright © 2016年 AnarL. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef struct RGBColor{
    NSInteger red;
    NSInteger green;
    NSInteger blue;
}RGBColor;

@interface NSString (HexToRGB)

+ (RGBColor)hexStringToRGB:(NSString *)hexString;


+ (NSString *)RGBToHexString:(RGBColor)rgbColor;

@end
