//
//  OBAnimation.m
//  OBBaseUIKit
//
//  Created by ObornJung on 10/14/14.
//  Copyright (c) 2014 ObornJung. All rights reserved.
//

#import "OBAnimation.h"
#import "RBBLinearInterpolation.h"
#import "OBAnimationFunctions.h"

#define kOBAnimationFPS     60.0    ///< animation frame frequency

typedef void(^OBAnimationCompletionBlock)(BOOL finished);

typedef id (^OBAnimationArrayBlock)(NSUInteger idx);


@interface OBAnimationArray : NSArray

+ (instancetype)arrayWithCount:(NSUInteger)count block:(OBAnimationArrayBlock)block;

- (instancetype)initWithCount:(NSUInteger)count block:(OBAnimationArrayBlock)block;

@end

@implementation OBAnimationArray
{
    NSUInteger              _count;
    OBAnimationArrayBlock   _block;
}

#pragma mark - Lifecycle
+ (instancetype)arrayWithCount:(NSUInteger)count block:(OBAnimationArrayBlock)block
{
    return [[self alloc] initWithCount:count block:block];
}

- (instancetype)initWithCount:(NSUInteger)count block:(OBAnimationArrayBlock)block
{
    self = [super init];
    if (self)
    {
        _count = count;
        _block = [block copy];
    }
    return self;
}

- (instancetype)init
{
    return [self initWithCount:0 block:nil];
}

- (instancetype)initWithObjects:(const id [])objects count:(NSUInteger)cnt
{
    NSArray *otherArray = [NSArray arrayWithObjects:objects count:cnt];
    
    return [self initWithCount:cnt block:^(NSUInteger idx)
    {
        return otherArray[idx];
    }];
}

#pragma mark - ovrride

- (id)copyWithZone:(NSZone *)zone
{
    return [[self.class allocWithZone:zone] initWithCount:_count block:_block];
}

- (NSUInteger)count
{
    return _count;
}

- (id)objectAtIndex:(NSUInteger)index
{
    if (index < _count)
    {
        return _block(index);
    }
    else
    {
        return nil;
    }
}

@end


@interface OBAnimation()

@property (nonatomic, strong) id                            startValue;
@property (nonatomic, strong) id                            endValue;
@property (nonatomic, strong) OBAnimationCompletionBlock    completionBlock;
@property (nonatomic, assign) OBAnimationFunction           animationFunction;
@property (nonatomic, strong) RBBLinearInterpolation        interpolationFunction;

+ (OBAnimationFunction)animationFunctionWithType:(OBAnimationType)animationType;

@end

@implementation OBAnimation

#pragma mark - Lifecycle

+ (NSSet *)keyPathsForValuesAffectingValues
{
    return [NSSet setWithArray:@[ @"startValue", @"endValue", @"completionBlock", @"animationFunction" ]];
}

- (id)copyWithZone:(NSZone *)zone
{
    OBAnimation * copy = [super copyWithZone:zone];
    if (nil != copy)
    {
        copy.startValue = self.startValue;
        copy.endValue = self.endValue;
        copy.completionBlock = [self.completionBlock copy];
        copy.animationFunction = self.animationFunction;
        copy.interpolationFunction = [self.interpolationFunction copy];
    }
    return copy;
}

+ (instancetype)animationWithKeyPath:(NSString *)keypath
                            duration:(NSTimeInterval)duration
                          startValue:(id)startValue
                            endValue:(id)endValue
                       animationType:(OBAnimationType)type
                          completion:(OBAnimationCompletionBlock)completionBlock
{
    return [[self alloc] initWithKeyPath:keypath
                                duration:duration
                              startValue:startValue
                                endValue:endValue
                           animationType:type
                              completion:completionBlock];
}

- (instancetype)initWithKeyPath:(NSString *)keypath
                       duration:(NSTimeInterval)duration
                     startValue:(id)startValue
                       endValue:(id)endValue
                  animationType:(OBAnimationType)type
                     completion:(OBAnimationCompletionBlock)completionBlock
{
    self = [super init];
    if (self)
    {
        self.keyPath = keypath;
        self.duration = duration;
        self.startValue = startValue;
        self.endValue = endValue;
        self.completionBlock = completionBlock;
        self.animationFunction = [[self class] animationFunctionWithType:type];
        self.interpolationFunction = RBBInterpolate(self.startValue, self.endValue);
        
        //
        // we're already generating values at 60fps
        self.calculationMode = kCAAnimationLinear;
    }
    return self;
}

