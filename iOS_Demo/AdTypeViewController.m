//
//  AdTypeViewController.m
//  iOS_AutoTest
//
//  Created by 汤正 on 2019/10/16.
//  Copyright © 2019 we. All rights reserved.
//

#import "AdTypeViewController.h"
#import "Masonry.h"
#import "BannerTestViewController.h"
#import "InterstitialTestViewController.h"
#import "NativeTestViewController.h"
#import "RewardedVideoTestViewController.h"
#import "macro.h"

@interface AdTypeViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation AdTypeViewController

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
       
    [backBtn addTarget:self action:@selector(gotoBack) forControlEvents:UIControlEventTouchUpInside];
    [backBtn setTitle:@"back" forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(header).offset(-20);
        make.centerY.equalTo(header);
        make.width.equalTo(@(50));
    }];
       
    UITableView *AdTypeTab = [[UITableView alloc] init];
    AdTypeTab.delegate = self;
    AdTypeTab.dataSource = self;
    AdTypeTab.userInteractionEnabled = YES;
    [AdTypeTab setSeparatorStyle:UITableViewCellSeparatorStyleNone];
       
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [AdTypeTab setTableFooterView:view];
    
       
    [self.view addSubview:AdTypeTab];
       
    [AdTypeTab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(header.mas_bottom).offset(2);
        make.left.right.bottom.equalTo(self.view);
    }];
}

- (void) gotoBack {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark <UITableViewDelegate>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _adsDic.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"networkCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] init];
    }
    
    cell.textLabel.text = _adsDic[indexPath.row][0];
    [cell.textLabel setTextColor:[UIColor colorWithRed:28.0/255.0 green:147.0/255.0 blue:243.0/255.0 alpha:1.0]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([_adsDic[indexPath.row][0] isEqualToString:@"Banner"]) {
        BannerTestViewController *adsTestVc = [[BannerTestViewController alloc] init];
        adsTestVc.modalPresentationStyle = UIModalPresentationFullScreen;
        adsTestVc.adUnitID = _adsDic[indexPath.row][1];
        [self presentViewController:adsTestVc animated:YES completion:nil];
        
    } else if ([_adsDic[indexPath.row][0] isEqualToString:@"Interstitial"]) {
        InterstitialTestViewController *adsTestVc = [[InterstitialTestViewController alloc] init];
        adsTestVc.modalPresentationStyle = UIModalPresentationFullScreen;
        adsTestVc.adUnitID = _adsDic[indexPath.row][1];
        [self presentViewController:adsTestVc animated:YES completion:nil];
        
    } else if ([_adsDic[indexPath.row][0] isEqualToString:@"Native"]) {
        NativeTestViewController *adsTestVc = [[NativeTestViewController alloc] init];
        adsTestVc.modalPresentationStyle = UIModalPresentationFullScreen;
        adsTestVc.adUnitID = _adsDic[indexPath.row][1];
        [self presentViewController:adsTestVc animated:YES completion:nil];
        
    } else if ([_adsDic[indexPath.row][0] isEqualToString:@"RewardedVideo"]) {
        RewardedVideoTestViewController *adsTestVc = [[RewardedVideoTestViewController alloc] init];
        adsTestVc.modalPresentationStyle = UIModalPresentationFullScreen;
        adsTestVc.adUnitID = _adsDic[indexPath.row][1];
        [self presentViewController:adsTestVc animated:YES completion:nil];
        
    }
    
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
