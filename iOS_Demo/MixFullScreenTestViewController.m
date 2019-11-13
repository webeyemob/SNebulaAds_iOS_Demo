//
//  MixFullScreenTestViewController.m
//  iOS_AutoTest
//
//  Created by TaurusXAd on 2019/10/16.
//  Copyright © 2019 we. All rights reserved.
//

#import "MixFullScreenTestViewController.h"
@import TaurusXAds;
#import "Masonry.h"
#import "macro.h"
#import "UIView+Toast.h"

@interface MixFullScreenTestViewController () <TXADMixFullScreenAdDelegate>

@property (nonatomic, strong) TXADMixFullScreenAd *mixFullScreenAd;
@property (nonatomic, strong) UIButton *showIntBtn;

@property (nonatomic, strong) TXADNativeAdLayout *nativeLayout;

@end

@implementation MixFullScreenTestViewController

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
    [testloadIntBtn setTitle:@"load mixfullscreen" forState:UIControlStateNormal];
    //[testloadIntBtn setBackgroundColor:[UIColor blueColor]];
    [testloadIntBtn setTitleColor:[UIColor colorWithRed:28.0/255.0 green:147.0/255.0 blue:243.0/255.0 alpha:1.0]  forState:UIControlStateNormal];
    [testloadIntBtn setTitleColor:[UIColor colorWithRed:135.0/255.0 green:216.0/255.0 blue:80.0/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [testloadIntBtn setTitleColor:[UIColor lightGrayColor]  forState:UIControlStateDisabled];
    [testloadIntBtn addTarget:self action:@selector(loadMixFullScreenAd) forControlEvents:UIControlEventTouchUpInside];
    
    CGFloat left = ScreenWidth - 150 - 20;
    UIButton *testshowIntBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    testshowIntBtn.frame = CGRectMake(left, kTopBarSafeHeight+50, 150, 30);
    [self.view addSubview:testshowIntBtn];
    [testshowIntBtn setTitle:@"show mixfullscreen" forState:UIControlStateNormal];
    //[testshowIntBtn setBackgroundColor:[UIColor blueColor]];
    [testshowIntBtn setTitleColor:[UIColor colorWithRed:28.0/255.0 green:147.0/255.0 blue:243.0/255.0 alpha:1.0]  forState:UIControlStateNormal];
    [testshowIntBtn setTitleColor:[UIColor colorWithRed:135.0/255.0 green:216.0/255.0 blue:80.0/255.0 alpha:1.0] forState:UIControlStateHighlighted];
     [testshowIntBtn setTitleColor:[UIColor lightGrayColor]  forState:UIControlStateDisabled];
    [testshowIntBtn addTarget:self action:@selector(showMixFullScreenAd) forControlEvents:UIControlEventTouchUpInside];
    testshowIntBtn.enabled = NO;
    self.showIntBtn = testshowIntBtn;
    
    //[self createLayout];
    [self createDefaultLayout];
}

- (void) closePage {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)createLayout {
    UIView *rootView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth-20, 250)];
    
    UIView *mediaView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth-20, 150)];
    [rootView addSubview:mediaView];
    
    UIView *icon = [[UIView alloc] initWithFrame:CGRectMake(5, 160, 60, 60)];
    [rootView addSubview:icon];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(80, 160, ScreenWidth-20-80, 20)];
    title.numberOfLines = 1;
    [title setTextColor:[UIColor greenColor]];
    [rootView addSubview:title];
    
    UILabel *desc = [[UILabel alloc] initWithFrame:CGRectMake(80, 180, ScreenWidth-20-80, 40)];
    [desc setTextColor:[UIColor grayColor]];
    desc.numberOfLines = 2;
    [rootView addSubview:desc];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundColor:[UIColor redColor]];
    btn.frame = CGRectMake(200, desc.frame.origin.y + 40, 100, 20);
    [rootView addSubview:btn];
    
    TXADNativeAdLayout *layout = [[TXADNativeAdLayout alloc] init];
    layout.rootView = rootView;
    layout.titleLabel = title;
    layout.bodyLabel = desc;
    layout.mediaView = mediaView;
    layout.callToActionView = btn;
    layout.iconView = icon;
    
    self.nativeLayout = layout;
}

- (void)createDefaultLayout {
    self.nativeLayout = [TXADNativeAdLayout getFullLayout1];
}


#pragma  mark intersitial
- (void) loadMixFullScreenAd {
    self.mixFullScreenAd = [[TXADMixFullScreenAd alloc] initWithAdUnitId:self.adUnitID];
    self.mixFullScreenAd.delegate = self;
    [self.mixFullScreenAd setNativeAdLayout:self.nativeLayout];
    [self.mixFullScreenAd loadAd];
}

- (void)showMixFullScreenAd {
    if (self.mixFullScreenAd.isReady)
    {
        [self.mixFullScreenAd showFromViewController:self];
    }
}

#pragma mark <WECreativeMixFullScreenAdDelegate>
- (void)txAdMixFullScreenAdDidReceiveAd:(TXADMixFullScreenAd *)mixFullScreenAd {
    NSLog(@"TXADMixFullScreenAdAd txAdMixFullScreenAdDidReceiveAd, mixFullScreenAd.adUnitId is %@", mixFullScreenAd.adUnitId);
    self.showIntBtn.enabled = YES;
}

- (void)txAdMixFullScreenAd:(TXADMixFullScreenAd *)mixFullScreenAd didFailToReceiveAdWithError:(TXADAdError *)adError{
    NSLog(@"TXADMixFullScreenAdAd didFailToReceiveAdWithError %d", (int)[adError getCode]);
    
    [self.view makeToast:@"load failed" duration:3.0 position:CSToastPositionCenter];
}

- (void)txAdMixFullScreenAdWillPresentScreen:(TXADMixFullScreenAd *)mixFullScreenAd {
    NSLog(@"TXADMixFullScreenAdAd txAdMixFullScreenAdWillPresentScreen, mixFullScreenAd adUnitId is %@", mixFullScreenAd.adUnitId);
}

- (void)txAdMixFullScreenAdDidDismissScreen:(TXADMixFullScreenAd *)mixFullScreenAd {
    NSLog(@"TXADMixFullScreenAdAd txAdMixFullScreenAdDidDismissScreen, mixFullScreenAd adUnitId is %@", mixFullScreenAd.adUnitId);
}

- (void)txAdMixFullScreenAdWillLeaveApplication:(TXADMixFullScreenAd *)mixFullScreenAd {
    NSLog(@"TXADMixFullScreenAdAd txAdMixFullScreenAdWillLeaveApplication, mixFullScreenAd adUnitId is %@", mixFullScreenAd.adUnitId);
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
