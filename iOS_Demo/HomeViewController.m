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

@interface HomeViewController ()

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
    //[TXAD setGdprConsent:true];
    [TXAD setTestMode:YES];
    [TXAD setLogEnable:YES];
    
    TXADSegment *segment = [[TXADSegment alloc] init];
    segment.channel = @"google";
    
    [TXAD setSegment:segment];
}

- (void) testBase {
    AdTypeViewController *vc = [[AdTypeViewController alloc] init];
    NSArray *ads = @[@[@"Banner", @"5eb89e74-b9c8-43ca-afee-84255744b012"], @[@"Interstitial", @"3ed5613b-2854-44c8-9994-893c5c4d6f00"], @[@"Native", @"d657a4ac-67b8-4779-ae70-598e14c22bec"], @[@"RewardedVideo", @"c81d7147-d0a9-4116-9306-f5b6c6d78167"], @[@"MixView", @"b60d7dfd-7f9e-4948-b372-008065039026"], @[@"MixFullScreen", @"101ee091-3638-4cdf-9083-148179f108c1"],
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
