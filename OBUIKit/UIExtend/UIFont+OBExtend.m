//
//  UIFont+OBExtend.m
//  OBFoundationLib
//
//  Created by Oborn.Jung on 12/4/15.
//  Copyright © 2015 ObornJung. All rights reserved.
//

#import "UIFont+OBExtend.h"
#import <OBFoundationLib/OBFoundationLib.h>

@implementation UIFont (OBExtend)

+ (void)ob_printAllSystemFont {
    
    OBSLog(@"|||||||||||||||||||||||||System font start|||||||||||||||||||||||||");
    NSArray<NSString *> * familyNames = [UIFont familyNames];
    for (NSString * familyName in familyNames) {
        OBSLog(@"%@", familyName);
        NSArray<NSString *> * fontNames = [UIFont fontNamesForFamilyName:familyName];
        for (NSString * fontName in fontNames) {
            OBSLog(@"  - %@", fontName);
        }
    }
    OBSLog(@"|||||||||||||||||||||||||System font end|||||||||||||||||||||||||");
}

@end
