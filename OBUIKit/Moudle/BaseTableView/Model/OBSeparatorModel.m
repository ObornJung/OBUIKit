//
//  OBSeparatorModel.m
//  OBUIKit
//
//  Created by Oborn.Jung on 15/11/20.
//  Copyright © 2015年 Oborn.Jung. All rights reserved.
//

#import "OBUIExtend.h"
#import "OBSeparatorModel.h"
#import "OBBaseComponentTag.h"

@interface OBSeparatorModel()

@property (nonatomic, assign, readwrite) OBLineType   lineType;

+ (instancetype)separatorWithStyle:(OBLineType)lineType;

- (instancetype)initWithSeparatorStyle:(OBLineType)lineType;

@end

@implementation OBSeparatorModel

+ (instancetype)separatorWithStyle:(OBLineType)lineType {
    return [[self alloc] initWithSeparatorStyle:lineType];
}

- (instancetype)initWithSeparatorStyle:(OBLineType)lineType {
    self = [super init];
    if (self) {
        _lineWidth = 0.5f;
        _lineType  = lineType;
        _insets    = UIEdgeInsetsZero;
        _lineColor = [UIColor ob_colorWithRGB:0xDDDDDD];
        _backgroundColor = [UIColor whiteColor];
        self.tag   = kOBTableSeparatorCellKey;
    }
    return self;
}

#pragma mark - NSCopying
- (id)copyWithZone:(nullable NSZone *)zone {
    OBSeparatorModel * copyObject = [[self class] allocWithZone:zone];
    copyObject.lineWidth = self.lineWidth;
    copyObject.lineType = self.lineType;
    copyObject.lineColor = [self.lineColor copy];
    copyObject.insets = self.insets;
    copyObject.backgroundColor = self.backgroundColor;
    copyObject.tag = self.tag;
    return copyObject;
}

@end
