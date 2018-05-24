//
//  MaskLayerViewController.m
//  LLYCoreAnimationDemo
//
//  Created by lly on 2018/5/24.
//  Copyright © 2018年 lly. All rights reserved.
//

#import "MaskLayerViewController.h"

@interface MaskLayerViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation MaskLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.imageView.layer.masksToBounds = YES;
    
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = self.imageView.bounds;
    maskLayer.cornerRadius = self.imageView.bounds.size.width/2;
    maskLayer.backgroundColor = [UIColor whiteColor].CGColor;
    self.imageView.layer.mask = maskLayer;
    
    CAAnimationGroup *group1 = [self animationGroup];
    [maskLayer addAnimation:group1 forKey:@"group1"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CAAnimationGroup *)animationGroup{
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    
    CABasicAnimation *scaleAnim = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnim.fromValue = @0;
    scaleAnim.toValue = @2;
    scaleAnim.duration = 1;
    
    CABasicAnimation *opacityAni = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAni.fromValue = @0.5;
    opacityAni.toValue = @1;
    opacityAni.duration = 1;
    
    group.animations  = @[scaleAnim,opacityAni];
    group.duration = 1;
    group.repeatCount = HUGE_VALL;
    group.autoreverses = YES;
    
    return group;
}


@end
