//
//  LoadModelViewController.m
//  iOS_AutoTest
//
//  Created by 汤正 on 2019/10/16.
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
    [SerilLoadBtn setTitle:@"SerilLoad" forState:UIControlStateNormal];
    [SerilLoadBtn setTitleColor:[UIColor colorWithRed:28.0/255.0 green:147.0/255.0 blue:243.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    [SerilLoadBtn setTitleColor:[UIColor colorWithRed:135.0/255.0 green:216.0/255.0 blue:80.0/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    SerilLoadBtn.tag = 0;
    [SerilLoadBtn addTarget:self action:@selector(testLoadModel:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *parellLoadBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.view addSubview:parellLoadBtn];
    [parellLoadBtn setTitle:@"ParallelLoad" forState:UIControlStateNormal];
    [parellLoadBtn setTitleColor:[UIColor colorWithRed:28.0/255.0 green:147.0/255.0 blue:243.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    [parellLoadBtn setTitleColor:[UIColor colorWithRed:135.0/255.0 green:216.0/255.0 blue:80.0/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    parellLoadBtn.tag = 1;
    [parellLoadBtn addTarget:self action:@selector(testLoadModel:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *testshuffleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.view addSubview:testshuffleBtn];
    [testshuffleBtn setTitle:@"ShuffleLoad" forState:UIControlStateNormal];
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
            NSArray *ads = @[@[@"Banner", @"57be18f5-7030-4a46-8fc9-49b4abbd2438"], @[@"Interstitial", @"57be18f5-7030-4a46-8fc9-49b4abbd2438"], @[@"Native", @"3f733527-5202-4869-b148-73962fadbb88"], @[@"RewardedVideo", @"f5f0cdb5-b18f-4e56-82f4-00d5238b31b0"]];
            vc.adsDic = ads;
            vc.titleStr = @"Seril Load";
        }
            break;
        case 1: {
            NSArray *ads = @[@[@"Banner", @"57be18f5-7030-4a46-8fc9-49b4abbd2438"], @[@"Interstitial", @"57be18f5-7030-4a46-8fc9-49b4abbd2438"], @[@"Native", @"3f733527-5202-4869-b148-73962fadbb88"], @[@"RewardedVideo", @"f5f0cdb5-b18f-4e56-82f4-00d5238b31b0"]];
            vc.adsDic = ads;
            vc.titleStr = @"Parllel Test";
        }
            break;
        case 2:
        default: {
            NSArray *ads = @[@[@"Banner", @"57be18f5-7030-4a46-8fc9-49b4abbd2438"], @[@"Interstitial", @"57be18f5-7030-4a46-8fc9-49b4abbd2438"], @[@"Native", @"3f733527-5202-4869-b148-73962fadbb88"], @[@"RewardedVideo", @"f5f0cdb5-b18f-4e56-82f4-00d5238b31b0"]];
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
