//
//  UIImage+OBExtend.m
//  OBUIKit
//
//  Created by Oborn.Jung on 12/14/15.
//  Copyright © 2015 Oborn.Jung. All rights reserved.
//

#import "UIImage+OBExtend.h"

@implementation UIImage (OBExtend)

+ (UIImage *)ob_imageWithColor:(UIColor *)color size:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(ctx, color.CGColor);
    CGContextFillRect(ctx, CGRectMake(0, 0, size.width, size.height));
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
