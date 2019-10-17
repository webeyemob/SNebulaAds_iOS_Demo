//
//  TestAdsViewController.m
//  TaurusXAds_iOS_TestApp
//
//  Created by tang on 2019/7/10.
//  Copyright © 2019 we. All rights reserved.
//

#import "TestAdsViewController.h"
@import TaurusXAds;
#import "Masonry.h"
#import "macro.h"

@interface TestAdsViewController ()<TXADBannerViewDelegate, TXADInterstitialAdDelegate, TXADNativeAdDelegate, TXADRewardedVideoAdDelegate>


@property (nonatomic, strong) TXADNativeAd *nativeAd;
@property (nonatomic, strong) UIView *nativeAdView;

@property (nonatomic, strong) TXADInterstitialAd *interstitalAd;
@property (nonatomic, strong) TXADRewardedVideoAd *rewardAd;
@property (nonatomic, strong) TXADBannerView *bannerAd;

@property (nonatomic, strong) UIButton *showIntBtn;
@property (nonatomic, strong) UIButton *showNativeBtn;

@property (nonatomic, strong) UIButton *showRewardBtn;

@property (nonatomic, strong) UIView *banner;

@property (nonatomic, strong) UIButton *loadBannerBtn;
@property (nonatomic, strong) UIButton *loadIntBtn;
@property (nonatomic, strong) UIButton *loadNativeBtn;

@property (nonatomic, strong) UIButton *loadRewardBtn;

@property (nonatomic, strong) TXADNativeAdLayout *nativeLayout;

@end

