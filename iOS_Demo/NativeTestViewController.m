//
//  NativeTestViewController.m
//  iOS_AutoTest
//
//  Created by TaurusXAd on 2019/10/16.
//  Copyright © 2019 we. All rights reserved.
//

#import "NativeTestViewController.h"
@import TaurusXAds;
#import "Masonry.h"
#import "macro.h"
#import <TaurusXAdMediation_Vungle/TaurusXAdMediation_Vungle.h>
#import "NativeAdView.h"
#import "UIView+Toast.h"

@interface NativeTestViewController () <TXADNativeAdDelegate>

@property (nonatomic, strong) TXADNativeAd *nativeAd;
@property (nonatomic, strong) UIView *nativeAdView;

@property (nonatomic, strong) UIButton *showNativeBtn;
@property (nonatomic, strong) TXADNativeAdLayout *nativeLayout;

@property (nonatomic, strong) UITextField *sceneText;

@end

@implementation NativeTestViewController

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
       
    
    UIButton *loadNativeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:loadNativeBtn];
    [loadNativeBtn setTitle:@"load" forState:UIControlStateNormal];
    //[loadNativeBtn setBackgroundColor:[UIColor blueColor]];
    [loadNativeBtn setTitleColor:[UIColor colorWithRed:28.0/255.0 green:147.0/255.0 blue:243.0/255.0 alpha:1.0]  forState:UIControlStateNormal];
    [loadNativeBtn setTitleColor:[UIColor colorWithRed:135.0/255.0 green:216.0/255.0 blue:80.0/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [loadNativeBtn setTitleColor:[UIColor lightGrayColor]  forState:UIControlStateDisabled];
    [loadNativeBtn addTarget:self action:@selector(loadNative) forControlEvents:UIControlEventTouchUpInside];
    
    [loadNativeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(header.mas_bottom).offset(10);
        make.centerX.equalTo(self.view);
        make.width.equalTo(@(120));
        make.height.equalTo(@(20));
    }];
    
    UILabel *sceneId = [[UILabel alloc] init];
    sceneId.text = @"scene id: ";
    [self.view addSubview:sceneId];
        
    [sceneId mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(loadNativeBtn.mas_bottom).offset(20);
        make.left.equalTo(self.view).offset(20);
        make.width.equalTo(@(100));
        make.height.equalTo(@(40));
    }];
    
    UITextField *textField1 = [[UITextField alloc]init];
    [self.view addSubview:textField1];
    textField1.borderStyle = UITextBorderStyleRoundedRect;

    self.sceneText = textField1;
        
    [textField1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(sceneId);
        make.left.equalTo(sceneId.mas_right).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.height.equalTo(@(40));
    }];
    
    self.showNativeBtn = loadNativeBtn;
    
    //[self createNativeLayout];    // nativeLayout
    [self createDefaultLayout]; //get default NativeLayout
    //[self createxibLayout];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void) closePage {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)createxibLayout {
    NSArray *nibViewArray = [[NSBundle mainBundle] loadNibNamed:@"NativeAdView" owner:nil options:nil];
    NativeAdView *nativeAdView = nibViewArray.firstObject;
    
    // 设置 TXADNativeAdLayout 元素
    TXADNativeAdLayout *layout = [[TXADNativeAdLayout alloc] init];
    layout.rootView = nativeAdView;
    layout.titleLabel = nativeAdView.titleLabel;
    layout.bodyLabel = nativeAdView.bodyLabel;
    layout.advertiserLabel = nativeAdView.advertiserLabel;
    layout.callToActionView = nativeAdView.callToActionLabel;
    layout.mediaView = nativeAdView.mediaView;
    layout.iconView = nativeAdView.iconView;
    layout.adChoicesView = nativeAdView.adChoicesView;
    layout.ratingLabel = nativeAdView.ratingLabel;
    layout.ratingCallback = ^(double rating) {
    if (rating > 0) {
            // 用五角星图片展示评分
        } else {
            // 不展示评分
        }
    };
    
    self.nativeLayout = layout;
    
    [layout.rootView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(ScreenWidth));
        make.height.equalTo(@(550));
    }];
    
    UIView *adView = [[UIView alloc] init];
    
    [adView setBackgroundColor:[UIColor colorWithRed:206.0/255.0 green:206.0/255.0 blue:206.0/255.0 alpha:1]];
    [self.view addSubview:adView];
    adView.layer.borderColor = [UIColor colorWithRed:36.0/255.0 green:189.0/255.0 blue:155.0/255.0 alpha:1].CGColor;
    adView.layer.cornerRadius = 10;
    adView.layer.borderWidth = 2;
    self.nativeAdView = adView;
    
    [adView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).offset(-10);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(self.showNativeBtn.mas_bottom).offset(60);
    }];
    
    adView.hidden = YES;
}

