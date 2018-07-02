//
//  LLYLoadingAnimationVC.m
//  LLYCAShapeLayer
//
//  Created by lly on 2017/4/16.
//  Copyright © 2017年 lly. All rights reserved.
//

#import "LLYLoadingAnimationVC.h"

@interface LLYLoadingAnimationVC ()

@end

@implementation LLYLoadingAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"Loading动画";
    
    [self addLoadingAnimation];
}

- (void)addLoadingAnimation{
    
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    UIBezierPath *bPath = [UIBezierPath bezierPath];
    [bPath addArcWithCenter:CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2 - 64) radius:100 startAngle:0 endAngle:M_PI*2 clockwise:YES];
    shapeLayer.path = bPath.CGPath;
    shapeLayer.strokeColor = [UIColor whiteColor].CGColor;
    shapeLayer.lineWidth = 10;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineCap = kCALineCapRound;
    
    CABasicAnimation *strokeAnim = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    strokeAnim.duration = 3;
    strokeAnim.fromValue = @0;
    strokeAnim.toValue = @1;
    strokeAnim.repeatCount = HUGE_VALF;
    strokeAnim.autoreverses = YES;
    strokeAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [shapeLayer addAnimation:strokeAnim forKey:@"lly"];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.view.frame;
    gradientLayer.colors = @[(id)[UIColor redColor].CGColor,(id)[UIColor yellowColor].CGColor,(id)[UIColor greenColor].CGColor];
    gradientLayer.locations = @[@0,@0.5,@1];
    
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 0);
    
    gradientLayer.mask = shapeLayer;
    
    [self.view.layer addSublayer:gradientLayer];
    
}

- (void)viewDidAppear:(BOOL)animated{

    [super viewDidAppear:animated];
    
    NSLog(@"===%s===",__func__);
}


- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    
    NSLog(@"===%s===",__func__);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
