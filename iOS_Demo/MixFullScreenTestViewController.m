//
//  MixFullScreenTestViewController.m
//  iOS_AutoTest
//
//  Created by TaurusXAd on 2019/10/16.
//  Copyright © 2019 we. All rights reserved.
//

#import "MixFullScreenTestViewController.h"
@import SNebulaAds;
#import "Masonry.h"
#import "macro.h"
#import "UIView+Toast.h"

@interface MixFullScreenTestViewController () <TXADMixFullScreenAdDelegate>

@property (nonatomic, strong) TXADMixFullScreenAd *mixFullScreenAd;
@property (nonatomic, strong) UIButton *showIntBtn;

@property (nonatomic, strong) TXADNativeAdLayout *nativeLayout;

@property (nonatomic, strong) UITextField *sceneText;

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
    [self.view addSubview:testloadIntBtn];
    [testloadIntBtn setTitle:@"load" forState:UIControlStateNormal];
    //[testloadIntBtn setBackgroundColor:[UIColor blueColor]];
    [testloadIntBtn setTitleColor:[UIColor colorWithRed:28.0/255.0 green:147.0/255.0 blue:243.0/255.0 alpha:1.0]  forState:UIControlStateNormal];
    [testloadIntBtn setTitleColor:[UIColor colorWithRed:135.0/255.0 green:216.0/255.0 blue:80.0/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [testloadIntBtn setTitleColor:[UIColor lightGrayColor]  forState:UIControlStateDisabled];
    [testloadIntBtn addTarget:self action:@selector(loadMixFullScreenAd) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *testshowIntBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:testshowIntBtn];
    [testshowIntBtn setTitle:@"show" forState:UIControlStateNormal];
    //[testshowIntBtn setBackgroundColor:[UIColor blueColor]];
    [testshowIntBtn setTitleColor:[UIColor colorWithRed:28.0/255.0 green:147.0/255.0 blue:243.0/255.0 alpha:1.0]  forState:UIControlStateNormal];
    [testshowIntBtn setTitleColor:[UIColor colorWithRed:135.0/255.0 green:216.0/255.0 blue:80.0/255.0 alpha:1.0] forState:UIControlStateHighlighted];
     [testshowIntBtn setTitleColor:[UIColor lightGrayColor]  forState:UIControlStateDisabled];
    [testshowIntBtn addTarget:self action:@selector(showMixFullScreenAd) forControlEvents:UIControlEventTouchUpInside];
    testshowIntBtn.enabled = NO;
    self.showIntBtn = testshowIntBtn;
    
    [testloadIntBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(header.mas_bottom).offset(10);
        make.left.equalTo(self.view).offset(30);
        make.width.equalTo(@(100));
        make.height.equalTo(@(20));
    }];
    
    [testshowIntBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(header.mas_bottom).offset(10);
        make.right.equalTo(self.view).offset(-30);
        make.width.equalTo(@(100));
        make.height.equalTo(@(20));
    }];
    
    //[self createLayout];
    [self createDefaultLayout];
    
    UILabel *sceneId = [[UILabel alloc] init];
    sceneId.text = @"scene id: ";
    [self.view addSubview:sceneId];
        
    [sceneId mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(testshowIntBtn.mas_bottom).offset(50);
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
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void) closePage {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)createLayout {
    UIView *rootView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth-20, 250)];
    
    [rootView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(ScreenWidth-20));
        make.height.equalTo(@(250));
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
    self.nativeLayout = [TXADNativeAdLayout getFullLayout4];
}

- (void) createMixFullScreenAd {
    self.mixFullScreenAd = [[TXADMixFullScreenAd alloc] initWithAdUnitId:self.adUnitID];
    self.mixFullScreenAd.delegate = self;
    [self.mixFullScreenAd setNativeAdLayout:self.nativeLayout];
}

