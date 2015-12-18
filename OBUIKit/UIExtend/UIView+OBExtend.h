//
//  UIView+OBExtend.h
//  OBBaseUIKit
//
//  Created by Oborn.Jung on 8/20/14.
//  Copyright (c) 2014 Oborn.Jung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (OBExtend)

/**
 *  获取keyView：key window的顶层view
 *
 *  @return keyView
 */
+ (UIView *)ob_keyView;

/**
 *  获取view第一响应的viewController
 *
 *  @return view第一响应的viewController
 */
-(UIViewController *)ob_viewController;

/**
 *  删除所有的subview
 */
- (void)ob_removeAllSubviews;

/**
 *  循环打印View视图树中所有的View
 *
 *  @return 返回循环打印的字符串
 */
- (NSString *)ob_recursiveDiscription;

/**
 *  截图
 *
 *  @param isOpaque 是否需要保留alpha
 *
 *  @return 截图后的image
 */
- (UIImage *)ob_shotcutWithOpaque:(BOOL)isOpaque;

@end