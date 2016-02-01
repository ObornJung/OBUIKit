//
//  OBTableCellFactory.h
//  OBUIKit
//
//  Created by Oborn.Jung on 15/11/23.
//  Copyright © 2015年 Oborn.Jung. All rights reserved.
//

#import "OBTableCellFactory.h"
#import "OBBaseComponentTag.h"
#import "OBTableSeparatorCell.h"

@interface OBTableCellFactory ()

@property (nonatomic, strong) NSDictionary                      * cellMapping;

@end

@implementation OBTableCellFactory

#pragma mark - FFOrderCellMappingProtocol

- (Class)cellClassForModel:(OBBaseComponentModel *)model {
    Class class = [self.interceptor cellClassForModel:model];
    if (!class) {
        NSString * tag = model.tag ?: kOBTableDefaultCellKey;
        class = self.cellMapping[tag];
    }
    return class;
}

#pragma mark - Public methods

- (UITableViewCell<OBTableCellProtocol> *)cellForModel:(OBBaseComponentModel *)model
                                       reuseIdentifier:(NSString *)reuseIdentifier {
    Class cellClass = [self cellClassForModel:model];
    return [[cellClass alloc] initWithReuseIdentifier:reuseIdentifier];
}

#pragma mark -

- (NSDictionary *)cellMapping {
    if (!_cellMapping) {
        _cellMapping = @{
                         kOBTableDefaultCellKey     : [OBTableBaseCell class],
                         kOBTableSeparatorCellKey   : [OBTableSeparatorCell class],
                         };
    }
    return _cellMapping;
}

@end
