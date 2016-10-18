//
//  OBLine.m
//  OBUIKit
//
//  Created by Oborn.Jung on 15/10/27.
//  Copyright © 2015年 ATG. All rights reserved.
//

#import "OBLine.h"

@implementation OBLine

+ (instancetype)lineWithType:(OBLineType)type
                       color:(nonnull UIColor *)color
                       width:(CGFloat)width {
    return [[self alloc] initWithType:type color:color width:width];
}

- (instancetype)initWithType:(OBLineType)type
                       color:(UIColor *)color
                       width:(CGFloat)width; {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.clipsToBounds   = YES;
        _type  = type;
        _color = color;
        _width = width >= 0.0f ? width : 1.0f;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    //获得处理的上下文
    CGContextRef context =UIGraphicsGetCurrentContext();
    //开始一个起始路径
    CGContextBeginPath(context);
    //设置线条粗细宽度
    CGContextSetLineWidth(context, _width);
    //设置线条的颜色
    CGContextSetStrokeColorWithColor(context, _color.CGColor);
    if (_type != OBLineTypeLine) {
        //lengths说明虚线如何交替绘制,lengths的值{2, 4}表示先绘制2个点，再跳过4-2个点，如此反复
        CGFloat lengths[2];
        switch (_type) {
            case OBLineTypeDash:
                lengths[0] = 2;
                lengths[1] = 4;
                break;
                
            case OBLineTypeDot:
                lengths[0] = 1;
                lengths[1] = 2;
                break;
                
            default:
                break;
        }
        CGContextSetLineDash(context, 0, lengths,2);
    }
    //设置开始点的位置
    CGContextMoveToPoint(context, 0.0, self.frame.size.height/2);
    //设置终点的位置
    CGContextAddLineToPoint(context,self.frame.size.width,self.frame.size.height/2);
    //封闭当前线路
    CGContextClosePath(context);
    //开始绘制虚线
    CGContextStrokePath(context);
}

- (void)setType:(OBLineType)type {
    _type = type;
    [self setNeedsDisplay];
}

- (void)setColor:(UIColor *)color {
    _color = color;
    [self setNeedsDisplay];
}

- (void)setWidth:(CGFloat)width {
    _width = width;
    [self setNeedsDisplay];
}

@end