@implementation TestAdsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    // Do any additional setup after loading the view.
    
    UIButton *exitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    exitBtn.frame = CGRectMake(ScreenWidth-70, kTopBarSafeHeight, 50, 15);
    [self.view addSubview:exitBtn];
    [exitBtn setTitle:@"back" forState:UIControlStateNormal];
    [exitBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [exitBtn addTarget:self action:@selector(closePage) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *testBannerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    testBannerBtn.frame = CGRectMake((ScreenWidth-200)/2, kTopBarSafeHeight+20, 200, 30);
    [self.view addSubview:testBannerBtn];
    [testBannerBtn setTitle:@"load banner" forState:UIControlStateNormal];
    [testBannerBtn setTitleColor:[UIColor colorWithRed:28.0/255.0 green:147.0/255.0 blue:243.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    [testBannerBtn setTitleColor:[UIColor colorWithRed:135.0/255.0 green:216.0/255.0 blue:80.0/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [testBannerBtn setTitleColor:[UIColor lightGrayColor]  forState:UIControlStateDisabled];
    [testBannerBtn addTarget:self action:@selector(testBanner) forControlEvents:UIControlEventTouchUpInside];
    
    self.loadBannerBtn = testBannerBtn;
    if ([self.bannerID isEqualToString:@""]) {
        testBannerBtn.enabled = NO;
    }
    
    UIButton *testloadIntBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    testloadIntBtn.frame = CGRectMake(20, testBannerBtn.frame.origin.y + 50, 150, 30);
    [self.view addSubview:testloadIntBtn];
    [testloadIntBtn setTitle:@"load Intersitial" forState:UIControlStateNormal];
    //[testloadIntBtn setBackgroundColor:[UIColor blueColor]];
    [testloadIntBtn setTitleColor:[UIColor colorWithRed:28.0/255.0 green:147.0/255.0 blue:243.0/255.0 alpha:1.0]  forState:UIControlStateNormal];
    [testloadIntBtn setTitleColor:[UIColor colorWithRed:135.0/255.0 green:216.0/255.0 blue:80.0/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [testloadIntBtn setTitleColor:[UIColor lightGrayColor]  forState:UIControlStateDisabled];
    [testloadIntBtn addTarget:self action:@selector(loadInteristial) forControlEvents:UIControlEventTouchUpInside];
    if ([self.interstitialID isEqualToString:@""]) {
        testloadIntBtn.enabled = NO;
    }
    
    CGFloat left = ScreenWidth - 150 - 20;
    UIButton *testshowIntBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    testshowIntBtn.frame = CGRectMake(left, testloadIntBtn.frame.origin.y, 150, 30);
    [self.view addSubview:testshowIntBtn];
    [testshowIntBtn setTitle:@"show Intersitial" forState:UIControlStateNormal];
    //[testshowIntBtn setBackgroundColor:[UIColor blueColor]];
    [testshowIntBtn setTitleColor:[UIColor colorWithRed:28.0/255.0 green:147.0/255.0 blue:243.0/255.0 alpha:1.0]  forState:UIControlStateNormal];
    [testshowIntBtn setTitleColor:[UIColor colorWithRed:135.0/255.0 green:216.0/255.0 blue:80.0/255.0 alpha:1.0] forState:UIControlStateHighlighted];
     [testshowIntBtn setTitleColor:[UIColor lightGrayColor]  forState:UIControlStateDisabled];
    [testshowIntBtn addTarget:self action:@selector(showInterstitial) forControlEvents:UIControlEventTouchUpInside];
    testshowIntBtn.enabled = NO;
    self.showIntBtn = testshowIntBtn;
    
    UIButton *loadNativeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loadNativeBtn.frame = CGRectMake(20, testshowIntBtn.frame.origin.y + 50, 150, 30);
    [self.view addSubview:loadNativeBtn];
    [loadNativeBtn setTitle:@"load Native" forState:UIControlStateNormal];
    //[loadNativeBtn setBackgroundColor:[UIColor blueColor]];
    [loadNativeBtn setTitleColor:[UIColor colorWithRed:28.0/255.0 green:147.0/255.0 blue:243.0/255.0 alpha:1.0]  forState:UIControlStateNormal];
    [loadNativeBtn setTitleColor:[UIColor colorWithRed:135.0/255.0 green:216.0/255.0 blue:80.0/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [loadNativeBtn setTitleColor:[UIColor lightGrayColor]  forState:UIControlStateDisabled];
    [loadNativeBtn addTarget:self action:@selector(loadNative) forControlEvents:UIControlEventTouchUpInside];
    self.loadNativeBtn = loadNativeBtn;
    if ([self.nativeID isEqualToString:@""]) {
        loadNativeBtn.enabled = NO;
    }
    
    UIButton *showNativeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    showNativeBtn.frame = CGRectMake(left, loadNativeBtn.frame.origin.y, 150, 30);
    [self.view addSubview:showNativeBtn];
    [showNativeBtn setTitle:@"show Native" forState:UIControlStateNormal];
    //[showNativeBtn setBackgroundColor:[UIColor blueColor]];
    [showNativeBtn setTitleColor:[UIColor colorWithRed:28.0/255.0 green:147.0/255.0 blue:243.0/255.0 alpha:1.0]  forState:UIControlStateNormal];
    [showNativeBtn setTitleColor:[UIColor colorWithRed:135.0/255.0 green:216.0/255.0 blue:80.0/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [showNativeBtn setTitleColor:[UIColor lightGrayColor]  forState:UIControlStateDisabled];
    [showNativeBtn addTarget:self action:@selector(showNative) forControlEvents:UIControlEventTouchUpInside];
    showNativeBtn.enabled = NO;
    self.showNativeBtn = showNativeBtn;
    
    UIButton *loadRewardBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loadRewardBtn.frame = CGRectMake(20, loadNativeBtn.frame.origin.y + 50, 150, 30);
    [self.view addSubview:loadRewardBtn];
    [loadRewardBtn setTitle:@"load Reward" forState:UIControlStateNormal];
    //[loadRewardBtn setBackgroundColor:[UIColor blueColor]];
    [loadRewardBtn setTitleColor:[UIColor colorWithRed:28.0/255.0 green:147.0/255.0 blue:243.0/255.0 alpha:1.0]  forState:UIControlStateNormal];
    [loadRewardBtn setTitleColor:[UIColor colorWithRed:135.0/255.0 green:216.0/255.0 blue:80.0/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [loadRewardBtn setTitleColor:[UIColor lightGrayColor]  forState:UIControlStateDisabled];
    [loadRewardBtn addTarget:self action:@selector(loadReward) forControlEvents:UIControlEventTouchUpInside];
    if ([self.rewardedID isEqualToString:@""]) {
        loadRewardBtn.enabled = NO;
    }
    
    UIButton *rewardShowBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rewardShowBtn.frame = CGRectMake(left, loadRewardBtn.frame.origin.y, 150, 30);
    [self.view addSubview:rewardShowBtn];
    [rewardShowBtn setTitle:@"show Reward" forState:UIControlStateNormal];
    //[rewardShowBtn setBackgroundColor:[UIColor blueColor]];
    [rewardShowBtn setTitleColor:[UIColor colorWithRed:28.0/255.0 green:147.0/255.0 blue:243.0/255.0 alpha:1.0]  forState:UIControlStateNormal];
    [rewardShowBtn setTitleColor:[UIColor colorWithRed:135.0/255.0 green:216.0/255.0 blue:80.0/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [rewardShowBtn setTitleColor:[UIColor lightGrayColor]  forState:UIControlStateDisabled];
    [rewardShowBtn addTarget:self action:@selector(showReward) forControlEvents:UIControlEventTouchUpInside];
    
    rewardShowBtn.enabled = NO;
    self.showRewardBtn = rewardShowBtn;
    
    UIView *banner = [[UIView alloc] init];
    [banner setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:banner];
    
    [banner mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-kBottomSafeHeight);
        make.height.equalTo(@(270));
    }];
    
    self.banner = banner;
    banner.hidden = YES;
    
    [self createNativeAd];
}

- (void) closePage {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)testBanner {
    TXADBannerView *bannerView = [[TXADBannerView alloc] initWithAdUnitId:self.bannerID rootViewController:self];
    bannerView.delegate = self;
    
    [self.banner addSubview:bannerView];
    
    [bannerView loadAd];
}

- (void)createNativeAd {
    UIView *adView = [[UIView alloc] initWithFrame:CGRectMake(10, ScreenHeight-kBottomSafeHeight-270-270, ScreenWidth-20, 250)];
    
    [adView setBackgroundColor:[UIColor colorWithRed:206.0/255.0 green:206.0/255.0 blue:206.0/255.0 alpha:1]];
    [self.view addSubview:adView];
    adView.layer.borderColor = [UIColor colorWithRed:36.0/255.0 green:189.0/255.0 blue:155.0/255.0 alpha:1].CGColor;
    adView.layer.cornerRadius = 10;
    adView.layer.borderWidth = 2;
    self.nativeAdView = adView;
    
    adView.hidden = YES;
    
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


#pragma mark TXADBannerViewDelegate
- (void)txAdBannerDidReceiveAd:(TXADBannerView *)bannerView{
    NSLog(@"TXADBannerView txAdBannerDidReceiveAd, bannerView.adUnitId is %@", bannerView.adUnitId);
    self.banner.hidden = NO;
    
    self.bannerAd = bannerView;
//    CGFloat x = (ScreenWidth-320)/2;
//    bannerView.frame = CGRectMake(x, 10, 320, 50);
    [bannerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.banner);
        make.width.equalTo(@(320));
        make.height.equalTo(@(250));
    }];
}

- (void)txAdBanner:(TXADBannerView *)bannerView didFailToReceiveAdWithError:(TXADAdError *)adError {
    NSLog(@"TXADBannerView didFailToReceiveAdWithError %d, adunitID: %@" , (int)[adError getCode], bannerView.adUnitId);
}

- (void)txAdBannerWillPresentScreen:(TXADBannerView *)bannerView {
    NSLog(@"TXADBannerView txAdBannerWillPresentScreen, adUnitId is %@", bannerView.adUnitId);
}

- (void)txAdBannerDidDismissScreen:(TXADBannerView *)bannerView {
    NSLog(@"TXADBannerView txAdBannerDidDismissScreen, adUnitId is %@", bannerView.adUnitId);
}


- (void)txAdBannerWillLeaveApplication:(TXADBannerView *)bannerView {
    NSLog(@"TXADBannerView txAdBannerWillLeaveApplication, adUnitId is %@", bannerView.adUnitId);
}


#pragma  mark intersitial
- (void) loadInteristial {
    self.interstitalAd = [[TXADInterstitialAd alloc] initWithAdUnitId:self.interstitialID];
    self.interstitalAd.delegate = self;
    [self.interstitalAd loadAd];
}

- (void)showInterstitial {
    if (self.interstitalAd.isReady)
    {
        [self.interstitalAd showFromViewController:self];
    }
}

#pragma mark <WECreativeInterstitialDelegate>
- (void)txAdInterstitialDidReceiveAd:(TXADInterstitialAd *)interstitialAd {
    NSLog(@"TXADInterstitialAd txAdInterstitialDidReceiveAd, interstitialAd.adUnitId is %@", interstitialAd.adUnitId);
    self.showIntBtn.enabled = YES;
}

- (void)txAdInterstitial:(TXADInterstitialAd *)interstitialAd didFailToReceiveAdWithError:(TXADAdError *)adError{
    NSLog(@"TXADInterstitialAd didFailToReceiveAdWithError %d", (int)[adError getCode]);
}

- (void)txAdInterstitialWillPresentScreen:(TXADInterstitialAd *)interstitialAd {
    NSLog(@"TXADInterstitialAd txAdInterstitialWillPresentScreen, interstitialAd adUnitId is %@", interstitialAd.adUnitId);
}

- (void)txAdInterstitialDidDismissScreen:(TXADInterstitialAd *)interstitialAd {
    NSLog(@"TXADInterstitialAd txAdInterstitialDidDismissScreen, interstitialAd adUnitId is %@", interstitialAd.adUnitId);
}

- (void)txAdInterstitialWillLeaveApplication:(TXADInterstitialAd *)interstitialAd {
    NSLog(@"TXADInterstitialAd txAdInterstitialWillLeaveApplication, interstitialAd adUnitId is %@", interstitialAd.adUnitId);
}

- (void) loadNative {
    self.nativeAd = [[TXADNativeAd alloc] initWithAdUnitId:self.nativeID];
    self.nativeAd.delegate = self;
    [self.nativeAd setNativeAdLayout:self.nativeLayout];
    
    [self.nativeAd loadAd];
    
}

- (void)showNative {
    if (self.nativeAd.isReady) {
        UIView *adView = [self.nativeAd getAdView];
        [self.nativeAdView addSubview:adView];
        self.nativeAdView.hidden = NO;
    }
}

#pragma mark <TXADInnerNativeAdDelegate>
- (void)txAdNativeAdDidReceiveAd:(TXADNativeAd *)nativeAd {
    NSLog(@"TXADNativeAd txAdNativeAdDidReceiveAd, nativeAd.adUnitId is %@", nativeAd.adUnitId);
    [self showNative];
    self.showNativeBtn.enabled = YES;
}


- (void)txAdNativeAd:(TXADNativeAd *)nativeAd didFailToReceiveAdWithError:(TXADAdError *)adError{
    NSLog(@"TXADNativeAd didFailToReceiveAdWithError %d", (int)[adError getCode]);
}


- (void)txAdNativeAdWillPresentScreen:(TXADNativeAd *)nativeAd{
    NSLog(@"TXADNativeAd txAdNativeAdWillPresentScreen, nativeAd adUnitId is %@", nativeAd.adUnitId);
}


- (void)txAdNativeAdDidDismissScreen:(TXADNativeAd *)nativeAd{
    NSLog(@"TXADNativeAd txAdNativeAdDidDismissScreen, nativeAd adUnitId is %@", nativeAd.adUnitId);
}


- (void)txAdNativeAdWillLeaveApplication:(TXADNativeAd *)nativeAd {
    NSLog(@"TXADNativeAd txAdNativeAdWillLeaveApplication, nativeAd adUnitId is %@", nativeAd.adUnitId);
}

- (void)loadReward {
    self.rewardAd = [[TXADRewardedVideoAd alloc] initWithAdUnitId:self.rewardedID];
    self.rewardAd.delegate = self;
    [self.rewardAd loadAd];
}

- (void)showReward {
    if (self.rewardAd.isReady)
    {
        [self.rewardAd showFromViewController:self];
    }
}

- (void)txAdRewardedVideoDidReceiveAd:(TXADRewardedVideoAd *)rewardedVideoAd {
    NSLog(@"txAdRewardedVideo txAdRewardedVideoDidReceiveAd, rewardedVideoAd.adUnitId is %@", rewardedVideoAd.adUnitId);
    self.showRewardBtn.enabled = YES;
}


- (void)txAdRewardedVideo:(TXADRewardedVideoAd *)rewardedVideoAd didFailToReceiveAdWithError:(TXADAdError *)adError {
    NSLog(@"txAdRewardedVideo didFailToReceiveAdWithError %d",(int)[adError getCode]);
}

- (void)txAdRewardedVideoDidStart:(TXADRewardedVideoAd *)rewardedVideoAd {
    NSLog(@"txAdRewardedVideo txAdRewardedVideoDidStart, rewardedVideoAd adUnitId is %@", rewardedVideoAd.adUnitId);
}

- (void)txAdRewardedVideoDidClose:(TXADRewardedVideoAd *)rewardedVideoAd{
    NSLog(@"txAdRewardedVideo txAdRewardedVideoDidComplete, rewardedVideoAd adUnitId is %@", rewardedVideoAd.adUnitId);
}

- (void)txAdRewardedVideo:(TXADRewardedVideoAd *)rewardedVideoAd didReward:(TXADRewardItem *)item {
    NSLog(@"txAdRewardedVideo did reward, rewardedVideoAd adUnitId is %@", rewardedVideoAd.adUnitId);
}

@end
