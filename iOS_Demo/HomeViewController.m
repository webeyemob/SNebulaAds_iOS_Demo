//
//  HomeViewController.m
//  AdLime_iOS_AutoTest
//
//  Created by 汤正 on 2019/9/27.
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
    
}

- (void) testBase {
    [TXAD initWithAppId:@"0f483e96-1ca5-4c46-aff0-109b97563d72"];
    [TXAD setGdprConsent:true];
    [TXAD setTestMode:YES];
    [TXAD setLogEnable:YES];
    
    AdTypeViewController *vc = [[AdTypeViewController alloc] init];
    NSArray *ads = @[@[@"Banner", @"19883768-3c51-4957-91cb-ce786350c869"], @[@"Interstitial", @"ee0edf7d-4daa-4576-b633-d40bddcd8794"], @[@"Native", @"46a98b93-fa84-44c2-b465-dd1a88d7cbc2"], @[@"RewardedVideo", @"0fcda4e7-3134-4014-9631-e695b3db38b1"]];
    vc.adsDic = ads;
    vc.titleStr = @"Basic Test";
    vc.modalPresentationStyle = 0;
    [self presentViewController:vc animated:YES completion:nil];
}

- (void) testNetwork {
    [TXAD initWithAppId:@"9dc8fab8-32d5-4d6f-b224-8f0a9b55547f"];
    [TXAD setGdprConsent:true];
    [TXAD setTestMode:YES];
    [TXAD setLogEnable:YES];
    
    NetworkTestViewController *vc = [[NetworkTestViewController alloc] init];
    vc.modalPresentationStyle = 0;
    [self presentViewController:vc animated:YES completion:nil];
}

- (void) testMediation {
    [TXAD initWithAppId:@"9dc8fab8-32d5-4d6f-b224-8f0a9b55547f"];
    [TXAD setGdprConsent:true];
    [TXAD setTestMode:YES];
    [TXAD setLogEnable:YES];
    
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
