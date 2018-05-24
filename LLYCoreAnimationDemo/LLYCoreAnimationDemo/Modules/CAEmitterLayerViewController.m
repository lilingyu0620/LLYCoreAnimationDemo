//
//  CAEmitterLayerViewController.m
//  LLYCoreAnimationDemo
//
//  Created by lly on 2018/5/24.
//  Copyright © 2018年 lly. All rights reserved.
//

#import "CAEmitterLayerViewController.h"

@interface CAEmitterLayerViewController ()

@property (weak, nonatomic) IBOutlet UIView *mView;

@end

@implementation CAEmitterLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    CAEmitterLayer *emiLayer = [CAEmitterLayer layer];
    emiLayer.frame = self.mView.bounds;
    [self.mView.layer addSublayer:emiLayer];
    
    
    emiLayer.renderMode = kCAEmitterLayerAdditive;
    emiLayer.emitterPosition = CGPointMake(emiLayer.frame.size.width/2, emiLayer.frame.size.height/2);
    
    
    CAEmitterCell *cell = [[CAEmitterCell alloc]init];
    cell.contents = (__bridge id)[UIImage imageNamed:@"Spark.png"].CGImage;
    //The number of emitted objects created every second
    cell.birthRate = 150;
    //The lifetime of each emitted object in seconds
    cell.lifetime = 5.0;
    cell.color = [UIColor colorWithRed:0.5 green:0.5 blue:1 alpha:1].CGColor;
    //alpha的速度
    cell.alphaSpeed = -0.4;
    cell.velocity = 50;
    cell.velocityRange = 50;
    //发射范围，这里是360度发射
    cell.emissionRange = M_PI * 2;
    
    emiLayer.emitterCells = @[cell];
    
//    CAAnimationGroup *group1 = [self animationGroup];
//    [emiLayer addAnimation:group1 forKey:@"group1"];
    
}

- (CAAnimationGroup *)animationGroup{
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    
    CABasicAnimation *scaleAnim = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnim.fromValue = @0.5;
    scaleAnim.toValue = @1;
    scaleAnim.duration = 1;
    
    CABasicAnimation *opacityAni = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAni.fromValue = @0.1;
    opacityAni.toValue = @1;
    opacityAni.duration = 1;
    
    group.animations  = @[scaleAnim,opacityAni];
    group.duration = 1;
    group.repeatCount = HUGE_VALL;
    group.autoreverses = NO;
    
    return group;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
