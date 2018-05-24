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
    self.titleArray = @[@"CAReplicatorLayer",@"CAGradientLayer",@"MaskLayer",@"CAShapeLayer",@"CAScrollLayer",@"CATiledLayer"];

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
    
}


@end
