//
//  OBTableCellFactory.h
//  OBUIKit
//
//  Created by Oborn.Jung on 15/11/23.
//  Copyright © 2015年 Oborn.Jung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OBTableBaseCell.h"
#import "OBBaseComponentModel.h"
#import "OBTableCellMappingProtocol.h"

@interface OBTableCellFactory : NSObject <OBTableCellMappingProtocol>

@property (nonatomic, weak) id<OBTableCellMappingProtocol>      interceptor;

- (UITableViewCell<OBTableCellProtocol> *)cellForModel:(OBBaseComponentModel *)model
                                       reuseIdentifier:(NSString *)reuseIdentifier;

@end
