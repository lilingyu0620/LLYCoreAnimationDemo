//
//  LLYSliceAnimationVC.m
//  LLYCAShapeLayer
//
//  Created by lly on 2017/4/18.
//  Copyright © 2017年 lly. All rights reserved.
//

#import "LLYSliceAnimationVC.h"

@interface LLYSliceAnimationVC ()

@property (nonatomic,strong) CADisplayLink *link;
@property (nonatomic,assign) CGFloat angle;
@property (nonatomic,strong) CAShapeLayer *sliceLayer;

@end

@implementation LLYSliceAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor whiteColor];
    [self addSliceLoadingAnimation];

//    self.angle = 0;
//    self.link = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateSlice)];
//    self.link.paused = NO;
//    [self.link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}



//- (void)updateSlice{
//
//    NSLog(@"1111");
//    self.angle += 1/(M_PI*100);
//    
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    [path moveToPoint:CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2)];
//    [path addArcWithCenter:CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2) radius:100 startAngle:0 endAngle:self.angle clockwise:YES];
//    self.sliceLayer.path = path.CGPath;
//    
//    if (self.angle >= M_PI *2) {
//        self.angle = 0;
//    }
//    
//}


- (void)addSliceLoadingAnimation{

    self.sliceLayer = [CAShapeLayer layer];
    
    UIBezierPath *path = [UIBezierPath bezierPath];

    [path addArcWithCenter:CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2) radius:100 startAngle:0 endAngle:2*M_PI clockwise:YES];
    self.sliceLayer.strokeColor = [UIColor redColor].CGColor;
    self.sliceLayer.fillColor = [UIColor clearColor].CGColor;
    self.sliceLayer.path = path.CGPath;
    self.sliceLayer.lineWidth = 200;
    self.sliceLayer.lineCap = kCALineCapButt;
    [self.view.layer addSublayer:_sliceLayer];

    CABasicAnimation *strokeAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    strokeAnimation.duration = 4;
    strokeAnimation.fromValue = @0;
    strokeAnimation.toValue = @1;
    strokeAnimation.repeatCount = HUGE_VALF;
    [_sliceLayer addAnimation:strokeAnimation forKey:@"slice1"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
