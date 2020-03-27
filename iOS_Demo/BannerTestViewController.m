//
//  BannerTestViewController.m
//  iOS_AutoTest
//
//  Created by TaurusXAd on 2019/10/16.
//  Copyright © 2019 we. All rights reserved.
//

#import "BannerTestViewController.h"
@import TaurusXAds;
#import "Masonry.h"
#import "macro.h"
#import "UIView+Toast.h"


@interface BannerTestViewController () <TXADBannerViewDelegate>

@property (nonatomic, strong) TXADBannerView *bannerAd;
@property (nonatomic, strong) UIView *banner;

@end

@implementation BannerTestViewController

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
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = [UIColor grayColor];
    [self.view addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(header.mas_bottom).offset(1);
        make.height.equalTo(@1);
    }];
       
    
    UIButton *testBannerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:testBannerBtn];
    [testBannerBtn setTitle:@"load" forState:UIControlStateNormal];
    [testBannerBtn setTitleColor:[UIColor colorWithRed:28.0/255.0 green:147.0/255.0 blue:243.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    [testBannerBtn setTitleColor:[UIColor colorWithRed:135.0/255.0 green:216.0/255.0 blue:80.0/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [testBannerBtn setTitleColor:[UIColor lightGrayColor]  forState:UIControlStateDisabled];
    [testBannerBtn addTarget:self action:@selector(testBanner) forControlEvents:UIControlEventTouchUpInside];
    
    [testBannerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(header.mas_bottom).offset(10);
        make.centerX.equalTo(self.view);
        make.width.equalTo(@(200));
        make.height.equalTo(@(20));
    }];
    
    UIView *banner = [[UIView alloc] init];
    [banner setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:banner];
    
    [banner mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(testBannerBtn.mas_bottom).offset(80);
    }];
    
    self.banner = banner;
    banner.hidden = YES;
}

- (void) closePage {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)testBanner {
    if (!useAdLoader) {
        if (self.bannerAd == nil) {
            self.bannerAd = [[TXADBannerView alloc] initWithAdUnitId:self.adUnitID rootViewController:self];
            self.bannerAd.delegate = self;
        }
        
        [self.bannerAd loadAd];
    } else {
        TXADBannerView *ad = [TXADAdLoader getBannerAdView:self.adUnitID rootViewController:self];
        ad.delegate = self;
        [TXADAdLoader loadBanner:self.adUnitID rootViewController:self];
    }
}

#pragma mark TXADBannerViewDelegate
- (void)txAdBannerDidReceiveAd:(TXADBannerView *)bannerView{
    NSLog(@"TXADBannerView txAdBannerDidReceiveAd, bannerView.adUnitId is %@", bannerView.adUnitId);
    self.banner.hidden = NO;
    if (!useAdLoader) {
        for (UIView *temp in self.banner.subviews) {
            [temp removeFromSuperview];
        }
        [self.banner addSubview:bannerView];
        
        [bannerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.banner);
            make.centerY.equalTo(self.banner);
            make.width.equalTo(@(bannerView.bounds.size.width));
            make.height.equalTo(@(bannerView.bounds.size.height));
        }];
        
    } else {
        [TXADAdLoader showBanner:self.adUnitID container:self.banner];
    }
    
//    CGFloat x = (ScreenWidth-320)/2;
//    bannerView.frame = CGRectMake(x, 10, 320, 50);
//    [bannerView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(self.banner);
//        make.width.equalTo(@(300));
//        make.height.equalTo(@(250));
//    }];
}

- (void)txAdBanner:(TXADBannerView *)bannerView didFailToReceiveAdWithError:(TXADAdError *)adError {
    NSLog(@"TXADBannerView didFailToReceiveAdWithError %d, adunitID: %@" , (int)[adError getCode], bannerView.adUnitId);
    [self.view makeToast:@"load failed" duration:3.0 position:CSToastPositionCenter];
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



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
