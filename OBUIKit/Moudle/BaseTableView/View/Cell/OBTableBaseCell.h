//
//  OBTableBaseCell.h
//  FastFood
//
//  Created by Oborn.Jung on 15/11/18.
//  Copyright © 2015年 WDK. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OBBaseComponentModel;

@protocol OBTableCellProtocol <NSObject>

@required

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier;

+ (CGFloat)tableView:(UITableView *)tableView rowHeightForModel:(OBBaseComponentModel *)model;

@optional

- (void)setModel:(OBBaseComponentModel *)componentModel;

@end

@interface OBTableBaseCell : UITableViewCell <OBTableCellProtocol>

@property (nonatomic, assign) UIEdgeInsets  contentInsets;

- (void)setupViews;

@end
