//
//  CATiledLayerViewController.m
//  LLYCoreAnimationDemo
//
//  Created by lly on 2018/5/24.
//  Copyright © 2018年 lly. All rights reserved.
//

#import "CATiledLayerViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface CATiledLayerViewController ()<CALayerDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation CATiledLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    CATiledLayer *tileLayer = [CATiledLayer layer];
    tileLayer.frame = CGRectMake(0, 0, 2048, 2048);
    tileLayer.delegate = self;
    tileLayer.contentsScale = [UIScreen mainScreen].scale;
    [self.scrollView.layer addSublayer:tileLayer];
    
    self.scrollView.contentSize = tileLayer.frame.size;
    
    [tileLayer setNeedsDisplay];
}

- (void)drawLayer:(CATiledLayer *)layer inContext:(nonnull CGContextRef)ctx{

    CGRect bounds = CGContextGetClipBoundingBox(ctx);
    
    CGFloat scale = [UIScreen mainScreen].scale;
    
    NSInteger x = floor(bounds.origin.x / layer.tileSize.width * scale);
    NSInteger y = floor(bounds.origin.y / layer.tileSize.height * scale);
    
    NSLog(@"x = %ld,y = %ld",(long)x,(long)y);
    
    NSString *imageName = [NSString stringWithFormat:@"Snowman_%02li_%02li.jpg",(long)x,(long)y];
    UIImage *tileImage = [UIImage imageNamed:imageName];
    
    UIGraphicsPushContext(ctx);
    [tileImage drawInRect:bounds];
    UIGraphicsPopContext();
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
