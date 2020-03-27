//
//  AdTypeViewController.m
//  iOS_AutoTest
//
//  Created by TaurusXAd on 2019/10/16.
//  Copyright © 2019 we. All rights reserved.
//

#import "AdTypeViewController.h"
#import "Masonry.h"
#import "BannerTestViewController.h"
#import "InterstitialTestViewController.h"
#import "NativeTestViewController.h"
#import "RewardedVideoTestViewController.h"
#import "FeedListTestViewController.h"
#import "MixViewTestViewController.h"
#import "MixFullScreenTestViewController.h"
#import "SplashTestViewController.h"
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
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = [UIColor grayColor];
    [self.view addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(header.mas_bottom).offset(1);
        make.height.equalTo(@1);
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
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _adsDic.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSDictionary *ads = _adsDic[section];
    NSArray *adArr = ads.allValues[0];
    
    return [adArr count];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 20)];
    
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 2, 150, 16)];
    headerLabel.backgroundColor = [UIColor clearColor];
    headerLabel.font = [UIFont boldSystemFontOfSize:15.0];
    headerLabel.textColor = [UIColor whiteColor];
    NSDictionary *dic = _adsDic[section];
    headerLabel.text = dic.allKeys[0];
    
    [view addSubview:headerLabel];
   
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    tableView.decelerationRate = UIScrollViewDecelerationRateFast;
    tableView.backgroundColor = [UIColor grayColor];
    tableView.backgroundView.backgroundColor = [UIColor whiteColor];
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    NSDictionary *ads = _adsDic[indexPath.section];
    NSArray *adArr = ads.allValues[0];
    NSDictionary *adunitDic = adArr[indexPath.row];
    
    cell.textLabel.text = adunitDic.allKeys[0];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *ads = _adsDic[indexPath.section];
    NSString *adType = ads.allKeys[0];
    NSArray *adArr = ads.allValues[0];
    
    if ([adType isEqualToString:@"Banner"]) {
        BannerTestViewController *adsTestVc = [[BannerTestViewController alloc] init];
        adsTestVc.modalPresentationStyle = UIModalPresentationFullScreen;
        NSDictionary *adunitDic = adArr[indexPath.row];
        adsTestVc.titleStr = [NSString stringWithFormat:@"%@ - %@", self.titleStr, adunitDic.allKeys[0]];
        adsTestVc.adUnitID = adunitDic.allValues[0];
        [self presentViewController:adsTestVc animated:YES completion:nil];
    } else if ([adType isEqualToString:@"Interstitial"]) {
        InterstitialTestViewController *adsTestVc = [[InterstitialTestViewController alloc] init];
        adsTestVc.modalPresentationStyle = UIModalPresentationFullScreen;
        NSDictionary *adunitDic = adArr[indexPath.row];
        adsTestVc.titleStr = [NSString stringWithFormat:@"%@ - %@", self.titleStr, adunitDic.allKeys[0]];
        adsTestVc.adUnitID = adunitDic.allValues[0];
        [self presentViewController:adsTestVc animated:YES completion:nil];
    } else if ([adType isEqualToString:@"Native"]) {
        NativeTestViewController *adsTestVc = [[NativeTestViewController alloc] init];
        adsTestVc.modalPresentationStyle = UIModalPresentationFullScreen;
        NSDictionary *adunitDic = adArr[indexPath.row];
        adsTestVc.titleStr = [NSString stringWithFormat:@"%@ - %@", self.titleStr, adunitDic.allKeys[0]];
        adsTestVc.adUnitID = adunitDic.allValues[0];
        [self presentViewController:adsTestVc animated:YES completion:nil];
    } else if ([adType isEqualToString:@"RewardedVideo"]) {
        RewardedVideoTestViewController *adsTestVc = [[RewardedVideoTestViewController alloc] init];
        adsTestVc.modalPresentationStyle = UIModalPresentationFullScreen;
        NSDictionary *adunitDic = adArr[indexPath.row];
        adsTestVc.titleStr = [NSString stringWithFormat:@"%@ - %@", self.titleStr, adunitDic.allKeys[0]];
        adsTestVc.adUnitID = adunitDic.allValues[0];
        [self presentViewController:adsTestVc animated:YES completion:nil];
    } else if ([adType isEqualToString:@"MixView"]) {
        MixViewTestViewController *adsTestVc = [[MixViewTestViewController alloc] init];
        adsTestVc.modalPresentationStyle = UIModalPresentationFullScreen;
        NSDictionary *adunitDic = adArr[indexPath.row];
        adsTestVc.titleStr = [NSString stringWithFormat:@"%@ - %@", self.titleStr, adunitDic.allKeys[0]];
        adsTestVc.adUnitID = adunitDic.allValues[0];
        [self presentViewController:adsTestVc animated:YES completion:nil];
    } else if ([adType isEqualToString:@"MixFullScreen"]) {
        MixFullScreenTestViewController *adsTestVc = [[MixFullScreenTestViewController alloc] init];
        adsTestVc.modalPresentationStyle = UIModalPresentationFullScreen;
        NSDictionary *adunitDic = adArr[indexPath.row];
        adsTestVc.titleStr = [NSString stringWithFormat:@"%@ - %@", self.titleStr, adunitDic.allKeys[0]];
        adsTestVc.adUnitID = adunitDic.allValues[0];
        [self presentViewController:adsTestVc animated:YES completion:nil];
    } else if ([adType isEqualToString:@"FeedList"]) {
        FeedListTestViewController *adsTestVc = [[FeedListTestViewController alloc] init];
        adsTestVc.modalPresentationStyle = UIModalPresentationFullScreen;
        NSDictionary *adunitDic = adArr[indexPath.row];
        adsTestVc.titleStr = [NSString stringWithFormat:@"%@ - %@", self.titleStr, adunitDic.allKeys[0]];
        adsTestVc.adUnitID = adunitDic.allValues[0];
        [self presentViewController:adsTestVc animated:YES completion:nil];
    } else if ([adType isEqualToString:@"Splash"]) {
        SplashTestViewController *adsTestVc = [[SplashTestViewController alloc] init];
        adsTestVc.modalPresentationStyle = UIModalPresentationFullScreen;
        NSDictionary *adunitDic = adArr[indexPath.row];
        adsTestVc.titleStr = [NSString stringWithFormat:@"%@ - %@", self.titleStr, adunitDic.allKeys[0]];
        adsTestVc.adUnitID = adunitDic.allValues[0];
        [self presentViewController:adsTestVc animated:YES completion:nil];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}


@end
