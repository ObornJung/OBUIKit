//
//  UIColor+OBExtend.h
//  OBBaseUIKit
//
//  Created by Oborn.Jung on 11/3/14.
//  Copyright (c) 2014 Oborn.Jung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (OBExtend)

+ (UIColor *)colorWithHex:(NSUInteger)hex;

+ (UIColor *)colorWithRGBA:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue alpha:(NSInteger)alpha;

@end
