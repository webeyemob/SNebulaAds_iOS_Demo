//
//  InterstitialTestViewController.m
//  iOS_AutoTest
//
//  Created by TaurusXAd on 2019/10/16.
//  Copyright © 2019 we. All rights reserved.
//

#import "InterstitialTestViewController.h"
@import TaurusXAds;
#import "Masonry.h"
#import "macro.h"
#import "UIView+Toast.h"
#import <TaurusXAdMediation_GDT/TaurusXAdMediation_GDT.h>

@interface InterstitialTestViewController () <TXADInterstitialAdDelegate>

@property (nonatomic, strong) TXADInterstitialAd *interstitalAd;
@property (nonatomic, strong) UIButton *showIntBtn;

@end

@implementation InterstitialTestViewController

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
    
    UIButton *testloadIntBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    testloadIntBtn.frame = CGRectMake(20, kTopBarSafeHeight+50, 150, 30);
    [self.view addSubview:testloadIntBtn];
    [testloadIntBtn setTitle:@"load Intersitial" forState:UIControlStateNormal];
    //[testloadIntBtn setBackgroundColor:[UIColor blueColor]];
    [testloadIntBtn setTitleColor:[UIColor colorWithRed:28.0/255.0 green:147.0/255.0 blue:243.0/255.0 alpha:1.0]  forState:UIControlStateNormal];
    [testloadIntBtn setTitleColor:[UIColor colorWithRed:135.0/255.0 green:216.0/255.0 blue:80.0/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [testloadIntBtn setTitleColor:[UIColor lightGrayColor]  forState:UIControlStateDisabled];
    [testloadIntBtn addTarget:self action:@selector(loadInteristial) forControlEvents:UIControlEventTouchUpInside];
    
    CGFloat left = ScreenWidth - 150 - 20;
    UIButton *testshowIntBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    testshowIntBtn.frame = CGRectMake(left, kTopBarSafeHeight+50, 150, 30);
    [self.view addSubview:testshowIntBtn];
    [testshowIntBtn setTitle:@"show Intersitial" forState:UIControlStateNormal];
    //[testshowIntBtn setBackgroundColor:[UIColor blueColor]];
    [testshowIntBtn setTitleColor:[UIColor colorWithRed:28.0/255.0 green:147.0/255.0 blue:243.0/255.0 alpha:1.0]  forState:UIControlStateNormal];
    [testshowIntBtn setTitleColor:[UIColor colorWithRed:135.0/255.0 green:216.0/255.0 blue:80.0/255.0 alpha:1.0] forState:UIControlStateHighlighted];
     [testshowIntBtn setTitleColor:[UIColor lightGrayColor]  forState:UIControlStateDisabled];
    [testshowIntBtn addTarget:self action:@selector(showInterstitial) forControlEvents:UIControlEventTouchUpInside];
    testshowIntBtn.enabled = NO;
    self.showIntBtn = testshowIntBtn;
}

- (void) closePage {
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma  mark intersitial
- (void) loadInteristial {
    TXADNetworkConfigs *configs = [[TXADNetworkConfigs alloc] init];
    
    TXADGDTInterstitial2_0Config *config = [[TXADGDTInterstitial2_0Config alloc] init];
    config.maxVideoDuration = 70;
    [configs addConfig:config];
    
    
    self.interstitalAd = [[TXADInterstitialAd alloc] initWithAdUnitId:self.adUnitID];
    
    [self.interstitalAd setNetworkConfigs:configs];
    self.interstitalAd.delegate = self;
    [self.interstitalAd loadAd];
}

- (void)showInterstitial {
    if (self.interstitalAd.isReady)
    {
        [self.interstitalAd showFromViewController:self];
    }
}

#pragma mark <WECreativeInterstitialDelegate>
- (void)txAdInterstitialDidReceiveAd:(TXADInterstitialAd *)interstitialAd {
    NSLog(@"TXADInterstitialAd txAdInterstitialDidReceiveAd, interstitialAd.adUnitId is %@", interstitialAd.adUnitId);
    self.showIntBtn.enabled = YES;
}

- (void)txAdInterstitial:(TXADInterstitialAd *)interstitialAd didFailToReceiveAdWithError:(TXADAdError *)adError{
    NSLog(@"TXADInterstitialAd didFailToReceiveAdWithError %d", (int)[adError getCode]);
    [self.view makeToast:@"load failed" duration:3.0 position:CSToastPositionCenter];
}

- (void)txAdInterstitialWillPresentScreen:(TXADInterstitialAd *)interstitialAd {
    NSLog(@"TXADInterstitialAd txAdInterstitialWillPresentScreen, interstitialAd adUnitId is %@", interstitialAd.adUnitId);
}

- (void)txAdInterstitialDidDismissScreen:(TXADInterstitialAd *)interstitialAd {
    NSLog(@"TXADInterstitialAd txAdInterstitialDidDismissScreen, interstitialAd adUnitId is %@", interstitialAd.adUnitId);
    self.showIntBtn.enabled = NO;
}

- (void)txAdInterstitialWillLeaveApplication:(TXADInterstitialAd *)interstitialAd {
    NSLog(@"TXADInterstitialAd txAdInterstitialWillLeaveApplication, interstitialAd adUnitId is %@", interstitialAd.adUnitId);
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
