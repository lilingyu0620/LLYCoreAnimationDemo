//
//  LLYBreatheAnimationVC.m
//  LLYCAShapeLayer
//
//  Created by lly on 2017/4/16.
//  Copyright © 2017年 lly. All rights reserved.
//

#import "LLYBreatheAnimationVC.h"

@interface LLYBreatheAnimationVC ()

@end

@implementation LLYBreatheAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"呼吸灯效果";
    
    [self addBreatheAnimation];
}


- (void)addBreatheAnimation{

    CAShapeLayer *layer1 = [CAShapeLayer layer];
    layer1.frame = CGRectMake(0, 0, 200,200);
    layer1.position = CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2);
    layer1.cornerRadius = 100;
    layer1.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:layer1];
    
    CAAnimationGroup *group1 = [self animationGroup];
    [layer1 addAnimation:group1 forKey:@"group1"];
    
    CAShapeLayer *layer2 = [CAShapeLayer layer];
    layer2.frame = CGRectMake(0, 0, 200,200);
    layer2.position = CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2);
    layer2.cornerRadius = 100;
    layer2.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:layer2];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        CAAnimationGroup *group2 = [self animationGroup];
        [layer2 addAnimation:group2 forKey:@"group2"];
    });

}


- (CAAnimationGroup *)animationGroup{

    CAAnimationGroup *group = [CAAnimationGroup animation];
    
    CABasicAnimation *scaleAnim = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnim.fromValue = @1;
    scaleAnim.toValue = @2;
    scaleAnim.duration = 2;
    
    CABasicAnimation *opacityAni = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAni.fromValue = @1;
    opacityAni.toValue = @0;
    opacityAni.duration = 2;
    
    group.animations  = @[scaleAnim,opacityAni];
    group.duration = 2;
    group.repeatCount = HUGE_VALL;
    group.autoreverses = NO;
    
    return group;
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
