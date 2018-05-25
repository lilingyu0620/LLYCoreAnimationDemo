//
//  AVPlayerLayerViewController.m
//  LLYCoreAnimationDemo
//
//  Created by lly on 2018/5/25.
//  Copyright © 2018年 lly. All rights reserved.
//

#import "AVPlayerLayerViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface AVPlayerLayerViewController ()<AVAudioPlayerDelegate>

@property (weak, nonatomic) IBOutlet UIView *mView;

@property (nonatomic, strong) AVPlayer *player;

@property (nonatomic, strong) AVPlayerItem *playItem;

@property (nonatomic, strong) id observer;

@property (nonatomic, strong) AVPlayerLayer *avLayer;
@end

@implementation AVPlayerLayerViewController

- (void)dealloc{
    [self.playItem removeObserver:self forKeyPath:@"status"];
    [self.playItem removeObserver:self forKeyPath:@"loadedTimeRanges"];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"Ship" withExtension:@"mp4"];
    self.playItem = [AVPlayerItem playerItemWithURL:url];
    self.player = [AVPlayer playerWithPlayerItem:self.playItem];
    self.avLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    self.avLayer.frame = self.mView.bounds;
    [self.mView.layer addSublayer:self.avLayer];
    [self.player play];
    
//    CATransform3D transform = CATransform3DIdentity;
//    transform.m34 = -1.0 / 500.0;
//    transform = CATransform3DRotate(transform, M_PI_4, 1, 1, 0);
//    self.avLayer.transform = transform;
    
    self.avLayer.masksToBounds = YES;
    self.avLayer.cornerRadius = 20.0;
    self.avLayer.borderColor = [UIColor redColor].CGColor;
    self.avLayer.borderWidth = 5.0;
    
    CAAnimationGroup *group1 = [self animationGroup];
    [self.avLayer addAnimation:group1 forKey:@"group1"];

    
    [self.playItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];// 监听status属性
    [self.playItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];// 监听loadedTimeRanges属性

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moviePlayDidEnd:) name:AVPlayerItemDidPlayToEndTimeNotification object:self.playItem];
    
    //0.5秒查看一次播放时长
    self.observer = [self.player addPeriodicTimeObserverForInterval:CMTimeMake(1, 2) queue:NULL usingBlock:^(CMTime time) {
        CGFloat currentTime = CMTimeGetSeconds(time);
        NSLog(@"当前播放到 = %f 秒",currentTime);
    }];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    AVPlayerItem *playerItem = (AVPlayerItem *)object;
    if ([keyPath isEqualToString:@"status"]) {
        if ([playerItem status] == AVPlayerStatusReadyToPlay) {
            NSLog(@"AVPlayerStatusReadyToPlay");
            CGFloat totalSecond = CMTimeGetSeconds(playerItem.duration);
            NSLog(@"总时长 = %f",totalSecond);
        } else if ([playerItem status] == AVPlayerStatusFailed) {
            NSLog(@"AVPlayerStatusFailed");
        }
    } else if ([keyPath isEqualToString:@"loadedTimeRanges"]) {
//        NSTimeInterval timeInterval = [self availableDuration];// 计算缓冲进度
//        NSLog(@"当前视频加载时长:%f",timeInterval);
//        CGFloat totalDuration = CMTimeGetSeconds(self.playItem.duration);
//        NSLog(@"当前视频加载进度：%f",timeInterval/totalDuration);
    }
}

- (NSTimeInterval)availableDuration {
    NSArray *loadedTimeRanges = [[self.player currentItem] loadedTimeRanges];
    CMTimeRange timeRange = [loadedTimeRanges.firstObject CMTimeRangeValue];// 获取缓冲区域
    float startSeconds = CMTimeGetSeconds(timeRange.start);
    float durationSeconds = CMTimeGetSeconds(timeRange.duration);
    NSTimeInterval result = startSeconds + durationSeconds;// 计算缓冲总进度
    return result;
}

- (void)moviePlayDidEnd:(NSNotification *)notification{
    
    [self.player seekToTime:CMTimeMake(0, 1)];
    [self.player play];
    
}

- (CAAnimationGroup *)animationGroup{
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    
    CABasicAnimation *scaleAnim = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnim.fromValue = @0.1;
    scaleAnim.toValue = @1;
    scaleAnim.duration = 1;
    
    CABasicAnimation *opacityAni = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAni.fromValue = @1;
    opacityAni.toValue = @1;
    opacityAni.duration = 1;
    
    group.animations  = @[scaleAnim,opacityAni];
    group.duration = 1;
    group.repeatCount = HUGE_VALL;
    group.autoreverses = YES;
    
    return group;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
