

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITabBarItem (Custom)
// 设置角标值时，替换系统的 'setBadgeValue:'方法
- (void)my_setBadgeValue:(NSString *)badgeValue;
@end

NS_ASSUME_NONNULL_END
