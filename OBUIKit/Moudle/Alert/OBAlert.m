//
//  OBAlert.m
//  OBBaseUIKit
//
//  Created by Oborn.Jung on 15/10/28.
//  Copyright © 2015年 Oborn.Jung. All rights reserved.
//

#import "OBAlert.h"
//#import "UIAlertController+Window.h"

@implementation OBAlert

+ (void)alertWithMessage:(NSString * _Nonnull)message
            buttonTitles:(NSArray<NSString * > * _Nonnull)titles {
    [self alertWithMessage:message buttonTitles:titles callback:nil];
}

+ (void)alertWithMessage:(NSString * _Nonnull)message
            buttonTitles:(NSArray<NSString *> * _Nonnull)titles
                callback:(OBAlertCallback _Nullable)callback {
    [self alertWithTitle:@"" message:message buttonTitles:titles callback:callback];
}


+ (void)alertWithTitle:(NSString * _Nonnull)title
               message:(NSString * _Nullable)message
          buttonTitles:(NSArray<NSString *> * _Nonnull)titles
              callback:(OBAlertCallback _Nullable)callback{
    
//    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0")) {
//        // iOS 8 - AlertController
//        UIAlertController * alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
//        [titles enumerateObjectsUsingBlock:^(NSString *title, NSUInteger idx, BOOL * _Nonnull stop) {
//            NSAssert([title isKindOfClass:[NSString class]], @"title must be a NSString");
//            UIAlertAction *action = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//                if (callback) {
//                    callback((int)idx, title);
//                }
//            }];
//            [alert addAction:action];
//        }];
//        [alert show];
//    } else {
//        // iOS 7 - AlertView
//#pragma GCC diagnostic push
//#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
//        UIAlertView * alert = [UIAlertView bk_alertViewWithTitle:title message:message];
//        [titles enumerateObjectsUsingBlock:^(NSString *title, NSUInteger idx, BOOL * _Nonnull stop) {
//            NSAssert([title isKindOfClass:[NSString class]], @"title must be a NSString");
//            [alert bk_addButtonWithTitle:title handler:^{
//                if (callback) {
//                    callback((int)idx, title);
//                }
//            }];
//        }];
//        [alert show];
//#pragma GCC diagnostic pop
//    }
}

@end
