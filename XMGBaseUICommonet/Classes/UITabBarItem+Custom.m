

#import "UITabBarItem+Custom.h"

// .m 文件
@implementation UITabBarItem (Custom)

- (void)my_setBadgeValue:(NSString *)badgeValue
{
    
    // 先设置角标值
    if (badgeValue.length == 0 || badgeValue.intValue <= 0) {
        self.badgeValue = nil;
    }else{
        [self setBadgeValue:badgeValue];
    }
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_10_0
    // 如果系统是iOS10 以上的就使用系统方法修改
    UIColor *badgeColor = [UIColor blueColor];
    [self setBadgeColor:badgeColor];
#else
    // 这里替换角标颜色的图片，需要注意的时：这个图片size=(36px,36px)，圆的
    UIImage *badgeImage = [UIImage imageNamed:@"badgeImage"];
    [self customBadgeColorWith:badgeImage];
#endif
}

- (void)customBadgeColorWith:(UIImage *)badgeImage
{
    UIView *tabBarButton = (UIView *)[self performSelector:@selector(view)];
    
    // iOS10以下的版本 角标其实是一张图片，所以我们一直找下去这个图片，然后替换他
    for(UIView *subview in tabBarButton.subviews) {
        NSString *classString = NSStringFromClass([subview class]);
        if([classString rangeOfString:@"UIBadgeView"].location != NSNotFound) {
            for(UIView *badgeSubview in subview.subviews) {
                NSString *badgeSubviewClassString = NSStringFromClass([badgeSubview class]);
                if([badgeSubviewClassString rangeOfString:@"BadgeBackground"].location != NSNotFound) {
                    [badgeSubview setValue:badgeImage forKey:@"image"];
                }
            }
        }
    }
}

@end

