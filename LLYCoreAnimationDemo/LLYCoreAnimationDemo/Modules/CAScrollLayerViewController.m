//
//  CAScrollLayerViewController.m
//  LLYCoreAnimationDemo
//
//  Created by lly on 2018/5/24.
//  Copyright © 2018年 lly. All rights reserved.
//

#import "CAScrollLayerViewController.h"

@interface CAScrollLayerViewController ()

@property (weak, nonatomic) IBOutlet UIView *mView;

@property (nonatomic, strong) CAScrollLayer *scrollLayer;

@property (nonatomic, strong) CALayer *imgLayer;

@end

@implementation CAScrollLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.scrollLayer = [CAScrollLayer layer];
    self.scrollLayer.frame = self.mView.bounds;
    self.scrollLayer.scrollMode = kCAScrollBoth;
    [self.mView.layer addSublayer:self.scrollLayer];
    
    self.imgLayer = [CALayer layer];
    self.imgLayer.contents = (__bridge id)[UIImage imageNamed:@"wk.jpg"].CGImage;
    self.imgLayer.contentsGravity = kCAGravityCenter;
    self.imgLayer.frame = CGRectMake(0, 0, 320, 480);
    
    [self.scrollLayer addSublayer:self.imgLayer];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    [self.view addGestureRecognizer:pan];
    
    offset = self.scrollLayer.bounds.origin;

}


static CGPoint offset;

- (void)pan:(UIPanGestureRecognizer *)gesture{
    
    CGPoint translation = [gesture translationInView:self.view];
    
    offset.x -= translation.x;
    offset.y -= translation.y;
    
    NSLog(@"offset x = %.2f y = %.2f",offset.x,offset.y);
    
    [self.scrollLayer scrollToPoint:offset];
    
    [gesture setTranslation:CGPointZero inView:self.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
