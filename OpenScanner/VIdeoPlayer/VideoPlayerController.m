
#import "VideoPlayerController.h"
#import "APPlayer.h"
#import "ALToastView.h"


@interface VideoPlayerController () <UITextFieldDelegate>
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIButton *playButton;
@property (nonatomic, strong) APPlayer *player;
@property (nonatomic, strong) UITextField *textField;

@end

@implementation VideoPlayerController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Video Player did load");
    [self setupPlayer];
    [self setupUI];
}

- (BOOL)shouldAutorotate {
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return NO;
}

- (void)setupUI {
    self.view.backgroundColor = [UIColor grayColor];
    self.tabBarItem.image = [UIImage imageNamed:@"video"];
    
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor lightTextColor];
    label.backgroundColor = [UIColor blueColor];
    label.text = @"开放资源浏览器";
    [self.view addSubview:label];
    label.textAlignment = NSTextAlignmentCenter;
    self.label = label;
    
    self.textField = [[UITextField alloc] init];
    self.textField.placeholder = @"点击输入网址";
    self.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.textField.backgroundColor = [UIColor systemBlueColor];
    self.textField.textColor = [UIColor lightTextColor];
    self.textField.layer.cornerRadius = 15;
    self.textField.layer.masksToBounds = YES;
    self.textField.delegate = self;
    [self.view addSubview:self.textField];
    
    self.playButton = [[UIButton alloc] init];
    [self.playButton addTarget:self action:@selector(playAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.playButton setTitle:@"播放" forState:UIControlStateNormal];
    [self.playButton setTitleColor:[UIColor lightTextColor] forState:UIControlStateNormal];
    [self.playButton setBackgroundColor:[UIColor systemBlueColor]];
    self.playButton.layer.cornerRadius = 15;
    self.playButton.layer.masksToBounds = YES;
    self.player.layer.cornerRadius = 15;
    self.player.layer.masksToBounds = YES;
    [self.view addSubview:self.playButton];
    
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.label.frame  = CGRectMake(0, 44, cccreenWidth, 44);

    self.player.frame  = CGRectMake(0, 88, cccreenWidth, 3 * cccreenWidth / 4);
    
    self.textField.frame = CGRectMake(20, CGRectGetMaxY(self.player.frame) + 44, cccreenWidth - 40, 64);
    self.playButton.frame = CGRectMake(20, CGRectGetMaxY(self.textField.frame) + 44, cccreenWidth - 40, 64);
    
}

- (void)playAction:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (sender.selected) {
        //@"https://vjs.zencdn.net/v/oceans.mp4";
        //http://www.w3school.com.cn/i/movie.mp4
        [self.player play];
        self.player.closeBtn.hidden = YES;
       
    }else{
        [self.player pause];
        self.player.closeBtn.hidden = NO;
    }
}

- (void)setupPlayer {
    NSString *url = @"http://www.w3school.com.cn/i/movie.mp4";
    self.player = [[APPlayer alloc] initWithURL:url];
    [self.view addSubview:self.player];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}
- (void)textFieldDidEndEditing:(UITextField *)textField reason:(UITextFieldDidEndEditingReason)reaso {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    return YES;
}
- (void)textFieldDidChangeSelection:(UITextField *)textField {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}
- (BOOL)textFieldShouldClear:(UITextField *)textField {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    return NO;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    if ([textField.text hasPrefix:@"http://"]) {
        [textField resignFirstResponder];
        return YES;
    } else {
        [ALToastView toastInView:self.player withText:@"请输入合法的视频网址"];
        [textField resignFirstResponder];
        return YES;
    }
}

@end
