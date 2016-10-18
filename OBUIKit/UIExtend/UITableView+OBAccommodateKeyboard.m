//
//  UITableView+AccommodateKeyboard.m
//  TBBuy
//
//  Created by XueCheng on 4/10/15.
//  Copyright (c) 2015 christ.yuj. All rights reserved.
//

#import "OBDebugMacro.h"
#import "UITableView+OBAccommodateKeyboard.h"

@implementation UITableView (OBAccommodateKeyboard)

- (void)ob_setAccommodateKeyboard:(BOOL)accommodate {
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    if (accommodate) {
        [notificationCenter addObserver:self selector:@selector(ob_handleKeyboardWillShow:)
                                   name:UIKeyboardWillShowNotification object:nil];
        [notificationCenter addObserver:self selector:@selector(ob_handleKeyboardWillHide:)
                                   name:UIKeyboardWillHideNotification object:nil];
    } else {
        [notificationCenter removeObserver:self name:UIKeyboardWillShowNotification object:nil];
        [notificationCenter removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    }
}

- (void)ob_handleKeyboardWillShow:(NSNotification*)notification {
    
    CGRect beginFrame = [notification.userInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    CGRect endFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat minus = beginFrame.origin.y - endFrame.origin.y;
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0f, 0.0f, minus, 0.0f);
    
    self.contentInset = contentInsets;
    self.scrollIndicatorInsets = contentInsets;
    
    if (SYSTEM_VERSION_LESS_THAN(@"7.0")) {
        [self ob_scrollToActiveCell];
    }
}

- (void)ob_handleKeyboardWillHide:(NSNotification *)notification {
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    self.contentInset = contentInsets;
    self.scrollIndicatorInsets = contentInsets;
}

- (void)ob_scrollToActiveCell {
    UIView *responder = [self ob_findFirstResponder:self];
    UITableViewCell *cell = (UITableViewCell *)[self ob_findViewByClass:[UITableViewCell class]
                                                              startView:responder];
    if (cell) {
        NSIndexPath* indexPath = [self indexPathForRowAtPoint:cell.center];
        if (indexPath) {
            [self scrollToRowAtIndexPath:indexPath
                        atScrollPosition:UITableViewScrollPositionBottom
                                animated:YES];
        }
    }
}

- (id)ob_findFirstResponder:(UIView *)targetView {
    if (targetView.isFirstResponder) {
        return targetView;
    }
    
    for (UIView *subView in targetView.subviews) {
        id responder = [self ob_findFirstResponder:subView];
        if (responder) return responder;
    }
    
    return nil;
}

- (UIView *)ob_findViewByClass:(Class)clazz startView:(UIView *)view {
    if ([view isKindOfClass:clazz]) {
        return view;
    } else if (view.superview) {
        return [self ob_findViewByClass:clazz startView:view.superview];
    } else {
        return nil;
    }
}

@end
