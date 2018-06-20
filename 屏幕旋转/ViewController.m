//
//  ViewController.m
//  屏幕旋转
//
//  Created by BJyhc on 2018/6/19.
//  Copyright © 2018年 blue@circle. All rights reserved.
//

#import "ViewController.h"
#import "MyView.h"
#import "AppDelegate.h"
@interface ViewController ()
@property(nonatomic,strong) UIButton *btn1;
@property(nonatomic,strong) UIButton *btn2;
@property(nonatomic,strong) MyView *myView;
@property(nonatomic,assign) int   number;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    _myView = [[MyView alloc]initWithFrame:self.view.bounds];
//    [self.view addSubview:_myView];
    self.number = 0;
    _btn1 = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 50)];
    _btn1.backgroundColor = [UIColor redColor];
    [_btn1 addTarget:self action:@selector(tapBnt1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn1];
    
    _btn2 = [[UIButton alloc]initWithFrame:CGRectMake(100, 200, 100, 50)];
    _btn2.backgroundColor = [UIColor purpleColor];
    [_btn2 addTarget:self action:@selector(tapBnt2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn2];
    
    // Do any additional setup after loading the view, typically from a nib.
}



- (void)tapBnt1
{
    AppDelegate *appdele = (AppDelegate *)[UIApplication sharedApplication].delegate;
    appdele.isSupportHori = YES;
//    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
    NSNumber *orientationUnknow = [NSNumber numberWithInteger:UIInterfaceOrientationUnknown];
    [[UIDevice currentDevice] setValue:orientationUnknow forKey:@"orientation"];
    NSNumber *orientationTarget = [NSNumber numberWithInteger:UIInterfaceOrientationLandscapeRight];
    //UIInterfaceOrientationLandscapeRight
    [[UIDevice currentDevice] setValue:orientationTarget forKey:@"orientation"];
    
//    UIApplicationDidChangeStatusBarFrameNotification
//    UIApplicationWillChangeStatusBarFrameNotification
    
}


- (BOOL)prefersStatusBarHidden
{
    return self.number % 2;
//    return NO;
}

- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation {
    return UIStatusBarAnimationSlide;
//    return UIStatusBarAnimationFade;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.number ++;
    [self setNeedsStatusBarAppearanceUpdate];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

- (void)tapBnt2
{
    AppDelegate *appdele = (AppDelegate *)[UIApplication sharedApplication].delegate;
    appdele.isSupportHori = NO;
//    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
    NSNumber *orientationUnknow = [NSNumber numberWithInteger:UIInterfaceOrientationUnknown];
    [[UIDevice currentDevice] setValue:orientationUnknow forKey:@"orientation"];
    NSNumber *orientationTarget = [NSNumber numberWithInteger:UIInterfaceOrientationPortrait];
    [[UIDevice currentDevice] setValue:orientationTarget forKey:@"orientation"];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
