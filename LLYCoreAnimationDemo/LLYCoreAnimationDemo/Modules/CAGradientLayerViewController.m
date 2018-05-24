//
//  CAGradientLayerViewController.m
//  LLYCoreAnimationDemo
//
//  Created by lly on 2018/5/24.
//  Copyright © 2018年 lly. All rights reserved.
//

#import "CAGradientLayerViewController.h"

@interface CAGradientLayerViewController ()

@property (weak, nonatomic) IBOutlet UIView *mView;

@end

@implementation CAGradientLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    CAGradientLayer *graLayer = [CAGradientLayer layer];
    graLayer.frame = self.mView.bounds;
    [self.mView.layer addSublayer:graLayer];
    
    graLayer.colors = @[(__bridge id)[UIColor redColor].CGColor,(__bridge id)[UIColor greenColor].CGColor,(__bridge id)[UIColor blueColor].CGColor];
    graLayer.startPoint = CGPointMake(0, 0);
    graLayer.endPoint = CGPointMake(1, 1);
    
    graLayer.locations = @[@0,@0.5,@1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
