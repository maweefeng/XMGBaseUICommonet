//
//  CALayer+DdkXibBorderColor.h
//  MainProject
//
//  Created by 尚软科技 on 2019/1/21.
//  Copyright © 2019 cnsunrun. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>


@interface CALayer (XMGXibBorderColor)

- (void)setBorderColorFromUIColor:(UIColor *)color;

@end
