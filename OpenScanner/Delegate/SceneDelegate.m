
#import "SceneDelegate.h"

#import "VideoPlayerController.h"
#import "ImagePlayerController.h"
#import "TabBarController.h"
#import "NavigationController.h"

@interface SceneDelegate ()
@end
@implementation SceneDelegate
- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
   
    TabBarController *tabController = [[TabBarController alloc] init];
    {
        VideoPlayerController *videoPlayerController = [[VideoPlayerController alloc] init];
        videoPlayerController.title = @"视频";
        videoPlayerController.tabBarItem.image = [UIImage imageNamed:@"video"];
        NavigationController *videoPlayerNavi = [[NavigationController alloc] initWithRootViewController:videoPlayerController];
        [videoPlayerNavi setNavigationBarHidden:YES];
        
        ImagePlayerController *imagePlayerController = [[ImagePlayerController alloc] init];
        imagePlayerController.title = @"图片";
        imagePlayerController.tabBarItem.image = [UIImage imageNamed:@"image"];
        NavigationController *imagePlayerNavi = [[NavigationController alloc] initWithRootViewController:imagePlayerController];
        [imagePlayerNavi setNavigationBarHidden:YES];
        
        tabController.viewControllers = @[videoPlayerNavi, imagePlayerNavi];
    }
    
    self.window = [[UIWindow alloc] initWithWindowScene:(UIWindowScene *)scene];
    {
        self.window.rootViewController = tabController;
        self.window.backgroundColor = [UIColor whiteColor];
        [self.window makeKeyAndVisible];
    }
}


@end
