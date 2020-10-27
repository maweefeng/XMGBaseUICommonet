//
//  CALayer+DdkXibBorderColor.m
//  MainProject
//
//  Created by 尚软科技 on 2019/1/21.
//  Copyright © 2019 cnsunrun. All rights reserved.
//

#import "CALayer+XMGXibBorderColor.h"
#import <UIKit/UIKit.h>

@implementation CALayer (XMGXibBorderColor)

- (void)setBorderColorFromUIColor:(UIColor *)color{
    self.borderColor = color.CGColor;
}

@end
