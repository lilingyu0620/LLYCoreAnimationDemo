//
//  LLYPathAnimationVC.m
//  LLYCAShapeLayer
//
//  Created by lly on 2017/4/16.
//  Copyright © 2017年 lly. All rights reserved.
//

#import "LLYPathAnimationVC.h"

@interface LLYPathAnimationVC ()

@end

@implementation LLYPathAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"path动画";
    
    [self addPathAnimation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addPathAnimation{
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.lineWidth = 10;
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    shapeLayer.fillColor = [UIColor whiteColor].CGColor;
    
    float radius1 = 100,radius2 = 50,radius3 = 25;
    CGPoint pt1 = CGPointMake(0, [UIScreen mainScreen].bounds.size.height/2);

    UIBezierPath *path = [UIBezierPath bezierPath];
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineCapRound;
    [path moveToPoint:pt1];
    [path addArcWithCenter:CGPointMake(100, [UIScreen mainScreen].bounds.size.height/2) radius:radius1 startAngle:M_PI endAngle:0 clockwise:YES];
    
    [path addArcWithCenter:CGPointMake(250, [UIScreen mainScreen].bounds.size.height/2) radius:radius2 startAngle:M_PI endAngle:0 clockwise:NO];
    
    [path addArcWithCenter:CGPointMake(325, [UIScreen mainScreen].bounds.size.height/2) radius:radius3 startAngle:M_PI endAngle:0 clockwise:YES];
    
    [path addArcWithCenter:CGPointMake(325, [UIScreen mainScreen].bounds.size.height/2) radius:radius3 startAngle:0 endAngle:M_PI clockwise:YES];
    
    [path addArcWithCenter:CGPointMake(250, [UIScreen mainScreen].bounds.size.height/2) radius:radius2 startAngle:0 endAngle:M_PI clockwise:NO];
    
    [path addArcWithCenter:CGPointMake(100, [UIScreen mainScreen].bounds.size.height/2) radius:radius1 startAngle:0 endAngle:M_PI clockwise:YES];
    
    shapeLayer.path = path.CGPath;
    
    [self.view.layer addSublayer:shapeLayer];
    
    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    pathAnimation.path = path.CGPath;
    pathAnimation.duration = 9;
    pathAnimation.repeatCount = HUGE_VAL;
    pathAnimation.autoreverses = NO;
    pathAnimation.rotationMode = kCAAnimationRotateAuto;
    pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    pathAnimation.calculationMode = kCAAnimationPaced;
    
    
    UIImageView *flyImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 80, 45)];
    [flyImageView setImage:[UIImage imageNamed:@"fly1"]];
    flyImageView.center = pt1;
    flyImageView.layer.cornerRadius = 22;
    flyImageView.layer.masksToBounds = YES;
    [self.view addSubview:flyImageView];
    
    [flyImageView.layer addAnimation:pathAnimation forKey:@"fly"];
    
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
