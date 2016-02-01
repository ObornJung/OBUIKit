//
//  OBBaseComponentModel.h
//  OBUIKit
//
//  Created by Oborn.Jung on 15/11/18.
//  Copyright © 2015年 Oborn.Jung. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM (NSInteger, OBComponentStatus) {
    OBComponentStatusNormal  = 0,
    OBComponentStatusDisable = 1,
    OBComponentStatusHidden  = 2
};

@class OBBaseComponentModel;

@interface OBComponentValidateResult : NSObject

@property (nonatomic, assign          ) BOOL                  valid;
@property (nonatomic, strong, nullable) NSString              * errorMsg;
@property (nonatomic, weak, nullable  ) OBBaseComponentModel  * invalidModel;

@end

@interface OBBaseComponentModel : NSObject


@property (nonatomic, assign                    ) OBComponentStatus         modelStatus;
@property (nonatomic, strong, nullable          ) NSString                  * tag;
@property (nonatomic, strong, nullable          ) id                        object;
@property (nonatomic, strong, readonly, nullable) OBComponentValidateResult * validate;


//- (id)initWithData:(NSDictionary *)data;
//
//- (void)reload:(NSDictionary *)data;

@end