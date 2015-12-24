//
//  UIColor+OBExtend.m
//  OBBaseUIKit
//
//  Created by Oborn.Jung on 11/3/14.
//  Copyright (c) 2014 Oborn.Jung. All rights reserved.
//

#import "UIColor+OBExtend.h"

@implementation UIColor (OBExtend)

+ (UIColor *)ob_colorWithRGB:(NSUInteger)rgb
{
    return [UIColor ob_colorWithRGB:rgb alpha:1.0f];;
}

+ (UIColor *)ob_colorWithARGB:(NSUInteger)argb
{
    NSUInteger a = (argb >> 24) & 0xFF;
    NSUInteger r = (argb >> 16) & 0xFF;
    NSUInteger g = (argb >> 8 ) & 0xFF;
    NSUInteger b = argb & 0xFF;
    return [UIColor colorWithRed:r / 255.0f green:g / 255.0f blue:b / 255.0f alpha:a / 255.0f];
}

+ (UIColor *)ob_colorWithRGB:(NSUInteger)rgb alpha:(CGFloat)alpha {
    NSUInteger r = (rgb >> 16) & 0xFF;
    NSUInteger g = (rgb >> 8 ) & 0xFF;
    NSUInteger b = rgb & 0xFF;
    return [UIColor colorWithRed:r / 255.0f green:g / 255.0f blue:b / 255.0f alpha:alpha];

}

@end
