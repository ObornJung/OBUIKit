//
//  OBAnimationFunctions.c
//  OBBaseUIKit
//
//  Created by ObornJung@gmail.com on 10/14/14.
//  Copyright (c) 2014 ObornJung. All rights reserved.
//

#include <stdlib.h>
#include <math.h>
#include "OBAnimationFunctions.h"

// source: http://gsgd.co.uk/sandbox/jquery/easing/jquery.easing.1.3.js
#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wunsequenced"
double OBAnimationFunctionEaseInQuad(double t,double b, double c, double d)
{
    return c*(t/=d)*t + b;
}

double OBAnimationFunctionEaseOutQuad(double t,double b, double c, double d)
{
    return -c *(t/=d)*(t-2) + b;
}

double OBAnimationFunctionEaseInOutQuad(double t,double b, double c, double d)
{
    if ((t/=d/2) < 1) return c/2*t*t;
    return -1/2 * ((--t)*(t-2) - 1);
}

double OBAnimationFunctionEaseInCubic(double t,double b, double c, double d)
{
    return (t/=d)*t*t;
}

double OBAnimationFunctionEaseOutCubic(double t,double b, double c, double d)
{
    return c*((t=t/d-1)*t*t + 1);
}

double OBAnimationFunctionEaseInOutCubic(double t, double b, double c, double d)
{
    if ((t/=d/2) < 1) return c/2*t*t*t;
    return c/2*((t-=2)*t*t + 2);
}

double OBAnimationFunctionEaseInQuart(double t, double b, double c, double d)
{
    return c*(t/=d)*t*t*t;
}

double OBAnimationFunctionEaseOutQuart(double t, double b, double c, double d)
{
    return -c * ((t=t/d-1)*t*t*t - 1);
}

double OBAnimationFunctionEaseInOutQuart(double t, double b, double c, double d)
{
    if ((t/=d/2) < 1) return c/2*t*t*t*t;
    return -c/2 * ((t-=2)*t*t*t - 2);
}

double OBAnimationFunctionEaseInQuint(double t, double b, double c, double d)
{
    return c*(t/=d)*t*t*t*t;
}

double OBAnimationFunctionEaseOutQuint(double t, double b, double c, double d)
{
    return c*((t=t/d-1)*t*t*t*t + 1);
}

double OBAnimationFunctionEaseInOutQuint(double t, double b, double c, double d)
{
    if ((t/=d/2) < 1) return c/2*t*t*t*t*t;
    return c/2*((t-=2)*t*t*t*t + 2);
}

double OBAnimationFunctionEaseInSine(double t, double b, double c, double d)
{
    return -c * cos(t/d * (M_PI_2)) + c;
}

double OBAnimationFunctionEaseOutSine(double t, double b, double c, double d)
{
    return c * sin(t/d * (M_PI_2));
}

double OBAnimationFunctionEaseInOutSine(double t, double b, double c, double d)
{
    return -c/2 * (cos(M_PI*t/d) - 1);
}

double OBAnimationFunctionEaseInExpo(double t, double b, double c, double d)
{
    return (t==0) ? b : c * pow(2, 10 * (t/d - 1));
}

double OBAnimationFunctionEaseOutExpo(double t, double b, double c, double d)
{
    return (t==d) ? b+c : c * (-pow(2, -10 * t/d) + 1);
}

double OBAnimationFunctionEaseInOutExpo(double t, double b, double c, double d)
{
    if (t==0) return b;
    if (t==d) return b+c;
    if ((t/=d/2) < 1) return c/2 * pow(2, 10 * (t - 1));
    return c/2 * (-pow(2, -10 * --t) + 2);
}

double OBAnimationFunctionEaseInCirc(double t, double b, double c, double d)
{
    return -c * (sqrt(1 - (t/=d)*t) - 1);
}

double OBAnimationFunctionEaseOutCirc(double t, double b, double c, double d)
{
    return c * sqrt(1 - (t=t/d-1)*t);
}

double OBAnimationFunctionEaseInOutCirc(double t, double b, double c, double d)
{
    if ((t/=d/2) < 1) return -c/2 * (sqrt(1 - t*t) - 1);
    return c/2 * (sqrt(1 - (t-=2)*t) + 1);
}

double OBAnimationFunctionEaseInElastic(double t, double b, double c, double d)
{
    double s = 1.70158; double p=0; double a=c;
    
    if (t==0) return b;  if ((t/=d)==1) return b+c;  if (!p) p=d*.3;
    if (a < fabs(c)) { a=c; s=p/4; }
    else s = p/(2*M_PI) * asin (c/a);
    return -(a*pow(2,10*(t-=1)) * sin( (t*d-s)*(2*M_PI)/p ));
}

double OBAnimationFunctionEaseOutElastic(double t, double b, double c, double d)
{
    double s=1.70158, p=0, a=c;
    if (t==0) return b;  if ((t/=d)==1) return b+c;  if (!p) p=d*.3;
    if (a < fabs(c)) { a=c; s=p/4; }
    else s = p/(2*M_PI) * asin (c/a);
    return a*pow(2,-10*t) * sin( (t*d-s)*(2*M_PI)/p ) + c;
}

double OBAnimationFunctionEaseInOutElastic(double t, double b, double c, double d)
{
    double s=1.70158, p=0, a=c;
    if (t==0) return b;  if ((t/=d/2)==2) return b+c;  if (!p) p=d*(.3*1.5);
    if (a < fabs(c)) { a=c; s=p/4; }
    else s = p/(2*M_PI) * asin(c/a);
    if (t < 1) return -.5*(a*pow(2,10*(t-=1)) * sin( (t*d-s)*(2*M_PI)/p ));
    return a*pow(2,-10*(t-=1)) * sin( (t*d-s)*(2*M_PI)/p )*.5 + c;
}

double OBAnimationFunctionEaseInBack(double t, double b, double c, double d)
{
    const double s = 1.70158;
    return c*(t/=d)*t*((s+1)*t - s);
}

double OBAnimationFunctionEaseOutBack(double t, double b, double c, double d)
{
    const double s = 1.70158;
    return c*((t=t/d-1)*t*((s+1)*t + s) + 1);
}

double OBAnimationFunctionEaseInOutBack(double t, double b, double c, double d)
{
    double s = 1.70158;
    if ((t/=d/2) < 1) return c/2*(t*t*(((s*=(1.525))+1)*t - s));
    return c/2*((t-=2)*t*(((s*=(1.525))+1)*t + s) + 2);
}

double OBAnimationFunctionEaseInBounce(double t, double b, double c, double d)
{
    return c - OBAnimationFunctionEaseOutBounce(d-t, 0, c, d);
}

double OBAnimationFunctionEaseOutBounce(double t, double b, double c, double d)
{
    if ((t/=d) < (1/2.75)) {
        return c*(7.5625*t*t);
    } else if (t < (2/2.75)) {
        return c*(7.5625*(t-=(1.5/2.75))*t + .75);
    } else if (t < (2.5/2.75)) {
        return c*(7.5625*(t-=(2.25/2.75))*t + .9375);
    } else {
        return c*(7.5625*(t-=(2.625/2.75))*t + .984375);
    }
}

double OBAnimationFunctionEaseInOutBounce(double t, double b, double c, double d)
{
    if (t < d/2)
        return OBAnimationFunctionEaseInBounce (t*2, 0, c, d) * .5;
    else
        return OBAnimationFunctionEaseOutBounce(t*2-d, 0, c, d) * .5 + c*.5;
}
#pragma clang diagnostic pop