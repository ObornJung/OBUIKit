//
//  UIColor+OBExtend.m
//  OBBaseUIKit
//
//  Created by Oborn.Jung on 11/3/14.
//  Copyright (c) 2014 ATG. All rights reserved.
//

#import "UIColor+OBExtend.h"

@implementation UIColor (OBExtend)

+ (UIColor *)ob_colorWithString:(NSString *)colorStr {
    if ([colorStr hasPrefix:@"#"]) {
        unsigned colorValue = 0;
        NSScanner * scanner = [NSScanner scannerWithString:colorStr];
        [scanner setScanLocation:1]; [scanner scanHexInt:&colorValue];
        if (colorStr.length > 9) {
            return nil;
        } else if (colorStr.length > 7) {
            return [self ob_colorWithARGB:colorValue];
        } else {
            return [self ob_colorWithRGB:colorValue];
        }
    } else {
        return nil;
    }
}

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
