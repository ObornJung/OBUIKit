//
//  OBTableCellMappingProtocol.h
//  OBUIKit
//
//  Created by Oborn.Jung on 15/11/23.
//  Copyright © 2015年 Oborn.Jung. All rights reserved.
//

#import <Foundation/Foundation.h>

@class OBBaseComponentModel;

@protocol OBTableCellMappingProtocol <NSObject>

@required
- (Class)cellClassForModel:(OBBaseComponentModel *)model;

@end