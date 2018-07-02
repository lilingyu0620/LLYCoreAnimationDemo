//
//  LLYViewController.m
//  LLYCoreAnimationDemo
//
//  Created by lly on 2018/5/24.
//  Copyright © 2018年 lly. All rights reserved.
//

#import "LLYViewController.h"
#import "CAReplicatorLayerViewController.h"
#import "CAGradientLayerViewController.h"
#import "MaskLayerViewController.h"
#import "CAShapeLayerViewController.h"
#import "CAScrollLayerViewController.h"
#import "CATiledLayerViewController.h"
#import "CAEmitterLayerViewController.h"
#import "AVPlayerLayerViewController.h"
#import "PresentationLayerViewController.h"
#import "CustomTransitionAnimationViewController.h"

#import "LLYBreatheAnimationVC.h"
#import "LLYLoadingAnimationVC.h"
#import "LLYPathAnimationVC.h"
#import "LLYSliceAnimationVC.h"
#import "LLYWaterDotAniamtionVC.h"

@interface LLYViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *titleArray;

@end

@implementation LLYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"Core Animation";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    self.titleArray = @[@"CAReplicatorLayer",@"CAGradientLayer",@"MaskLayer",@"LoadingAnimation",@"CAShapeLayer",@"CAScrollLayer",@"CATiledLayer",@"CAEmitterCell",@"AVPlayerLayer",@"PresentationLayer",@"CustomTransitionAnimation",@"BreatheAnimation",@"PathAnimation",@"SliceAnimation",@"WaterDotAniamtion"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - uitableview datasource/delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    cell.accessoryType= UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = self.titleArray[indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *titleStr = self.titleArray[indexPath.row];
    
    if ([titleStr isEqualToString:@"CAReplicatorLayer"]) {
        
        CAReplicatorLayerViewController *vc = [[CAReplicatorLayerViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if ([titleStr isEqualToString:@"CAGradientLayer"]){
        CAGradientLayerViewController *vc = [[CAGradientLayerViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if ([titleStr isEqualToString:@"MaskLayer"]){
        MaskLayerViewController *vc = [[MaskLayerViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if ([titleStr isEqualToString:@"CAShapeLayer"]){
        CAShapeLayerViewController *vc = [[CAShapeLayerViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if ([titleStr isEqualToString:@"CAScrollLayer"]){
        CAScrollLayerViewController *vc = [[CAScrollLayerViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if ([titleStr isEqualToString:@"CATiledLayer"]){
        CATiledLayerViewController *vc = [[CATiledLayerViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if ([titleStr isEqualToString:@"CAEmitterCell"]){
        CAEmitterLayerViewController *vc = [[CAEmitterLayerViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if ([titleStr isEqualToString:@"AVPlayerLayer"]){
        AVPlayerLayerViewController *vc = [[AVPlayerLayerViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if ([titleStr isEqualToString:@"PresentationLayer"]){
        PresentationLayerViewController *vc = [[PresentationLayerViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if ([titleStr isEqualToString:@"CustomTransitionAnimation"]){
        CustomTransitionAnimationViewController *vc = [[CustomTransitionAnimationViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if ([titleStr isEqualToString:@"BreatheAnimation"]){
        LLYBreatheAnimationVC *vc = [[LLYBreatheAnimationVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if ([titleStr isEqualToString:@"LoadingAnimation"]){
        LLYLoadingAnimationVC *vc = [[LLYLoadingAnimationVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if ([titleStr isEqualToString:@"PathAnimation"]){
        LLYPathAnimationVC *vc = [[LLYPathAnimationVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if ([titleStr isEqualToString:@"SliceAnimation"]){
        LLYSliceAnimationVC *vc = [[LLYSliceAnimationVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if ([titleStr isEqualToString:@"WaterDotAniamtion"]){
        LLYWaterDotAniamtionVC *vc = [[LLYWaterDotAniamtionVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}


@end
