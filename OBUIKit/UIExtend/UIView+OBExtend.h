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
+ (nullable UIView *)ob_keyView;

/**
 *  获取view第一响应的viewController
 *
 *  @return view第一响应的viewController
 */
-(nullable UIViewController *)ob_viewController;

/**
 *  remove all subview
 */
- (void)ob_removeAllSubviews;

/**
 *  remove all constraints
 */
- (void)ob_removeAllAutoLayout;

/**
 *  循环打印View视图树中所有的View
 *
 *  @return 返回循环打印的字符串
 */
- (nonnull NSString *)ob_recursiveDiscription;

/**
 *  find first view of target class in self's subviews
 *
 *  @return target class view
 */
- (nullable UIView *)ob_subviewWithClass:(nonnull Class)targetClass;

/**
 *  截图
 *
 *  @param isOpaque 是否不透明，YES-不透明 NO-保留透明度
 *
 *  @return 截图后的image
 */
- (nullable UIImage *)ob_snapshotWithOpaque:(BOOL)isOpaque;

/**
 *  View指定区域截图
 *
 *  @param isOpaque 是否不透明，YES-不透明 NO-保留透明度
 *  @param rect     截图区域
 *
 *  @return 指定区域截图的image
 */
- (nullable UIImage *)ob_snapshotWithOpaque:(BOOL)isOpaque rect:(CGRect)rect;

@end
