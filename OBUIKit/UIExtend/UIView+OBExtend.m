//
//  UIView+OBExtend.m
//  OBBaseUIKit
//
//  Created by Oborn.Jung on 8/20/14.
//  Copyright (c) 2014 Oborn.Jung. All rights reserved.
//

#import <objc/runtime.h>
#import "UIView+OBExtend.h"

@implementation UIView (OBExtend)

+ (UIView *)ob_keyView {
    UIWindow * keyWindow = [[UIApplication sharedApplication] keyWindow];
    if (keyWindow.subviews.count > 0) {
        return [keyWindow.subviews objectAtIndex:keyWindow.subviews.count - 1];
    } else {
        return keyWindow;
    }
}

- (NSString *)ob_recursiveDiscription
{
    return [[self class] ob_showViewHierarchy:self level:0];
}

-(UIViewController *)ob_viewController {
    
    UIResponder * nextResponder =  self;
    do {
        nextResponder = [nextResponder nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    } while (nextResponder != nil);
    return nil;
}

- (nullable UIView *)ob_subviewWithClass:(Class)targetClass {
    for (UIView * subview in self.subviews) {
        if ([subview isKindOfClass:targetClass]) {
            return subview;
        }
    }
    for (UIView * subview in self.subviews) {
        UIView * targetView = [subview ob_subviewWithClass:targetClass];
        if (targetView) {
            return targetView;
        }
    }
    return nil;
}

- (void)ob_removeAllSubviews {
    while (self.subviews.count) {
        UIView * view = self.subviews.lastObject;
        [view removeFromSuperview];
    }
}

- (void)ob_removeAllAutoLayout {
    [self removeConstraints:self.constraints];
    for (NSLayoutConstraint * constraint in self.superview.constraints) {
        if ([constraint.firstItem isEqual:self]) {
            [self.superview removeConstraint:constraint];
        }
    }
}

- (UIImage *)ob_snapshotWithOpaque:(BOOL)isOpaque {
    
    return [self ob_snapshotWithOpaque:isOpaque rect:self.bounds];
}

- (UIImage *)ob_snapshotWithOpaque:(BOOL)isOpaque rect:(CGRect)rect {
    
    UIGraphicsBeginImageContextWithOptions(rect.size, isOpaque, [UIScreen mainScreen].scale);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    if (!CGPointEqualToPoint(rect.origin, CGPointZero)) {
        rect.origin.x = -rect.origin.x; rect.origin.y = -rect.origin.y;
        UIGraphicsBeginImageContextWithOptions(rect.size, isOpaque, [UIScreen mainScreen].scale);
        CGRect drawRect = {rect.origin, image.size};
        [image drawInRect:drawRect];
        image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    return image;
}

#pragma mark -

+ (NSString *)ob_showViewHierarchy:(UIView *)view level:(NSInteger)level {
    NSMutableString * description = [NSMutableString string];
    NSMutableString * indent = [NSMutableString string];
    for (NSInteger i = 0; i < level; i++) {
        [indent appendString:@"  |"];
    }
    
    [description appendFormat:@"\n%@%@", indent, [view description]];
    for (UIView * item in view.subviews)
    {
        [description appendFormat:@"%@", [UIView ob_showViewHierarchy:item level:level + 1]];
    }
    return [description copy];
}

@end