#pragma  mark intersitial
- (void) loadMixFullScreenAd {
     if (!useAdLoader) {
        if (self.mixFullScreenAd == nil) {
            [self createMixFullScreenAd];
        }
        [self.mixFullScreenAd loadAd];
        [self.mixFullScreenAd enterAdScene:@"loadMixFulScreen"];
     } else {
         TXADMixFullScreenAd *ad = [TXADAdLoader getMixFullScreenAd:self.adUnitID];
         ad.delegate = self;
         [TXADAdLoader loadMixFullScreenAd:self.adUnitID nativeAdLayout:self.nativeLayout];
     }
}

- (void)showMixFullScreenAd {
    if (!useAdLoader) {
        if ([self.mixFullScreenAd isReady:@"loadMixFulScreen"])
        {
            [self.mixFullScreenAd showFromViewController:self sceneId:self.sceneText.text];
        }
    } else {
        if ([TXADAdLoader isMixFullScreenAdReady:self.adUnitID]) {
            [TXADAdLoader showMixFullScreenAd:self.adUnitID viewController:self sceneId:self.sceneText.text];
        }
    }
}

#pragma mark <WECreativeMixFullScreenAdDelegate>
- (void)txAdMixFullScreenAd:(TXADMixFullScreenAd *)mixFullScreenAd didReceiveAd:(TXADILineItem *)lineItem {
    NSLog(@"TXADMixFullScreenAdAd txAdMixFullScreenAdDidReceiveAd, mixFullScreenAd.adUnitId is %@", mixFullScreenAd.adUnitId);
    self.showIntBtn.enabled = YES;
}

- (void)txAdMixFullScreenAd:(TXADMixFullScreenAd *)mixFullScreenAd didFailToReceiveAdWithError:(TXADAdError *)adError{
    NSLog(@"TXADMixFullScreenAdAd didFailToReceiveAdWithError %d", (int)[adError getCode]);
    
    [self.view makeToast:@"load failed" duration:3.0 position:CSToastPositionCenter];
}

- (void)txAdMixFullScreenAd:(TXADMixFullScreenAd *)mixFullScreenAd willPresentScreen:(TXADILineItem *)lineItem {
    NSLog(@"TXADMixFullScreenAdAd txAdMixFullScreenAdWillPresentScreen, mixFullScreenAd adUnitId is %@", mixFullScreenAd.adUnitId);
}

- (void)txAdMixFullScreenAd:(TXADMixFullScreenAd *)mixFullScreenAd didDismissScreen:(TXADILineItem *)lineItem {
    NSLog(@"TXADMixFullScreenAdAd txAdMixFullScreenAdDidDismissScreen, mixFullScreenAd adUnitId is %@, tid:%@", mixFullScreenAd.adUnitId, [lineItem getTId]);
    self.showIntBtn.enabled = NO;
}

- (void)txAdMixFullScreenAd:(TXADMixFullScreenAd *)mixFullScreenAd willLeaveApplication:(TXADILineItem *)lineItem {
    NSLog(@"TXADMixFullScreenAdAd txAdMixFullScreenAdWillLeaveApplication, mixFullScreenAd adUnitId is %@", mixFullScreenAd.adUnitId);
}

- (void)txAdMixFullScreenAd:(TXADMixFullScreenAd *)mixFullScreenAd videoStart:(TXADILineItem *)lineItem {
    NSLog(@"TXADMixFullScreenAdAd videoStart, mixFullScreenAd adUnitId is %@", mixFullScreenAd.adUnitId);
}


- (void)txAdMixFullScreenAd:(TXADMixFullScreenAd *)mixFullScreenAd videoComplete:(TXADILineItem *)lineItem {
    NSLog(@"TXADMixFullScreenAdAd videoComplete, mixFullScreenAd adUnitId is %@", mixFullScreenAd.adUnitId);
}

- (void)txAdMixFullScreenAd:(TXADMixFullScreenAd *)mixFullScreenAd didReward:(TXADILineItem *)lineItem item:(TXADRewardItem *)item {
    NSLog(@"TXADMixFullScreenAdAd didReward, mixFullScreenAd adUnitId is %@, tid:%@", mixFullScreenAd.adUnitId, [lineItem getTId]);
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
