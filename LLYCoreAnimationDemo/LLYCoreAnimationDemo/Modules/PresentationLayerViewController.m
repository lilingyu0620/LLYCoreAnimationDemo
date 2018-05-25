//
//  PresentationLayerViewController.m
//  LLYCoreAnimationDemo
//
//  Created by lly on 2018/5/25.
//  Copyright © 2018年 lly. All rights reserved.
//

#import "PresentationLayerViewController.h"

@interface PresentationLayerViewController ()<CAAnimationDelegate>

@property (nonatomic, strong) CALayer *layer;

@end

@implementation PresentationLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    self.layer = [CALayer layer];
    self.layer.frame = CGRectMake(0, 0, 100, 100);
    self.layer.position = self.view.center;
    self.layer.backgroundColor = [UIColor redColor].CGColor;
    
    [self.view.layer addSublayer:self.layer];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    CGPoint pt = [[touches anyObject] locationInView:self.view];
    if ([self.layer.presentationLayer hitTest:pt]) {
        
        CGFloat red = arc4random() / (CGFloat)INT_MAX;
        CGFloat green = arc4random() / (CGFloat)INT_MAX;
        CGFloat blue = arc4random() / (CGFloat)INT_MAX;
        self.layer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;
    }
    else{
        
        NSLog(@"动画前----------------------------------------------------------begin");
        
        CGRect preFrame = self.layer.presentationLayer.frame;
        NSLog(@"preFrame : x = %f ,y = %f ,width = %f ,height = %f",preFrame.origin.x,preFrame.origin.y,preFrame.size.width,preFrame.size.height);
        
        CGRect modelFrame = self.layer.modelLayer.frame;
        NSLog(@"modelFrame : x = %f ,y = %f ,width = %f ,height = %f",modelFrame.origin.x,modelFrame.origin.y,modelFrame.size.width,modelFrame.size.height);
        
        CGRect selfFrame = self.layer.frame;
        NSLog(@"selfFrame : x = %f ,y = %f ,width = %f ,height = %f",selfFrame.origin.x,selfFrame.origin.y,selfFrame.size.width,selfFrame.size.height);
        
        NSLog(@"动画前----------------------------------------------------------end");
        
        CABasicAnimation *posiAni = [self positionAnimationWithFromValue:self.layer.presentationLayer.position toValue:pt];
        posiAni.delegate = self;
        [self.layer addAnimation:posiAni forKey:@"posianikey"];
        
        
//        [CATransaction begin];
//        [CATransaction setCompletionBlock:^{
//
//        }];
//        [CATransaction setAnimationDuration:5.0];
//        self.layer.position = pt;
//        [CATransaction commit];
    }
    
}


- (CABasicAnimation *)positionAnimationWithFromValue:(CGPoint)fromPt toValue:(CGPoint)toPt{
    
    CABasicAnimation *positionAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    positionAnimation.fromValue = [NSValue valueWithCGPoint:fromPt];
    positionAnimation.toValue = [NSValue valueWithCGPoint:toPt];
    positionAnimation.fillMode = kCAFillModeForwards;
    positionAnimation.removedOnCompletion = NO;
    positionAnimation.duration = 5.0;
    positionAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    positionAnimation.autoreverses = NO;
    return positionAnimation;
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    
    if ([self.layer animationForKey:@"posianikey"] == anim) {
        NSLog(@"动画后----------------------------------------------------------begin");
        
        CGRect preFrame = self.layer.presentationLayer.frame;
        NSLog(@"preFrame : x = %f ,y = %f ,width = %f ,height = %f",preFrame.origin.x,preFrame.origin.y,preFrame.size.width,preFrame.size.height);
        
        CGRect modelFrame = self.layer.modelLayer.frame;
        NSLog(@"modelFrame : x = %f ,y = %f ,width = %f ,height = %f",modelFrame.origin.x,modelFrame.origin.y,modelFrame.size.width,modelFrame.size.height);
        
        CGRect selfFrame = self.layer.frame;
        NSLog(@"selfFrame : x = %f ,y = %f ,width = %f ,height = %f",selfFrame.origin.x,selfFrame.origin.y,selfFrame.size.width,selfFrame.size.height);
        
        NSLog(@"动画后----------------------------------------------------------end");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
