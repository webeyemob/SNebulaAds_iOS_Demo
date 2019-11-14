//
//  RewardedVideoTestViewController.m
//  iOS_AutoTest
//
//  Created by TaurusXAd on 2019/10/16.
//  Copyright © 2019 we. All rights reserved.
//

#import "RewardedVideoTestViewController.h"
@import TaurusXAds;
#import "Masonry.h"
#import "macro.h"
#import "UIView+Toast.h"

@interface RewardedVideoTestViewController () <TXADRewardedVideoAdDelegate>

@property (nonatomic, strong) TXADRewardedVideoAd *rewardAd;
@property (nonatomic, strong) UIButton *showRewardBtn;

@end

@implementation RewardedVideoTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    // Do any additional setup after loading the view.
    
    UIView *header = [[UIView alloc] init];
    header.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:header];
    [header mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(kTopBarSafeHeight);
        make.bottom.equalTo(self.view.mas_top).offset(kTopBarSafeHeight+20);
    }];
    
    UILabel *titleLab =  [[UILabel alloc]init];
    titleLab.text = self.titleStr;
    [titleLab setTextAlignment:NSTextAlignmentCenter];
    [header addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(header);
        make.width.equalTo(@(250));
    }];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [header addSubview:backBtn];
    
    [backBtn addTarget:self action:@selector(closePage) forControlEvents:UIControlEventTouchUpInside];
    [backBtn setTitle:@"back" forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(header).offset(-20);
        make.centerY.equalTo(header);
        make.width.equalTo(@(50));
    }];
    
    UIButton *loadRewardBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loadRewardBtn.frame = CGRectMake(20, kTopBarSafeHeight+50, 150, 30);
    [self.view addSubview:loadRewardBtn];
    [loadRewardBtn setTitle:@"load Reward" forState:UIControlStateNormal];
    //[loadRewardBtn setBackgroundColor:[UIColor blueColor]];
    [loadRewardBtn setTitleColor:[UIColor colorWithRed:28.0/255.0 green:147.0/255.0 blue:243.0/255.0 alpha:1.0]  forState:UIControlStateNormal];
    [loadRewardBtn setTitleColor:[UIColor colorWithRed:135.0/255.0 green:216.0/255.0 blue:80.0/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [loadRewardBtn setTitleColor:[UIColor lightGrayColor]  forState:UIControlStateDisabled];
    [loadRewardBtn addTarget:self action:@selector(loadReward) forControlEvents:UIControlEventTouchUpInside];
    
    CGFloat left = ScreenWidth - 150 - 20;
    UIButton *rewardShowBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rewardShowBtn.frame = CGRectMake(left, kTopBarSafeHeight+50, 150, 30);
    [self.view addSubview:rewardShowBtn];
    [rewardShowBtn setTitle:@"show Reward" forState:UIControlStateNormal];
    //[rewardShowBtn setBackgroundColor:[UIColor blueColor]];
    [rewardShowBtn setTitleColor:[UIColor colorWithRed:28.0/255.0 green:147.0/255.0 blue:243.0/255.0 alpha:1.0]  forState:UIControlStateNormal];
    [rewardShowBtn setTitleColor:[UIColor colorWithRed:135.0/255.0 green:216.0/255.0 blue:80.0/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [rewardShowBtn setTitleColor:[UIColor lightGrayColor]  forState:UIControlStateDisabled];
    [rewardShowBtn addTarget:self action:@selector(showReward) forControlEvents:UIControlEventTouchUpInside];
    self.showRewardBtn = rewardShowBtn;
    self.showRewardBtn.enabled = NO;
}

- (void) closePage {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)loadReward {
    self.rewardAd = [[TXADRewardedVideoAd alloc] initWithAdUnitId:self.adUnitID];
    self.rewardAd.delegate = self;
    [self.rewardAd loadAd];
}

- (void)showReward {
    if (self.rewardAd.isReady) {
        [self.rewardAd showFromViewController:self];
    }
}

- (void)txAdRewardedVideoDidReceiveAd:(TXADRewardedVideoAd *)rewardedVideoAd {
    NSLog(@"txAdRewardedVideoDidReceiveAd, adUnitId is %@", rewardedVideoAd.adUnitId);
    self.showRewardBtn.enabled = YES;
}

- (void)txAdRewardedVideo:(TXADRewardedVideoAd *)rewardedVideoAd didFailToReceiveAdWithError:(TXADAdError *)adError {
    NSLog(@"didFailToReceiveAdWithError %d",(int)[adError getCode]);
    [self.view makeToast:@"load failed" duration:3.0 position:CSToastPositionCenter];
}

- (void)txAdRewardedVideoDidOpen:(TXADRewardedVideoAd *)rewardedVideoAd {
    NSLog(@"txAdRewardedVideoDidOpen, adUnitId is %@", rewardedVideoAd.adUnitId);
}

- (void)txAdRewardedVideoWillLeaveApplication:(TXADRewardedVideoAd *)rewardedVideoAd {
    NSLog(@"txAdRewardedVideoWillLeaveApplication, adUnitId is %@", rewardedVideoAd.adUnitId);
}

- (void)txAdRewardedVideoDidStart:(TXADRewardedVideoAd *)rewardedVideoAd {
    NSLog(@"txAdRewardedVideoDidStart, adUnitId is %@", rewardedVideoAd.adUnitId);
}

- (void)txAdRewardedVideoDidComplete:(TXADRewardedVideoAd *)rewardedVideoAd {
    NSLog(@"txAdRewardedVideoDidComplete, adUnitId is %@", rewardedVideoAd.adUnitId);
}

- (void)txAdRewardedVideoDidClose:(TXADRewardedVideoAd *)rewardedVideoAd{
    NSLog(@"txAdRewardedVideoDidClose, adUnitId is %@", rewardedVideoAd.adUnitId);
    self.showRewardBtn.enabled = NO;
}

- (void)txAdRewardedVideo:(TXADRewardedVideoAd *)rewardedVideoAd didReward:(TXADRewardItem *)item {
    NSLog(@"txAdRewardedVideo didReward, adUnitId is %@, RewardItem is: %@", rewardedVideoAd.adUnitId, item);
}

- (void)txAdRewardedVideoDidFailedToReward:(TXADRewardedVideoAd *)rewardedVideoAd {
    NSLog(@"txAdRewardedVideoDidFailedToReward, adUnitId is %@", rewardedVideoAd.adUnitId);
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
