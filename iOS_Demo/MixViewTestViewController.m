//
//  MixViewTestViewController.m
//  iOS_AutoTest
//
//  Created by TaurusXAd on 2019/10/16.
//  Copyright © 2019 we. All rights reserved.
//

#import "MixViewTestViewController.h"
@import TaurusXAds;
#import "Masonry.h"
#import "macro.h"

@interface MixViewTestViewController () <TXADMixViewAdDelegate>

@property (nonatomic, strong) TXADMixViewAd *mixViewAd;

@property (nonatomic, strong) TXADNativeAdLayout *nativeLayout;

@end

@implementation MixViewTestViewController

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
    
    UIButton *loadNativeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loadNativeBtn.frame = CGRectMake((ScreenWidth-200)/2, kTopBarSafeHeight+50, 200, 30);
    [self.view addSubview:loadNativeBtn];
    [loadNativeBtn setTitle:@"load MixView" forState:UIControlStateNormal];
    //[loadNativeBtn setBackgroundColor:[UIColor blueColor]];
    [loadNativeBtn setTitleColor:[UIColor colorWithRed:28.0/255.0 green:147.0/255.0 blue:243.0/255.0 alpha:1.0]  forState:UIControlStateNormal];
    [loadNativeBtn setTitleColor:[UIColor colorWithRed:135.0/255.0 green:216.0/255.0 blue:80.0/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [loadNativeBtn setTitleColor:[UIColor lightGrayColor]  forState:UIControlStateDisabled];
    [loadNativeBtn addTarget:self action:@selector(loadMixView) forControlEvents:UIControlEventTouchUpInside];
        
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
    self.nativeLayout = [TXADNativeAdLayout getLargeLayout1WithWidth:ScreenWidth-20];
}

- (void) loadMixView {
    self.mixViewAd = [[TXADMixViewAd alloc] initWithAdUnitId:self.adUnitID rootViewController:self];
    self.mixViewAd.delegate = self;
    //[self.mixViewAd setCount:3];
    [self.mixViewAd setNativeAdLayout:self.nativeLayout];
    [self.mixViewAd loadAd];
    
}

- (void)showMixView {

    // 布置展示广告素材的 UIViews，可以通过新建 xib 文件或自定义 UIView 的子类
    UIView *adView = [self.mixViewAd getAdView];
    adView.frame = CGRectMake(10, kTopBarSafeHeight+80, ScreenWidth-20, 450);
    // 展示广告
    [adView setBackgroundColor:[UIColor colorWithRed:206.0/255.0 green:206.0/255.0 blue:206.0/255.0 alpha:1]];
    [self.view addSubview:adView];
    adView.layer.borderColor = [UIColor colorWithRed:36.0/255.0 green:189.0/255.0 blue:155.0/255.0 alpha:1].CGColor;
    adView.layer.cornerRadius = 10;
    adView.layer.borderWidth = 2;
}

#pragma mark <TXADMixViewAdDelegate>
- (void)txAdMixViewAdDidReceiveAd:(TXADMixViewAd *)mixViewAd {
    NSLog(@"txAdMixViewDidReceiveAd");
    [self showMixView];
}

/// 广告加载失败
- (void)txAdMixViewAd:(TXADMixViewAd *)mixViewAd didFailToReceiveAdWithError:(TXADAdError *)adError {
    NSLog(@"txAdMixView:didFailToReceiveAdWithError, errorCode is %ld, errorMessage is %@",
          adError.getCode, adError.description);
}

/// 广告展示；如果一次加载多个广告，此回调会触发多次
- (void)txAdMixViewAdWillPresentScreen:(TXADMixViewAd *)mixViewAd{
    NSLog(@"txAdMixViewWillPresentScreen");
}

/// 点击广告；如果一次加载多个广告，此回调会触发多次
- (void)txAdMixViewAdWillLeaveApplication:(TXADMixViewAd *)mixViewAd{
    NSLog(@"txAdMixViewWillLeaveApplication");
}

/// 点击广告后关闭落地页
- (void)txAdmixViewAdDidDismissScreen:(TXADMixViewAd *)mixViewAd{
    NSLog(@"txAdMixViewDidDismissScreen");
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
