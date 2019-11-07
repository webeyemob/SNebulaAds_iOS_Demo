//
//  NativeAdView.h
//  WeMobiOSTest
//
//  Created by 王航 on 2019/6/22.
//  Copyright © 2019年 王航. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NativeAdView : UIView

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *subTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *bodyLabel;
@property (strong, nonatomic) IBOutlet UILabel *advertiserLabel;
@property (strong, nonatomic) IBOutlet UIView *mediaView;
@property (strong, nonatomic) IBOutlet UIView *iconView;
@property (strong, nonatomic) IBOutlet UIView *adChoicesView;
@property (strong, nonatomic) IBOutlet UILabel *storeLabel;
@property (strong, nonatomic) IBOutlet UILabel *priceLabel;
@property (strong, nonatomic) IBOutlet UILabel *ratingLabel;
@property (strong, nonatomic) IBOutlet UILabel *ratingCallbackLabel;
@property (strong, nonatomic) IBOutlet UIButton *callToActionLabel;

@end
