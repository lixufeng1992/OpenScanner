#import <QuartzCore/QuartzCore.h>
#import "ALToastView.h"

static const CGFloat kDuration = 2;

static NSMutableArray *toasts;

@interface ALToastView ()

@property (nonatomic, readonly) UILabel *textLabel;

- (void)fadeToastOut;
+ (void)nextToastInView:(UIView *)parentView;

@end


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


@implementation ALToastView

@synthesize textLabel = _textLabel;


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - NSObject

- (id)initWithText:(NSString *)text {
	if ((self = [self initWithFrame:CGRectZero])) {
		// Add corner radius
		self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.6];
		self.layer.cornerRadius = 5;
		self.autoresizingMask = UIViewAutoresizingNone;
		self.autoresizesSubviews = NO;
		
		// Init and add label
		_textLabel = [[UILabel alloc] init];
		_textLabel.text = text;
		_textLabel.minimumFontSize = 14;
		_textLabel.font = [UIFont systemFontOfSize:14];
		_textLabel.textColor = [UIColor whiteColor];
		_textLabel.adjustsFontSizeToFitWidth = NO;
		_textLabel.backgroundColor = [UIColor clearColor];
		[_textLabel sizeToFit];
		
		[self addSubview:_textLabel];
		_textLabel.frame = CGRectOffset(_textLabel.frame, 10, 5);
	}
	
	return self;
}


- (void)dealloc {
	[_textLabel release];
  
	[super dealloc];
}


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - Public

+ (void)toastInView:(UIView *)parentView withText:(NSString *)text {
	// Add new instance to queue
	ALToastView *view = [[ALToastView alloc] initWithText:text];
  
	CGFloat lWidth = view.textLabel.frame.size.width;
	CGFloat lHeight = view.textLabel.frame.size.height;
	CGFloat pWidth = parentView.frame.size.width;
	CGFloat pHeight = parentView.frame.size.height;
	
	// Change toastview frame
	view.frame = CGRectMake((pWidth - lWidth - 20) / 2., pHeight - lHeight - 60, lWidth + 20, lHeight + 10);
	view.alpha = 0.0f;
	
	if (toasts == nil) {
		toasts = [[NSMutableArray alloc] initWithCapacity:1];
		[toasts addObject:view];
		[ALToastView nextToastInView:parentView];
	}
	else {
		[toasts addObject:view];
	}
	
  [view release];
}


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - Private

- (void)fadeToastOut {
	// Fade in parent view
  [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionAllowUserInteraction
   
                   animations:^{
                     self.alpha = 0.f;
                   } 
                   completion:^(BOOL finished){
                     UIView *parentView = self.superview;
                     [self removeFromSuperview];
                     
                     // Remove current view from array
                     [toasts removeObject:self];
                     if ([toasts count] == 0) {
                       [toasts release];
                       toasts = nil;
                     }
                     else
                       [ALToastView nextToastInView:parentView];
                   }];
}


+ (void)nextToastInView:(UIView *)parentView {
	if ([toasts count] > 0) {
    ALToastView *view = [toasts objectAtIndex:0];
    
		// Fade into parent view
		[parentView addSubview:view];
    [UIView animateWithDuration:.5  delay:0 options:UIViewAnimationOptionAllowUserInteraction
                     animations:^{
      view.alpha = 1.0;
                     } completion:^(BOOL finished){}];
    
    // Start timer for fade out
    [view performSelector:@selector(fadeToastOut) withObject:nil afterDelay:kDuration];
  }
}

@end
