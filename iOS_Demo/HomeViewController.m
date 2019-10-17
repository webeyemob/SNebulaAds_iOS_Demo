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
    [TXAD initWithAppId:@"1e68d89e-ee81-47bc-ab4b-f79c09e5c561"];
    [TXAD setGdprConsent:true];
    [TXAD setTestMode:YES];
    [TXAD setLogEnable:YES];
    
    AdTypeViewController *vc = [[AdTypeViewController alloc] init];
    NSArray *ads = @[@[@"Banner", @"57be18f5-7030-4a46-8fc9-49b4abbd2438"], @[@"Interstitial", @"57be18f5-7030-4a46-8fc9-49b4abbd2438"], @[@"Native", @"3f733527-5202-4869-b148-73962fadbb88"], @[@"RewardedVideo", @"f5f0cdb5-b18f-4e56-82f4-00d5238b31b0"]];
    vc.adsDic = ads;
    vc.titleStr = @"Basic Test";
    vc.modalPresentationStyle = 0;
    [self presentViewController:vc animated:YES completion:nil];
}

- (void) testNetwork {
    [TXAD initWithAppId:@"85f1d986-88e3-42f5-bd55-ffedea562215"];
    [TXAD setGdprConsent:true];
    [TXAD setTestMode:YES];
    [TXAD setLogEnable:YES];
    
    NetworkTestViewController *vc = [[NetworkTestViewController alloc] init];
    vc.modalPresentationStyle = 0;
    [self presentViewController:vc animated:YES completion:nil];
}

- (void) testMediation {
    [TXAD initWithAppId:@"fc0840a5-64f5-44a2-8067-1e66643c37fb"];
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
