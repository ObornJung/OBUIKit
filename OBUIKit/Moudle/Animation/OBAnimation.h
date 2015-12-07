//
//  OBAnimation.h
//  OBBaseUIKit
//
//  Created by ObornJung on 10/14/14.
//  Copyright (c) 2014 ObornJung. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

typedef NS_ENUM(NSUInteger, OBAnimationType)
{
    OBAnimationTypeEaseInQuad = 0,
    OBAnimationTypeEaseOutQuad,
    OBAnimationTypeEaseInOutQuad,
    OBAnimationTypeEaseInCubic,
    OBAnimationTypeEaseOutCubic,
    OBAnimationTypeEaseInOutCubic,
    OBAnimationTypeEaseInQuart,
    OBAnimationTypeEaseOutQuart,
    OBAnimationTypeEaseInOutQuart,
    OBAnimationTypeEaseInQuint,
    OBAnimationTypeEaseOutQuint,
    OBAnimationTypeEaseInOutQuint,
    OBAnimationTypeEaseInSine,
    OBAnimationTypeEaseOutSine,
    OBAnimationTypeEaseInOutSine,
    OBAnimationTypeEaseInExpo,
    OBAnimationTypeEaseOutExpo,
    OBAnimationTypeEaseInOutExpo,
    OBAnimationTypeEaseInCirc,
    OBAnimationTypeEaseOutCirc,
    OBAnimationTypeEaseInOutCirc,
    OBAnimationTypeEaseInElastic,
    OBAnimationTypeEaseOutElastic,
    OBAnimationTypeEaseInOutElastic,
    OBAnimationTypeEaseInBack,
    OBAnimationTypeEaseOutBack,
    OBAnimationTypeEaseInOutBack,
    OBAnimationTypeEaseInBounce,
    OBAnimationTypeEaseOutBounce,
    OBAnimationTypeEaseInOutBounce,
    OBAnimationTypeCount
};

@interface OBAnimation : CAKeyframeAnimation

+ (instancetype)animationWithKeyPath:(NSString *)keypath
                            duration:(NSTimeInterval)duration
                          startValue:(id)startValue
                            endValue:(id)endValue
                       animationType:(OBAnimationType)type
                          completion:(void (^)(BOOL finished))completionBlock;

@end
