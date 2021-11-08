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

@property (nonatomic, strong) UITextField *sceneText;

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
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = [UIColor grayColor];
    [self.view addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(header.mas_bottom).offset(1);
        make.height.equalTo(@1);
    }];
       
    
    UIButton *testloadIntBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:testloadIntBtn];
    [testloadIntBtn setTitle:@"load" forState:UIControlStateNormal];
    //[testloadIntBtn setBackgroundColor:[UIColor blueColor]];
    [testloadIntBtn setTitleColor:[UIColor colorWithRed:28.0/255.0 green:147.0/255.0 blue:243.0/255.0 alpha:1.0]  forState:UIControlStateNormal];
    [testloadIntBtn setTitleColor:[UIColor colorWithRed:135.0/255.0 green:216.0/255.0 blue:80.0/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [testloadIntBtn setTitleColor:[UIColor lightGrayColor]  forState:UIControlStateDisabled];
    [testloadIntBtn addTarget:self action:@selector(loadInteristial) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *testshowIntBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:testshowIntBtn];
    [testshowIntBtn setTitle:@"show" forState:UIControlStateNormal];
    //[testshowIntBtn setBackgroundColor:[UIColor blueColor]];
    [testshowIntBtn setTitleColor:[UIColor colorWithRed:28.0/255.0 green:147.0/255.0 blue:243.0/255.0 alpha:1.0]  forState:UIControlStateNormal];
    [testshowIntBtn setTitleColor:[UIColor colorWithRed:135.0/255.0 green:216.0/255.0 blue:80.0/255.0 alpha:1.0] forState:UIControlStateHighlighted];
     [testshowIntBtn setTitleColor:[UIColor lightGrayColor]  forState:UIControlStateDisabled];
    [testshowIntBtn addTarget:self action:@selector(showInterstitial) forControlEvents:UIControlEventTouchUpInside];
    testshowIntBtn.enabled = NO;
    self.showIntBtn = testshowIntBtn;
    
    [testloadIntBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(header.mas_bottom).offset(10);
        make.left.equalTo(self.view).offset(30);
        make.width.equalTo(@(100));
        make.height.equalTo(@(20));
    }];
    
    [testshowIntBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(header.mas_bottom).offset(10);
        make.right.equalTo(self.view).offset(-30);
        make.width.equalTo(@(100));
        make.height.equalTo(@(20));
    }];
    
    UILabel *sceneId = [[UILabel alloc] init];
    sceneId.text = @"scene id: ";
    [self.view addSubview:sceneId];
        
    [sceneId mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(testshowIntBtn.mas_bottom).offset(50);
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

- (void) createInterstitial {
    TXADNetworkConfigs *configs = [[TXADNetworkConfigs alloc] init];
    
    TXADGDTInterstitial2_0Config *config = [[TXADGDTInterstitial2_0Config alloc] init];
    config.maxVideoDuration = 70;
    [configs addConfig:config];
    
    
    self.interstitalAd = [[TXADInterstitialAd alloc] initWithAdUnitId:self.adUnitID];
    
    [self.interstitalAd setNetworkConfigs:configs];
    self.interstitalAd.delegate = self;
}

#pragma  mark intersitial
- (void) loadInteristial {
    if (!useAdLoader) {
        if (self.interstitalAd == nil) {
            [self createInterstitial];
        }
        [self.interstitalAd loadAd];
        [self.interstitalAd enterAdScene:@"loadInterstitial"];
    } else {
        TXADInterstitialAd *ad = [TXADAdLoader getInterstitialAd:self.adUnitID];
        ad.delegate = self;
        [TXADAdLoader loadInterstitialAd:self.adUnitID];
    }
}

- (void)showInterstitial {
    if (!useAdLoader) {
        if ([self.interstitalAd isReady:@"load interstitial"])
        {
            [self.interstitalAd showFromViewController:self sceneId:self.sceneText.text];
        }
    } else {
        if ([TXADAdLoader isInterstitialAdReady:self.adUnitID]) {
            [TXADAdLoader showInterstitialAd:self.adUnitID viewController:self sceneId: self.sceneText.text];
        }
    }
}

#pragma mark <TXADInterstitialAdDelegate>
- (void)txAdInterstitial:(TXADInterstitialAd *)interstitialAd didReceiveAd:(TXADILineItem *)lineItem{
    NSLog(@"TXADInterstitialAd txAdInterstitialDidReceiveAd, interstitialAd.adUnitId is %@", interstitialAd.adUnitId);
    self.showIntBtn.enabled = YES;
    
    TXADSecondaryLineItem *secLineItem = [lineItem getSecondaryLineItem];
    if (secLineItem != nil) {
        NSLog(@"TXADInterstitialAd txAdInterstitialDidReceiveAd, +++++++secondary Line: %@", [secLineItem description]);
    }
}

- (void)txAdInterstitial:(TXADInterstitialAd *)interstitialAd didFailToReceiveAdWithError:(TXADAdError *)adError{
    NSLog(@"TXADInterstitialAd didFailToReceiveAdWithError %d", (int)[adError getCode]);
    [self.view makeToast:@"load failed" duration:3.0 position:CSToastPositionCenter];
}

- (void)txAdInterstitial:(TXADInterstitialAd *)interstitialAd willPresentScreen:(TXADILineItem *)lineItem{
    NSLog(@"TXADInterstitialAd txAdInterstitialWillPresentScreen, interstitialAd adUnitId is %@", interstitialAd.adUnitId);
    
    TXADSecondaryLineItem *secLineItem = [lineItem getSecondaryLineItem];
    if (secLineItem != nil) {
        NSLog(@"TXADInterstitialAd txAdInterstitialWillPresentScreen, +++++++secondary Line: %@", [secLineItem description]);
    }
}

- (void)txAdInterstitial:(TXADInterstitialAd *)interstitialAd didDismissScreen:(TXADILineItem *)lineItem{
    NSLog(@"TXADInterstitialAd txAdInterstitialDidDismissScreen, interstitialAd adUnitId is %@", interstitialAd.adUnitId);
    self.showIntBtn.enabled = NO;
    
    TXADSecondaryLineItem *secLineItem = [lineItem getSecondaryLineItem];
    if (secLineItem != nil) {
        NSLog(@"TXADInterstitialAd txAdInterstitialDidDismissScreen, +++++++secondary Line: %@", [secLineItem description]);
    }
}

- (void)txAdInterstitial:(TXADInterstitialAd *)interstitialAd willLeaveApplication:(TXADILineItem *)lineItem{
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
