

#import "CALayer+XMGXibBorderColor.h"
#import <UIKit/UIKit.h>

@implementation CALayer (XMGXibBorderColor)

- (void)setBorderColorFromUIColor:(UIColor *)color{
    self.borderColor = color.CGColor;
}

@end
