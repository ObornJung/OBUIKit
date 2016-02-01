//
//  OBTableBaseCell.m
//  FastFood
//
//  Created by Oborn.Jung on 15/11/18.
//  Copyright © 2015年 WDK. All rights reserved.
//

#import "OBTableBaseCell.h"
#import "OBBaseComponentModel.h"

@implementation OBTableBaseCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    self.clipsToBounds               = YES;
    self.contentView.clipsToBounds   = YES;
    self.backgroundColor             = [UIColor clearColor];
    self.contentView.backgroundColor = [UIColor clearColor];
    self.selectionStyle              = UITableViewCellSelectionStyleNone;
}

- (void)setContentInsets:(UIEdgeInsets)contentInsets {
    _contentInsets = contentInsets;
}

#pragma mark - TBBuyCellProtocol

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    return [self initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
}

+ (CGFloat)tableView:(UITableView *)tableView rowHeightForModel:(OBBaseComponentModel *)model {
    return 44.0f;
}

- (void)setModel:(OBBaseComponentModel *)componentModel {

}

@end