#pragma mark - Override for CAKeyframeAnimation

- (NSArray *)values
{
    return [OBAnimationArray arrayWithCount:self.duration * kOBAnimationFPS block:^id(NSUInteger idx) {
        double value = self.animationFunction(idx / kOBAnimationFPS, 0, 1, self.duration);
        return self.interpolationFunction(value);
    }];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)finished
{
    if (self.completionBlock != nil)
    {
        self.completionBlock(finished);
        self.completionBlock = nil;
    }
}

#pragma - Private methods
+ (OBAnimationFunction)animationFunctionWithType:(OBAnimationType)animationType
{
    switch (animationType)
    {
        case OBAnimationTypeEaseInQuad:
            return OBAnimationFunctionEaseInQuad;
        case OBAnimationTypeEaseOutQuad:
            return OBAnimationFunctionEaseOutQuad;
        case OBAnimationTypeEaseInOutQuad:
            return OBAnimationFunctionEaseInOutQuad;
        case OBAnimationTypeEaseInCubic:
            return OBAnimationFunctionEaseInCubic;
        case OBAnimationTypeEaseOutCubic:
            return OBAnimationFunctionEaseOutCubic;
        case OBAnimationTypeEaseInOutCubic:
            return OBAnimationFunctionEaseInOutCubic;
        case OBAnimationTypeEaseInQuart:
            return OBAnimationFunctionEaseInQuart;
        case OBAnimationTypeEaseOutQuart:
            return OBAnimationFunctionEaseOutQuart;
        case OBAnimationTypeEaseInOutQuart:
            return OBAnimationFunctionEaseInOutQuart;
        case OBAnimationTypeEaseInQuint:
            return OBAnimationFunctionEaseInQuint;
        case OBAnimationTypeEaseOutQuint:
            return OBAnimationFunctionEaseOutQuint;
        case OBAnimationTypeEaseInOutQuint:
            return OBAnimationFunctionEaseInOutQuint;
        case OBAnimationTypeEaseInSine:
            return OBAnimationFunctionEaseInSine;
        case OBAnimationTypeEaseOutSine:
            return OBAnimationFunctionEaseOutSine;
        case OBAnimationTypeEaseInOutSine:
            return OBAnimationFunctionEaseInOutSine;
        case OBAnimationTypeEaseInExpo:
            return OBAnimationFunctionEaseInExpo;
        case OBAnimationTypeEaseOutExpo:
            return OBAnimationFunctionEaseOutExpo;
        case OBAnimationTypeEaseInOutExpo:
            return OBAnimationFunctionEaseInOutExpo;
        case OBAnimationTypeEaseInCirc:
            return OBAnimationFunctionEaseInCirc;
        case OBAnimationTypeEaseOutCirc:
            return OBAnimationFunctionEaseOutCirc;
        case OBAnimationTypeEaseInOutCirc:
            return OBAnimationFunctionEaseInOutCirc;
        case OBAnimationTypeEaseInElastic:
            return OBAnimationFunctionEaseInElastic;
        case OBAnimationTypeEaseOutElastic:
            return OBAnimationFunctionEaseOutElastic;
        case OBAnimationTypeEaseInOutElastic:
            return OBAnimationFunctionEaseInOutElastic;
        case OBAnimationTypeEaseInBack:
            return OBAnimationFunctionEaseInBack;
        case OBAnimationTypeEaseOutBack:
            return OBAnimationFunctionEaseOutBack;
        case OBAnimationTypeEaseInOutBack:
            return OBAnimationFunctionEaseInOutBack;
        case OBAnimationTypeEaseInBounce:
            return OBAnimationFunctionEaseInBounce;
        case OBAnimationTypeEaseOutBounce:
            return OBAnimationFunctionEaseOutBounce;
        case OBAnimationTypeEaseInOutBounce:
            return OBAnimationFunctionEaseInOutBounce;
        default:
            return NULL;
    }
    
    return NULL;
}


@end
