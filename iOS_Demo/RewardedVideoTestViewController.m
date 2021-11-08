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

@property (nonatomic, strong) UITextField *sceneText;

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
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = [UIColor grayColor];
    [self.view addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(header.mas_bottom).offset(1);
        make.height.equalTo(@1);
    }];
       
    
    UIButton *loadRewardBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:loadRewardBtn];
    [loadRewardBtn setTitle:@"load" forState:UIControlStateNormal];
    //[loadRewardBtn setBackgroundColor:[UIColor blueColor]];
    [loadRewardBtn setTitleColor:[UIColor colorWithRed:28.0/255.0 green:147.0/255.0 blue:243.0/255.0 alpha:1.0]  forState:UIControlStateNormal];
    [loadRewardBtn setTitleColor:[UIColor colorWithRed:135.0/255.0 green:216.0/255.0 blue:80.0/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [loadRewardBtn setTitleColor:[UIColor lightGrayColor]  forState:UIControlStateDisabled];
    [loadRewardBtn addTarget:self action:@selector(loadReward) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *rewardShowBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:rewardShowBtn];
    [rewardShowBtn setTitle:@"show" forState:UIControlStateNormal];
    //[rewardShowBtn setBackgroundColor:[UIColor blueColor]];
    [rewardShowBtn setTitleColor:[UIColor colorWithRed:28.0/255.0 green:147.0/255.0 blue:243.0/255.0 alpha:1.0]  forState:UIControlStateNormal];
    [rewardShowBtn setTitleColor:[UIColor colorWithRed:135.0/255.0 green:216.0/255.0 blue:80.0/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [rewardShowBtn setTitleColor:[UIColor lightGrayColor]  forState:UIControlStateDisabled];
    [rewardShowBtn addTarget:self action:@selector(showReward) forControlEvents:UIControlEventTouchUpInside];
    self.showRewardBtn = rewardShowBtn;
    self.showRewardBtn.enabled = NO;
    
    [loadRewardBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(header.mas_bottom).offset(10);
        make.left.equalTo(self.view).offset(30);
        make.width.equalTo(@(100));
        make.height.equalTo(@(20));
    }];
    
    [rewardShowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(header.mas_bottom).offset(10);
        make.right.equalTo(self.view).offset(-30);
        make.width.equalTo(@(100));
        make.height.equalTo(@(20));
    }];
    
    UILabel *sceneId = [[UILabel alloc] init];
    sceneId.text = @"scene id: ";
    [self.view addSubview:sceneId];
        
    [sceneId mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(rewardShowBtn.mas_bottom).offset(50);
        make.left.equalTo(self.view).offset(20);
        make.width.equalTo(@(100));
        make.height.equalTo(@(40));
    }];
    
    UITextField *textField1 = [[UITextField alloc]init];
    [self.view addSubview:textField1];
    textField1.borderStyle = UITextBorderStyleRoundedRect;

    self.sceneText = textField1;
        
    [textField1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(sceneId);
        make.left.equalTo(sceneId.mas_right).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.height.equalTo(@(40));
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void) closePage {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)loadReward {
    if (!useAdLoader) {
        if (self.rewardAd == nil) {
            self.rewardAd = [[TXADRewardedVideoAd alloc] initWithAdUnitId:self.adUnitID];
            self.rewardAd.delegate = self;
        }
        [self.rewardAd loadAd];
        [self.rewardAd enterAdScene:@"loadRewardAd"];
    } else {
        TXADRewardedVideoAd *ad = [TXADAdLoader getRewardedVideoAd:self.adUnitID];
        ad.delegate = self;
        [TXADAdLoader loadRewardedVideoAd:self.adUnitID];
    }
}

- (void)showReward {
    if (!useAdLoader) {
        if ([self.rewardAd isReady:@"loadRewardAd"]) {
            [self.rewardAd showFromViewController:self sceneId:self.sceneText.text];
        }
    } else {
       if ([TXADAdLoader isRewardedVideoAdReady:self.adUnitID]) {
            [TXADAdLoader showRewardedVideoAd:self.adUnitID viewController:self sceneId:self.sceneText.text];
        }
    }
}

- (void)txAdRewardedVideo:(TXADRewardedVideoAd *)rewardedVideoAd didReceiveAd:(TXADILineItem *)lineItem {
    NSLog(@"txAdRewardedVideoDidReceiveAd, adUnitId is %@", rewardedVideoAd.adUnitId);
    self.showRewardBtn.enabled = YES;
    
    TXADSecondaryLineItem *secLineItem = [lineItem getSecondaryLineItem];
    if (secLineItem != nil) {
        NSLog(@"txAdRewardedVideoDidReceiveAd+++++++secondary Line: %@", [secLineItem description]);
    }
}

- (void)txAdRewardedVideo:(TXADRewardedVideoAd *)rewardedVideoAd didFailToReceiveAdWithError:(TXADAdError *)adError {
    NSLog(@"didFailToReceiveAdWithError %d",(int)[adError getCode]);
    [self.view makeToast:@"load failed" duration:3.0 position:CSToastPositionCenter];
}

- (void)txAdRewardedVideo:(TXADRewardedVideoAd *)rewardedVideoAd didOpen:(TXADILineItem *)lineItem {
    NSLog(@"txAdRewardedVideoDidOpen, adUnitId is %@", rewardedVideoAd.adUnitId);
}

- (void)txAdRewardedVideo:(TXADRewardedVideoAd *)rewardedVideoAd willLeaveApplication:(TXADILineItem *)lineItem {
    NSLog(@"txAdRewardedVideoWillLeaveApplication, adUnitId is %@", rewardedVideoAd.adUnitId);
}

- (void)txAdRewardedVideo:(TXADRewardedVideoAd *)rewardedVideoAd didStart:(TXADILineItem *)lineItem {
    NSLog(@"txAdRewardedVideoDidStart, adUnitId is %@", rewardedVideoAd.adUnitId);
}

- (void)txAdRewardedVideo:(TXADRewardedVideoAd *)rewardedVideoAd didComplete:(TXADILineItem *)lineItem {
    NSLog(@"txAdRewardedVideoDidComplete, adUnitId is %@", rewardedVideoAd.adUnitId);
}

- (void)txAdRewardedVideo:(TXADRewardedVideoAd *)rewardedVideoAd didClose:(TXADILineItem *)lineItem {
    NSLog(@"txAdRewardedVideoDidClose, adUnitId is %@, TId:%@", rewardedVideoAd.adUnitId,[lineItem getTId]);
    self.showRewardBtn.enabled = NO;
}

- (void)txAdRewardedVideo:(TXADRewardedVideoAd *)rewardedVideoAd didReward:(TXADILineItem *)lineItem item:(TXADRewardItem *)item {
    NSLog(@"txAdRewardedVideo didReward, adUnitId is %@, RewardItem is: %@, TId: %@", rewardedVideoAd.adUnitId, item, [lineItem getTId]);
}

- (void)txAdRewardedVideo:(TXADRewardedVideoAd *)rewardedVideoAd didFailedToReward:(TXADILineItem *)lineItem {
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
