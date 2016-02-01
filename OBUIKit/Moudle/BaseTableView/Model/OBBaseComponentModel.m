//
//  OBBaseComponentModel.m
//  OBUIKit
//
//  Created by Oborn.Jung on 15/11/18.
//  Copyright © 2015年 Oborn.Jung. All rights reserved.
//

#import "OBBaseComponentModel.h"

@implementation OBComponentValidateResult

@end

@implementation OBBaseComponentModel
@synthesize validate = _validate;

- (instancetype)init {
    self = [super init];
    if (self) {
        _modelStatus = OBComponentStatusNormal;
    }
    return self;
}

- (OBComponentValidateResult *)validate {
    if (nil == _validate) {
        _validate = [[OBComponentValidateResult alloc] init];
        _validate.valid = YES;
        _validate.invalidModel = self;
    }
    return _validate;
}

//- (NSString *)tag {
//    return NSStringFromClass([self class]);
//}

@end
