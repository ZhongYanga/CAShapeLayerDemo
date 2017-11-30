//
//  ViewController.m
//  CAShapeLayer
//
//  Created by zhongyang on 2017/11/23.
//  Copyright © 2017年 zhongyang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
/** demoView */
@property (nonatomic, strong) UIView *demoView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self drawCircleProgressView];
//    [self loadingAnimation];
    [self loadingAnimation2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)loadingAnimation
{
    CAShapeLayer *loadingLayer = [CAShapeLayer layer];
    loadingLayer.frame = self.demoView.bounds;
    
    UIBezierPath *loadingPath = [UIBezierPath bezierPathWithOvalInRect:self.demoView.bounds];
    loadingLayer.lineWidth = 6;
    loadingLayer.strokeColor = [UIColor redColor].CGColor;
    loadingLayer.strokeStart = 0.0;
    loadingLayer.strokeEnd = 0.4;
    loadingLayer.lineCap = kCALineCapRound;
    loadingLayer.fillColor = [UIColor clearColor].CGColor;
    loadingLayer.path = loadingPath.CGPath;
    
    [self.demoView.layer addSublayer:loadingLayer];
    
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    rotationAnimation.duration = 2;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = MAXFLOAT;
    [loadingLayer addAnimation:rotationAnimation forKey:nil];
}
- (void)loadingAnimation2
{
    CAShapeLayer *loadingLayer = [CAShapeLayer layer];
    loadingLayer.frame = self.demoView.bounds;
    
    UIBezierPath *loadingPath = [UIBezierPath bezierPathWithOvalInRect:self.demoView.bounds];
    loadingLayer.lineWidth = 6;
    loadingLayer.strokeColor = [UIColor redColor].CGColor;
    loadingLayer.strokeStart = -0.5;
    loadingLayer.strokeEnd = 0;
    loadingLayer.lineCap = kCALineCapRound;
    loadingLayer.fillColor = [UIColor clearColor].CGColor;
    loadingLayer.path = loadingPath.CGPath;
    
    [self.demoView.layer addSublayer:loadingLayer];

    CABasicAnimation *startAnimation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    startAnimation.fromValue = @(-0.5);
    startAnimation.toValue = @(1);
    CABasicAnimation *endAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    endAnimation.fromValue = @(0);
    endAnimation.toValue = @(1);
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.animations = @[startAnimation, endAnimation];
    groupAnimation.duration = 1.5f;
    groupAnimation.repeatCount = INFINITY;
    
    [loadingLayer addAnimation:groupAnimation forKey:nil];
}
/**
 绘制一个圆形进度条
 */
- (void)drawCircleProgressView
{
    CAShapeLayer *circleProgressLayer = [CAShapeLayer layer];
    circleProgressLayer.frame = self.demoView.bounds;
    
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:self.demoView.bounds];
    circleProgressLayer.path = circlePath.CGPath;
    circleProgressLayer.lineWidth = 4;
    circleProgressLayer.strokeColor = [UIColor redColor].CGColor;
    circleProgressLayer.fillColor = [UIColor clearColor].CGColor;
    
    [self.demoView.layer addSublayer:circleProgressLayer];
    
    CABasicAnimation *pathAnima = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnima.duration = 3.0f;
    pathAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pathAnima.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnima.toValue = [NSNumber numberWithFloat:1.0f];
    pathAnima.fillMode = kCAFillModeForwards;
    pathAnima.removedOnCompletion = NO;
    
    [circleProgressLayer addAnimation:pathAnima forKey:nil];
}

#pragma mark - lazyload
- (UIView *)demoView
{
    if (!_demoView) {
        _demoView = [[UIView alloc]init];
        [self.view addSubview:_demoView];
        _demoView.frame = CGRectMake(0, 0, 100, 100);
        _demoView.center = self.view.center;
    }
    return _demoView;
}

@end
