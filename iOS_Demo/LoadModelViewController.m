//
//  LoadModelViewController.m
//  iOS_AutoTest
//
//  Created by TaurusXAd on 2019/10/16.
//  Copyright © 2019 we. All rights reserved.
//

#import "LoadModelViewController.h"
#import "macro.h"
#import <Masonry.h>
#import "AdTypeViewController.h"

@interface LoadModelViewController ()

@end

@implementation LoadModelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.modalPresentationStyle = 0;
    UIView *header = [[UIView alloc] init];
    header.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:header];
    [header mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(kTopBarSafeHeight);
        make.bottom.equalTo(self.view.mas_top).offset(kTopBarSafeHeight+20);
    }];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [header addSubview:backBtn];
       
    [backBtn addTarget:self action:@selector(gotoBack) forControlEvents:UIControlEventTouchUpInside];
    [backBtn setTitle:@"back" forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(header).offset(-20);
        make.centerY.equalTo(header);
        make.width.equalTo(@(50));
    }];
    
    UIButton *SerilLoadBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.view addSubview:SerilLoadBtn];
    [SerilLoadBtn setTitle:@"Serial Load" forState:UIControlStateNormal];
    [SerilLoadBtn setTitleColor:[UIColor colorWithRed:28.0/255.0 green:147.0/255.0 blue:243.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    [SerilLoadBtn setTitleColor:[UIColor colorWithRed:135.0/255.0 green:216.0/255.0 blue:80.0/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    SerilLoadBtn.tag = 0;
    [SerilLoadBtn addTarget:self action:@selector(testLoadModel:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *parellLoadBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.view addSubview:parellLoadBtn];
    [parellLoadBtn setTitle:@"Parallel Load" forState:UIControlStateNormal];
    [parellLoadBtn setTitleColor:[UIColor colorWithRed:28.0/255.0 green:147.0/255.0 blue:243.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    [parellLoadBtn setTitleColor:[UIColor colorWithRed:135.0/255.0 green:216.0/255.0 blue:80.0/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    parellLoadBtn.tag = 1;
    [parellLoadBtn addTarget:self action:@selector(testLoadModel:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *testshuffleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.view addSubview:testshuffleBtn];
    [testshuffleBtn setTitle:@"Shuffle Load" forState:UIControlStateNormal];
    [testshuffleBtn setTitleColor:[UIColor colorWithRed:28.0/255.0 green:147.0/255.0 blue:243.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    [testshuffleBtn setTitleColor:[UIColor colorWithRed:135.0/255.0 green:216.0/255.0 blue:80.0/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    testshuffleBtn.tag = 2;
    [testshuffleBtn addTarget:self action:@selector(testLoadModel:) forControlEvents:UIControlEventTouchUpInside];
    
    [SerilLoadBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view).offset(-80);
        make.width.equalTo(@(200));
        make.height.equalTo(@(30));
    }];
    
    [parellLoadBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.equalTo(@(200));
        make.height.equalTo(@(30));
    }];
    
    [testshuffleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view).offset(80);
        make.width.equalTo(@(200));
        make.height.equalTo(@(30));
    }];
}

- (void) gotoBack {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) testLoadModel: (UIButton*) btn{
    AdTypeViewController *vc = [[AdTypeViewController alloc] init];
    vc.modalPresentationStyle = 0;
    switch (btn.tag) {
        case 0:{
            NSArray *ads = @[@[@"Banner", @"bb15564d-0e7b-4d47-a696-fba4bced4078"], @[@"Interstitial", @"f90a0a9d-6b9d-4998-995a-2c36566a42f4"], @[@"Native", @"0d1ec6cd-6cdf-411c-87ce-8170eb69005c"], @[@"RewardedVideo", @"aa2d120d-ac81-4f68-9132-0bc8f1ade6d9"]];
            vc.adsDic = ads;
            vc.titleStr = @"Serial Load";
        }
            break;
        case 1: {
            NSArray *ads = @[@[@"Banner", @"1890ef4f-7e83-4935-b85a-944424e38089"], @[@"Interstitial", @"4c75e459-eb05-4187-9377-1929096f9a6e"], @[@"Native", @"08e9b0ac-9c58-474f-b651-0234c89f40c0"], @[@"RewardedVideo", @"c46c519e-f827-4594-bfa2-356c06f17db2"]];
            vc.adsDic = ads;
            vc.titleStr = @"Parallel Test";
        }
            break;
        case 2:
        default: {
            NSArray *ads = @[@[@"Banner", @"983bcfe6-9c81-4684-9f01-ba0182a86e9d"], @[@"Interstitial", @"1a44ab67-51a1-4aa0-a323-a1825c29643e"], @[@"Native", @"d3f6afbe-db46-440a-b9b8-654a52f4d59a"], @[@"RewardedVideo", @"3cc5e901-ffac-459e-ab91-c99e347b62ef"]];
            vc.adsDic = ads;
            vc.titleStr = @"Suffle Test";
        }
            break;
    }
    
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
