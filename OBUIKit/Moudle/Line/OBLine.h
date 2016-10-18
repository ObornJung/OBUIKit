//
//  OBLine.h
//  OBUIKit
//
//  Created by Oborn.Jung on 15/10/27.
//  Copyright © 2015年 ATG. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, OBLineType) {
    OBLineTypeLine = 0,
    OBLineTypeDash,
    OBLineTypeDot,
};

@interface OBLine : UIView

@property (nonatomic, assign) OBLineType  type;
@property (nonatomic, assign) CGFloat     width;
@property (nonatomic, strong) UIColor     * color;

+ (instancetype)lineWithType:(OBLineType)type
                       color:(UIColor *)color
                       width:(CGFloat)width;

- (instancetype)initWithType:(OBLineType)type
                       color:(UIColor *)color
                       width:(CGFloat)width;

@end
