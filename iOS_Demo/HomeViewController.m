//
//  HomeViewController.m
//  AdLime_iOS_AutoTest
//
//  Created by TaurusXAd on 2019/9/27.
//  Copyright © 2019 we. All rights reserved.
//

#import "HomeViewController.h"
#import "macro.h"
#import <Masonry.h>
#import "LoadModelViewController.h"
#import "NetworkTestViewController.h"
#import "AdTypeViewController.h"
@import TaurusXAds;
@import FLInSight;


@interface HomeViewController () <TXADTrackerDelegate>

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.modalPresentationStyle = 0;
    
    UIButton *testBaseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.view addSubview:testBaseBtn];
    [testBaseBtn setTitle:@"Basic Test" forState:UIControlStateNormal];
    [testBaseBtn setTitleColor:[UIColor colorWithRed:28.0/255.0 green:147.0/255.0 blue:243.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    [testBaseBtn setTitleColor:[UIColor colorWithRed:135.0/255.0 green:216.0/255.0 blue:80.0/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [testBaseBtn addTarget:self action:@selector(testBase) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *testNetworkBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.view addSubview:testNetworkBtn];
    [testNetworkBtn setTitle:@"Network Test" forState:UIControlStateNormal];
    [testNetworkBtn setTitleColor:[UIColor colorWithRed:28.0/255.0 green:147.0/255.0 blue:243.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    [testNetworkBtn setTitleColor:[UIColor colorWithRed:135.0/255.0 green:216.0/255.0 blue:80.0/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [testNetworkBtn addTarget:self action:@selector(testNetwork) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *testMediationBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.view addSubview:testMediationBtn];
    [testMediationBtn setTitle:@"Load Model Test" forState:UIControlStateNormal];
    [testMediationBtn setTitleColor:[UIColor colorWithRed:28.0/255.0 green:147.0/255.0 blue:243.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    [testMediationBtn setTitleColor:[UIColor colorWithRed:135.0/255.0 green:216.0/255.0 blue:80.0/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [testMediationBtn addTarget:self action:@selector(testMediation) forControlEvents:UIControlEventTouchUpInside];
    
    [testBaseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view).offset(-80);
        make.width.equalTo(@(200));
        make.height.equalTo(@(30));
    }];
    
    [testNetworkBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.equalTo(@(200));
        make.height.equalTo(@(30));
    }];
    
    [testMediationBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view).offset(80);
        make.width.equalTo(@(200));
        make.height.equalTo(@(30));
    }];
    
    [TXAD initWithAppId:@"9dc8fab8-32d5-4d6f-b224-8f0a9b55547f"];
    //[TXAD initWithAppId:@"72ccddb3-46df-4c8f-b2c1-53cc34256fb9"];
    //[TXAD setGdprConsent:true];
    [TXAD setTestMode:YES];
    [TXAD setLogEnable:YES];
    
    TXADSegment *segment = [[TXADSegment alloc] init];
    segment.channel = @"google";
    
    [[FLInSightSDK getInstance] start];
    [[FLInSightSDK getInstance] registerDelegate:self];
    
    [TXAD setSegment:segment];
}

- (void) testBase {
    AdTypeViewController *vc = [[AdTypeViewController alloc] init];
    NSArray *ads = @[@[@"Banner", @"e935e782-136e-4268-ab89-c06aaf478c9e"], @[@"Interstitial", @"d3688ddf-7af5-4b7b-af4c-9626e98484d7"], @[@"Native", @"2aa89e71-c773-4204-81a1-12fa25785764"], @[@"RewardedVideo", @"b9083cf1-7d41-4659-86de-94223a492094"], @[@"MixView", @"b60d7dfd-7f9e-4948-b372-008065039026"], @[@"MixFullScreen", @"101ee091-3638-4cdf-9083-148179f108c1"],
        @[@"Splash", @""]];
    vc.adsDic = ads;
    vc.titleStr = @"Basic Test";
    vc.modalPresentationStyle = 0;
    [self presentViewController:vc animated:YES completion:nil];
}

- (void) testNetwork {    
    NetworkTestViewController *vc = [[NetworkTestViewController alloc] init];
    vc.modalPresentationStyle = 0;
    [self presentViewController:vc animated:YES completion:nil];
}

- (void) testMediation {
    LoadModelViewController *vc = [[LoadModelViewController alloc] init];
    vc.modalPresentationStyle = 0;
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)txAdTrackAdCallShow:(TXADTrackerInfo *)trackInfo {
    TXADAdContentInfo *adInfo = trackInfo.adContentInfo;
    if (adInfo != nil) {
        NSLog(@"++++: %@", [adInfo description]);
    }
}
//
//- (void)txAdTrackAdClicked:(TXADTrackerInfo *)trackInfo {
//    if (trackInfo.adType == TXAD_ADTYPE_REWARDED_VIDEO || trackInfo.adType == TXAD_ADTYPE_INTERSTITIAL) {
//        NSLog(@"-----: %@", [trackInfo.adContentInfo description]);
//    }
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
