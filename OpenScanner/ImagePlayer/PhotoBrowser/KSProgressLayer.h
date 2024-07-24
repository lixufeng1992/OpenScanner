
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface KSProgressLayer : CAShapeLayer

- (instancetype)initWithFrame:(CGRect)frame;
- (void)startSpin; 
- (void)stopSpin;

@end

NS_ASSUME_NONNULL_END
