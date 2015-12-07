//
//  OBAnimationFunctions.h
//  OBBaseUIKit
//
//  Created by ObornJung@gmail.com on 10/14/14.
//  Copyright (c) 2014 ObornJung. All rights reserved.
//

#ifndef OBBaseUIKit_OBAnimationFunctions_h
#define OBBaseUIKit_OBAnimationFunctions_h

typedef double (*OBAnimationFunction)(double, double, double, double);

extern double OBAnimationFunctionEaseInQuad(double t,double b, double c, double d);
extern double OBAnimationFunctionEaseOutQuad(double t,double b, double c, double d);
extern double OBAnimationFunctionEaseInOutQuad(double t,double b, double c, double d);

extern double OBAnimationFunctionEaseInCubic(double t,double b, double c, double d);
extern double OBAnimationFunctionEaseOutCubic(double t,double b, double c, double d);
extern double OBAnimationFunctionEaseInOutCubic(double t, double b, double c, double d);

extern double OBAnimationFunctionEaseInQuart(double t, double b, double c, double d);
extern double OBAnimationFunctionEaseOutQuart(double t, double b, double c, double d);
extern double OBAnimationFunctionEaseInOutQuart(double t, double b, double c, double d);

extern double OBAnimationFunctionEaseInQuint(double t, double b, double c, double d);
extern double OBAnimationFunctionEaseOutQuint(double t, double b, double c, double d);
extern double OBAnimationFunctionEaseInOutQuint(double t, double b, double c, double d);

extern double OBAnimationFunctionEaseInSine(double t, double b, double c, double d);
extern double OBAnimationFunctionEaseOutSine(double t, double b, double c, double d);
extern double OBAnimationFunctionEaseInOutSine(double t, double b, double c, double d);

extern double OBAnimationFunctionEaseInExpo(double t, double b, double c, double d);
extern double OBAnimationFunctionEaseOutExpo(double t, double b, double c, double d);
extern double OBAnimationFunctionEaseInOutExpo(double t, double b, double c, double d);

extern double OBAnimationFunctionEaseInCirc(double t, double b, double c, double d);
extern double OBAnimationFunctionEaseOutCirc(double t, double b, double c, double d);
extern double OBAnimationFunctionEaseInOutCirc(double t, double b, double c, double d);

extern double OBAnimationFunctionEaseInElastic(double t, double b, double c, double d);
extern double OBAnimationFunctionEaseOutElastic(double t, double b, double c, double d);
extern double OBAnimationFunctionEaseInOutElastic(double t, double b, double c, double d);

extern double OBAnimationFunctionEaseInBack(double t, double b, double c, double d);
extern double OBAnimationFunctionEaseOutBack(double t, double b, double c, double d);
extern double OBAnimationFunctionEaseInOutBack(double t, double b, double c, double d);

extern double OBAnimationFunctionEaseInBounce(double t, double b, double c, double d);
extern double OBAnimationFunctionEaseOutBounce(double t, double b, double c, double d);
extern double OBAnimationFunctionEaseInOutBounce(double t, double b, double c, double d);

#endif