- (void)createNativeLayout {
    UIView *adView = [[UIView alloc] init];
    
    [adView setBackgroundColor:[UIColor colorWithRed:206.0/255.0 green:206.0/255.0 blue:206.0/255.0 alpha:1]];
    [self.view addSubview:adView];
    adView.layer.borderColor = [UIColor colorWithRed:36.0/255.0 green:189.0/255.0 blue:155.0/255.0 alpha:1].CGColor;
    adView.layer.cornerRadius = 10;
    adView.layer.borderWidth = 2;
    self.nativeAdView = adView;
    
    [adView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).offset(-10);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(self.showNativeBtn.mas_bottom).offset(80);
    }];
    
    adView.hidden = YES;
    
    UIView *rootView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 480)];
    
    [rootView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(ScreenWidth));
        make.height.equalTo(@(480));
    }];

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
    
    UIView *adChoiceView = [[UIView alloc] initWithFrame:CGRectMake(ScreenWidth-80, 230, 10, 10)];
    [rootView addSubview:adChoiceView];
    
    TXADNativeAdLayout *layout = [[TXADNativeAdLayout alloc] init];
    layout.rootView = rootView;
    layout.titleLabel = title;
    layout.bodyLabel = desc;
    layout.mediaView = mediaView;
    layout.callToActionView = btn;
    layout.adChoicesView = adChoiceView;
    layout.iconView = icon;
        
    self.nativeLayout = layout;
}

- (void)createDefaultLayout {
    UIView *adView = [[UIView alloc] init];
        
    [adView setBackgroundColor:[UIColor colorWithRed:206.0/255.0 green:206.0/255.0 blue:206.0/255.0 alpha:1]];
    [self.view addSubview:adView];
    adView.layer.borderColor = [UIColor colorWithRed:36.0/255.0 green:189.0/255.0 blue:155.0/255.0 alpha:1].CGColor;
    adView.layer.cornerRadius = 10;
    adView.layer.borderWidth = 2;
    self.nativeAdView = adView;
    
    [adView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.showNativeBtn.mas_bottom).offset(80);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
    
    adView.hidden = YES;

    self.nativeLayout = [TXADNativeAdLayout getLargeLayout4WithWidth:ScreenWidth-10];
}

- (void) createNative {
    self.nativeAd = [[TXADNativeAd alloc] initWithAdUnitId:self.adUnitID];
    self.nativeAd.delegate = self;

    TXADNetworkConfigs *configs = [[TXADNetworkConfigs alloc] init];

    [self.nativeAd setNetworkConfigs:configs];
    [self.nativeAd setNativeAdLayout:self.nativeLayout];
}

- (void) loadNative {
    if (!useAdLoader) {
        if(self.nativeAd == nil) {
            [self createNative];
        }
        [self.nativeAd loadAd];
    } else {
        TXADNativeAd *ad = [TXADAdLoader getNativeAd:self.adUnitID];
        ad.delegate = self;
        [TXADAdLoader loadNativeAd:self.adUnitID nativeAdLayout:self.nativeLayout];
    }
}

- (void)showNative {
    if (!useAdLoader) {
        if (self.nativeAd.isReady) {
            UIView *adView = [self.nativeAd getAdView:self.sceneText.text];
            
            for (UIView *view in self.nativeAdView.subviews) {
                [view removeFromSuperview];
            }
            
            [self.nativeAdView addSubview:adView];
            
            // for default layout
            [adView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(self.nativeAdView);
                make.centerY.equalTo(self.nativeAdView);
            }];
        

            self.nativeAdView.hidden = NO;
        }
    } else {
        if ([TXADAdLoader isNativeAdReady:self.adUnitID] ) {
            [TXADAdLoader showNativeAd:self.adUnitID container:self.nativeAdView sceneId:self.sceneText.text];
            self.nativeAdView.hidden = NO;
        }
    }
}


#pragma mark <TXADInnerNativeAdDelegate>
- (void)txAdNativeAdDidReceiveAd:(TXADNativeAd *)nativeAd {
    NSLog(@"TXADNativeAd txAdNativeAdDidReceiveAd, nativeAd.adUnitId is %@", nativeAd.adUnitId);
    [self showNative];
//    self.showNativeBtn.enabled = YES;
}


- (void)txAdNativeAd:(TXADNativeAd *)nativeAd didFailToReceiveAdWithError:(TXADAdError *)adError{
    NSLog(@"TXADNativeAd didFailToReceiveAdWithError %d", (int)[adError getCode]);
    [self.view makeToast:@"load failed" duration:3.0 position:CSToastPositionCenter];
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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
