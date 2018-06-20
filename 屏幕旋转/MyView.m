//
//  MyView.m
//  屏幕旋转
//
//  Created by BJyhc on 2018/6/19.
//  Copyright © 2018年 blue@circle. All rights reserved.
//

#import "MyView.h"

@interface MyView()
@property(nonatomic,strong) UIButton *btn1;
@property(nonatomic,strong) UIButton *btn2;
@end

@implementation MyView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor yellowColor];
        
        _btn1 = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 50)];
        _btn1.backgroundColor = [UIColor redColor];
        [_btn1 addTarget:self action:@selector(tapBnt1) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_btn1];
        
        _btn2 = [[UIButton alloc]initWithFrame:CGRectMake(100, 200, 100, 50)];
        _btn2.backgroundColor = [UIColor purpleColor];
        [_btn2 addTarget:self action:@selector(tapBnt2) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_btn2];
        
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientChange:) name:UIDeviceOrientationDidChangeNotification object:[UIDevice currentDevice]];
    }
    return self;
}

-(BOOL)shouldAutorotate{
    return YES;
}

-(UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskLandscapeRight;
}

- (void)tapBnt1
{
    NSNumber *orientationUnknow = [NSNumber numberWithInteger:UIInterfaceOrientationUnknown];
    [[UIDevice currentDevice] setValue:orientationUnknow forKey:@"orientation"];
    NSNumber *orientationTarget = [NSNumber numberWithInteger:UIInterfaceOrientationLandscapeRight];
                        //UIInterfaceOrientationLandscapeRight
    [[UIDevice currentDevice] setValue:orientationTarget forKey:@"orientation"];
//    [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger:UIInterfaceOrientationLandscapeLeft] forKey:@"orientation"];
//    [[NSNotificationCenter defaultCenter] postNotificationName:UIDeviceOrientationDidChangeNotification object:[UIDevice currentDevice]];
}

- (void)tapBnt2
{
    NSNumber *orientationUnknow = [NSNumber numberWithInteger:UIInterfaceOrientationUnknown];
    [[UIDevice currentDevice] setValue:orientationUnknow forKey:@"orientation"];
    NSNumber *orientationTarget = [NSNumber numberWithInteger:UIInterfaceOrientationPortrait];
    [[UIDevice currentDevice] setValue:orientationTarget forKey:@"orientation"];
//    [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger:UIInterfaceOrientationPortrait] forKey:@"orientation"];
//    [[NSNotificationCenter defaultCenter] postNotificationName:UIDeviceOrientationDidChangeNotification object:[UIDevice currentDevice]];
}


- (void)orientChange:(NSNotification *)notice
{
    UIDeviceOrientation orientation = [UIDevice currentDevice].orientation;
    CGFloat duration = [UIApplication sharedApplication].statusBarOrientationAnimationDuration;
    if (orientation == UIDeviceOrientationPortrait) {
//        [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationPortrait animated:YES];
        [self layoutSubviews];
        NSLog(@"----UIDeviceOrientationPortrait");
    }
    if (orientation == UIDeviceOrientationLandscapeLeft) {
//        [[UIApplication sharedApplication] setStatusBarOrientation:UIDeviceOrientationLandscapeLeft animated:YES];
        [self layoutSubviews];
        [UIView animateWithDuration:duration animations:^{
            self.transform = CGAffineTransformMakeRotation(M_PI / 2);
        }completion:^(BOOL finished) {
        }];
        NSLog(@"----UIDeviceOrientationLandscapeLeft");
    }
    if (orientation == UIDeviceOrientationLandscapeRight) {
//        [[UIApplication sharedApplication] setStatusBarOrientation:UIDeviceOrientationLandscapeRight animated:YES];
        [self layoutSubviews];
        [UIView animateWithDuration:duration animations:^{
            self.transform = CGAffineTransformMakeRotation(-M_PI / 2);
        }completion:^(BOOL finished) {
        }];
        NSLog(@"----UIDeviceOrientationLandscapeRight");
    }
}

@end
