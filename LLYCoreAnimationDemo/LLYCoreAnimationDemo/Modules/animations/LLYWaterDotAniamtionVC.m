//
//  LLYWaterDotAniamtionVC.m
//  LLYCAShapeLayer
//
//  Created by lly on 2017/4/17.
//  Copyright © 2017年 lly. All rights reserved.
//

#import "LLYWaterDotAniamtionVC.h"

@interface LLYWaterDotAniamtionVC ()

@end

@implementation LLYWaterDotAniamtionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self addWaterDotAnimation];
}



- (void)addWaterDotAnimation{

    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.backgroundColor = [UIColor blueColor].CGColor;
    layer.frame = CGRectMake(0, 0, 200, 200);
    layer.position = CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2);
    layer.cornerRadius = 100;
    
    
    //移动起来
    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    pathAnimation.calculationMode = kCAAnimationPaced;
    pathAnimation.fillMode = kCAFillModeForwards;
    pathAnimation.removedOnCompletion = NO;
    pathAnimation.repeatCount = HUGE_VALF;
    pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    pathAnimation.duration = 5.0;
    
    CGMutablePathRef curvedPath = CGPathCreateMutable();
    CGRect circleContainer = CGRectInset(layer.frame, layer.bounds.size.width/2 - 6, layer.bounds.size.width/2 - 6);
    CGPathAddEllipseInRect(curvedPath, NULL, circleContainer);
    
    pathAnimation.path = curvedPath;
    CGPathRelease(curvedPath);
    [layer addAnimation:pathAnimation forKey:@"pathAnimation"];
    
    
    //X方向缩放
    CAKeyframeAnimation *scaleX = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale.x"];
    scaleX.duration = 1.5;
    scaleX.values = @[@1.0,@1.1,@1.0];
    scaleX.keyTimes = @[@0.0,@0.5,@1.0];
    scaleX.repeatCount = HUGE_VALF;
    scaleX.autoreverses = YES;
    scaleX.beginTime = 0.5;
    scaleX.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [layer addAnimation:scaleX forKey:@"scaleX"];
    
    
    
    //Y方向缩放
    CAKeyframeAnimation *scaleY = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale.y"];
    scaleY.duration = 1.5;
    scaleY.values = @[@1.0,@1.2,@1.0];
    scaleY.keyTimes = @[@0.0,@0.5,@1.0];
    scaleY.repeatCount = HUGE_VALF;
    scaleY.autoreverses = YES;
    scaleY.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [layer addAnimation:scaleY forKey:@"scaleY"];
    
    
    [self.view.layer addSublayer:layer];
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
