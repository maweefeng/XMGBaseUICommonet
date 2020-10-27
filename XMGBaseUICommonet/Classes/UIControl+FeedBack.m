//
//  UIControl+FeedBack.m
//  BaseUICommponet
//
//  Created by 尚软科技 on 2020/7/24.
//  Copyright © 2020 小马科技. All rights reserved.
//

#import "UIControl+FeedBack.h"
#import <objc/message.h>

@implementation UIControl (FeedBack)

+(void)initialize{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method imageNamedMethod = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
          // 获取xmg_imageNamed
          Method xmg_imageNamedMethod = class_getInstanceMethod(self, @selector(xmg_sendAction:to:forEvent:));
          // 交互方法:runtime
          method_exchangeImplementations(imageNamedMethod, xmg_imageNamedMethod);
          
    });
  
}

-(void)xmg_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event{
    
    UIImpactFeedbackGenerator * impact = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium];
    [impact impactOccurred];
    [self xmg_sendAction:action to:target forEvent:event];
}

@end
