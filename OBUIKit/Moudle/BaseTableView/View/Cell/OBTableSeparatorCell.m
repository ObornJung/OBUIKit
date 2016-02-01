//
//  OBTableSeparatorCell.m
//  OBUIKit
//
//  Created by Oborn.Jung on 15/11/20.
//  Copyright © 2015年 Oborn.Jung. All rights reserved.
//

#import "OBTableSeparatorCell.h"
#import "OBSeparatorModel.h"
#import "OBLine.h"
#import "Masonry.h"
#import "OBUIExtend.h"
#import "OBDebugMacro.h"

@interface OBTableSeparatorCell ()

@property (nonatomic, strong) OBLine            * separatorLine;

@end

@implementation OBTableSeparatorCell

#pragma mark - Override

- (void)setupViews {
    [super setupViews];
    [self.contentView addSubview:({
        _separatorLine = [OBLine lineWithType:OBLineTypeLine color:[UIColor ob_colorWithRGB:0xDDDDDD] width:0.5];
        _separatorLine;
    })];
    [_separatorLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).offset(0);
    }];
}

#pragma mark - TBBuyCellProtocol

+ (CGFloat)tableView:(UITableView *)tableView rowHeightForModel:(OBBaseComponentModel *)model {
    CGFloat cellHeight = 0;
    if ([model isKindOfClass:[OBSeparatorModel class]]) {
        cellHeight = ((OBSeparatorModel *)model).lineWidth;
    }
    return cellHeight;
}

- (void)setModel:(OBBaseComponentModel *)componentModel {
    if ([componentModel isKindOfClass:[OBSeparatorModel class]]) {
        OBSeparatorModel * model = (OBSeparatorModel *)componentModel;
        _separatorLine.type  = model.lineType;
        _separatorLine.color = model.lineColor;
        _separatorLine.width = model.lineWidth;
        self.backgroundColor = model.backgroundColor;
        __weak UIView * weakSelf = self;
        dispatch_main_async_safe(^{
            [_separatorLine mas_updateConstraints:^(MASConstraintMaker *make) {
                UIView * strongSelf = weakSelf;
                if (strongSelf) {
                    make.left.equalTo(strongSelf).offset(model.insets.left);
                    make.right.equalTo(strongSelf).offset(-model.insets.right);
                }
            }];
        });
    }
}

@end
