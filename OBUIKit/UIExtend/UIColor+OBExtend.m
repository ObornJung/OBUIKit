//
//  UIColor+OBExtend.m
//  OBBaseUIKit
//
//  Created by Oborn.Jung on 11/3/14.
//  Copyright (c) 2014 Oborn.Jung. All rights reserved.
//

#import "UIColor+OBExtend.h"

@implementation UIColor (OBExtend)

+ (UIColor *)colorWithHex:(NSUInteger)hex
{
    NSUInteger a = (hex >> 24) & 0xFF;
    NSUInteger r = (hex >> 16) & 0xFF;
    NSUInteger g = (hex >> 8 ) & 0xFF;
    NSUInteger b = hex & 0xFF;
    return [UIColor colorWithRed:r / 255.0f green:g / 255.0f blue:b / 255.0f alpha:a / 255.0f];
}

+ (UIColor *)colorWithRGBA:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue alpha:(NSInteger)alpha
{
    return [self colorWithRed:(red / 255.0f) green:(green / 255.0f) blue:(blue / 255.0f) alpha:(alpha / 255.0f)];
}

@end
