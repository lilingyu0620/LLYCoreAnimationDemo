//
//  CAReplicatorLayerViewController.m
//  LLYCoreAnimationDemo
//
//  Created by lly on 2018/5/24.
//  Copyright © 2018年 lly. All rights reserved.
//

#import "CAReplicatorLayerViewController.h"

@interface CAReplicatorLayerViewController ()
@property (weak, nonatomic) IBOutlet UIView *mView;

@end

@implementation CAReplicatorLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"CAReplicatorLayer";
    
    CAReplicatorLayer *repLayer = [CAReplicatorLayer layer];
    repLayer.frame = self.mView.bounds;
    [self.mView.layer addSublayer:repLayer];
    
    //将需要反射的内容加到CAReplicatorLayer上面
    CALayer *layer = [CALayer layer];
    layer.frame = self.mView.bounds;
    layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"wk.jpg"].CGImage);
    layer.contentsGravity = kCAGravityResizeAspectFill;
    layer.masksToBounds = YES;
    [repLayer addSublayer:layer];
    
    //反射视图的数量
    repLayer.instanceCount = 2;
    
    CATransform3D transform = CATransform3DIdentity;
    CGFloat verticalOffset = self.mView.bounds.size.height + 2;
    transform = CATransform3DTranslate(transform, 0, verticalOffset, 0);
//    transform = CATransform3DScale(transform, 1, -1, 0);
    transform = CATransform3DRotate(transform, M_PI, 1, 0, 0);
    
    repLayer.instanceTransform = transform;
    
    repLayer.instanceAlphaOffset = -0.6;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
