//
//  OBAlert.h
//  OBBaseUIKit
//
//  Created by Oborn.Jung on 15/10/28.
//  Copyright © 2015年 Oborn.Jung. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^OBAlertCallback)(int index,  NSString * _Nonnull title);

@interface OBAlert : NSObject

/**
 *  将会在 window 展示一个 alert 在 iOS 7 和 以上分别用不同的实现
 *
 *  @param message 标题
 *  @param titles  每个按钮的标题
 */
+ (void)alertWithMessage:(NSString * _Nonnull)message
            buttonTitles:(NSArray<NSString * > * _Nonnull)titles;

/**
 *  将会在 window 展示一个 alert 在 iOS 7 和 以上分别用不同的实现
 *
 *  @param message  标题
 *  @param titles   每个按钮的标题
 *  @param callback 回调 block
 */
+ (void)alertWithMessage:(NSString * _Nonnull)message
          buttonTitles:(NSArray<NSString *> * _Nonnull)titles
              callback:(OBAlertCallback _Nullable)callback;


/**
 *  将会在 window 展示一个 alert 在 iOS 7 和 以上分别用不同的实现
 *
 *  @param title    标题
 *  @param message  详细信息
 *  @param titles   每个按钮的标题
 *  @param callback 回调 block
 */
+ (void)alertWithTitle:(NSString * _Nonnull)title
               message:(NSString * _Nullable)message
          buttonTitles:(NSArray<NSString *> * _Nonnull)titles
              callback:(OBAlertCallback _Nullable)callback;

@end
