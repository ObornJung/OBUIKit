//
//  UIColor+OBExtend.h
//  OBBaseUIKit
//
//  Created by Oborn.Jung on 11/3/14.
//  Copyright (c) 2014 Oborn.Jung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (OBExtend)

+ (UIColor *)ob_colorWithRGB:(NSUInteger)rgb;

+ (UIColor *)ob_colorWithARGB:(NSUInteger)argb;

+ (UIColor *)ob_colorWithRGB:(NSUInteger)rgb alpha:(CGFloat)alpha;

@end
