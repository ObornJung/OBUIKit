//
//  UIColor+OBExtend.m
//  OBBaseUIKit
//
//  Created by Oborn.Jung on 11/3/14.
//  Copyright (c) 2014 ATG. All rights reserved.
//

#import "UIColor+OBExtend.h"

@implementation UIColor (OBExtend)

+ (UIColor *)ob_colorWithRGB:(NSUInteger)rgb {
    return [UIColor ob_colorWithRGB:rgb alpha:1.0f];;
}

+ (UIColor *)ob_colorWithARGB:(NSUInteger)argb {
    NSUInteger rgb = argb & 0xFFFFFF;
    CGFloat alpha = ((argb >> 24) & 0xFF) / 255.0f;
    return [self ob_colorWithRGB:rgb alpha:alpha];
}

+ (UIColor *)ob_colorWithRGB:(NSUInteger)rgb alpha:(CGFloat)alpha {
    NSUInteger r = (rgb >> 16) & 0xFF;
    NSUInteger g = (rgb >> 8 ) & 0xFF;
    NSUInteger b = rgb & 0xFF;
    return [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:alpha];
}

@end
