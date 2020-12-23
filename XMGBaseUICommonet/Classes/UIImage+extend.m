//
//  UIImage+extend.m
//  Sport
//
//  Created by 小马科技 on 2020/12/2.
//  Copyright © 2020 iband. All rights reserved.
//

#import "UIImage+extend.h"

@implementation UIImage (extend)
- (UIImage *)drawRectWithRoundedCorner:(CGSize)size{
    
    CGRect rect = CGRectMake(0.f, 0.f, size.width, size.height);
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:rect.size.width * 0.5];
    UIGraphicsBeginImageContextWithOptions(rect.size, false, [UIScreen mainScreen].scale);
    CGContextAddPath(UIGraphicsGetCurrentContext(), bezierPath.CGPath);
    CGContextClip(UIGraphicsGetCurrentContext());
    [self drawInRect:rect];
 
    CGContextDrawPath(UIGraphicsGetCurrentContext(), kCGPathFillStroke);
    UIImage *output = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return output;
    
    
}

@end
