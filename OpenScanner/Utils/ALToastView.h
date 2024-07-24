
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ALToastView : UIView {
	UILabel *_textLabel;
}

+ (void)toastInView:(UIView *)parentView withText:(NSString *)text;

@end
