

#import "ImagePlayerController.h"

@interface ImagePlayerController ()

@end

@implementation ImagePlayerController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Image Player did load");
    self.view.backgroundColor = [UIColor redColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (BOOL)shouldAutorotate {
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return NO;
}

@end
