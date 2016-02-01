//
//  OBSeparatorModel.h
//  OBUIKit
//
//  Created by Oborn.Jung on 15/11/20.
//  Copyright © 2015年 Oborn.Jung. All rights reserved.
//

#import "OBLine.h"
#import "OBBaseComponentModel.h"

@interface OBSeparatorModel : OBBaseComponentModel <NSCopying>

@property (nonatomic, assign, readonly) OBLineType   lineType;
@property (nonatomic, assign          ) CGFloat      lineWidth;
@property (nonatomic, assign          ) UIEdgeInsets insets;
@property (nonatomic, strong          ) UIColor      * lineColor;
@property (nonatomic, strong          ) UIColor      * backgroundColor;

+ (instancetype)separatorWithStyle:(OBLineType)lineType;

- (instancetype)initWithSeparatorStyle:(OBLineType)lineType;

@end
