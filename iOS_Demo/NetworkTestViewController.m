//
//  NetworkTestViewController.m
//  TaurusAds_iOS_TestApp
//
//  Created by tang on 2019/7/10.
//  Copyright © 2019 we. All rights reserved.
//

#import "NetworkTestViewController.h"
#import "Masonry.h"
#import "AdTypeViewController.h"
#import "macro.h"

@interface NetworkTestViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSDictionary *netWorksDic;
@property (nonatomic, strong) NSMutableArray *adsArr;
@end

@implementation NetworkTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    // Do any additional setup after loading the view.
    NSDictionary * dic = @{@"AdColony": @[@"", @"b03fecaf-69e2-4b76-b81d-d2ce2428ea49",
                                          @"", @"18fca7ad-eaa5-49a7-a9c8-1c860af54fb8", @""],
                           @"Admob": @[@"260a7430-acd9-4dec-a4f2-e24a08855212", @"833c620a-4fb3-4268-a733-88cb30f5eb90", @"9007ea51-bb55-4e6d-b57c-ba3924ba4a1e", @"b6e0a185-3738-470a-a1dd-aa9c9db3fbe0", @""],
                           @"AdGeneration": @[@"8544f540-bc56-4177-b4c8-6f4daf18e06c", @"e34bbdba-6c36-4d1e-a4a8-fe2c787b498b", @"5b465d9f-dcba-47d2-81ae-3ace1e905f33", @"", @""],
                           @"Amazon": @[@"b6f1b556-846c-4b83-bdc1-d7f2483e55c1", @"a2b17126-0b61-4e61-be08-32fefa9fa355", @"", @"", @""],
                           @"AppLovin": @[@"5a4ec11a-517b-47f5-86ce-a85b56fa8aea", @"7bacc417-e6cb-4893-9606-7746e608424b", @"2ffa7e68-2615-4ee0-b693-6b44199bcc58", @"5c7a2b41-5a44-4924-ac81-c711096fedf6", @""],
                           @"Chartboost": @[@"", @"f8ae6d45-dfb0-4779-b886-f972c57e7fa8", @"", @"7f4fc9c0-c73d-46bd-bbb2-893366d731b2", @""],
                           @"Criteo": @[@"08047dd3-8259-4f4c-9542-e4c1c770465d", @"3aae3e21-37b9-4717-a844-69c8895684a3", @"", @"", @""],
                           @"DFP": @[@"74e81da4-e35d-4ab3-9594-49d45f31baef", @"e3bdf261-5f5c-4373-9be3-8a33f5d90cdb", @"374fec30-1e64-4bce-80f0-52ade0e1b4fa", @"a90612c7-f0e9-4f0d-bf0a-1a0da044eee4", @""],
                           @"DisplayIO": @[@"cb4d50e6-c830-4d7e-b33c-db6040447fe9", @"9c870974-4b79-400b-9c06-77a43745e145", @"", @"", @""],
                           @"Facebook": @[@"90302de7-2d6e-4560-b6e7-1af5d567e72f", @"73fb1092-d6eb-4813-85db-29df120b4c6d", @"d2eab5cd-04b0-440a-a775-176183b4c5fd", @"dcf9244e-2a86-49e6-a4bd-2e7d828a9719", @""],
                           @"Flurry": @[@"9da72407-51f7-4e9e-8928-889696ece7e5", @"6b3ef504-5964-43ce-91d8-f51a54274f5a", @"a5cbbcfe-d7ac-4baa-bbb9-990000bfbd6b", @"66a04cde-003f-4223-824d-6dc9f6f1221c", @""],
                           @"GDT": @[@"522767ca-3d4f-4399-b654-ada7c06ed904", @"d978890e-23f4-4fe6-b415-f11f66270025", @"54e45182-2b75-49ca-812d-ea3eea7387a3", @"b156abf1-2767-4073-a7a5-bdaf6026f032", @"803fea96-4403-44f7-9ec9-7e96a1a91a29"],
                           @"IronSource": @[@"db4892b3-309d-4cee-b14a-27ce231c8278", @"213c91c0-232a-4e5a-b33e-4e681eb77e87", @"", @"fe23a332-c86b-4dd9-8d8f-5567d83e489d", @""],
                           @"Maio": @[@"", @"cbf35d4d-622e-4465-8d7a-d803415561b3", @"", @"8dc2c295-0663-4c67-906c-30a718a5af9e", @""],
                           @"Mopub": @[@"3e6c21ae-efe5-47f1-9118-ac43f9ece5c0", @"e171e8af-8ad1-4faf-806e-fcb75bd3ed36", @"dffb5339-7971-41cc-a814-a46f0c4ec4cf", @"c6abc185-6d96-4168-9690-5356f779770e", @""],
                           @"Nend": @[@"3c570f15-17e7-49b6-b870-9e99e576d785", @"af471689-8f42-4dbb-8af8-8d89419f1e61", @"df6a54e9-5264-420b-81e4-e1a8cfbd601e", @"c4c74261-2976-4b33-8a98-ecb3f2a43e22", @""],
                           @"Tiktok":@[@"f5e34294-4ce4-48fe-a400-6e3f1289c397", @"f2079959-2b7d-4177-ad75-7a46f35311d8", @"be126dd8-1cea-45dc-876d-0f4a0b3b9c20", @"c6907083-d63a-46a7-a5b8-3ebd46a6fc72", @"5a62d07f-ead0-4c0d-b503-aca2b87f99a6"],
                           @"Unity Ads": @[@"58f48a0c-371a-492a-bf71-31df58e161f4", @"b1384aa1-9391-453b-93e8-5228730a4bed", @"", @"6f4e0465-969c-49fd-8dfb-832b5548c09b", @""],
                           @"Vungle": @[@"e8fbe4f1-5fab-4abc-ba51-747f26246df1", @"3f5a47fa-57ab-4d7f-a57c-6b53eb11410b", @"", @"5c4daea1-ea30-419d-a4d5-3f72f1748998", @""]
                           };
    _netWorksDic = [[NSDictionary alloc] initWithDictionary:dic];
    
    UIView *header = [[UIView alloc] init];
    header.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:header];
    [header mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(kTopBarSafeHeight);
        make.bottom.equalTo(self.view.mas_top).offset(kTopBarSafeHeight+20);
    }];
    
    UILabel *titleLab =  [[UILabel alloc]init];
    titleLab.text = @"Network Test";
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
    
    UITableView *networksTab = [[UITableView alloc] init];
    networksTab.delegate = self;
    networksTab.dataSource = self;
    networksTab.userInteractionEnabled = YES;
    
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [networksTab setTableFooterView:view];
 
    
    [self.view addSubview:networksTab];
    
    [networksTab mas_makeConstraints:^(MASConstraintMaker *make) {
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
    return _netWorksDic.count;
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
    
    cell.textLabel.text = _netWorksDic.allKeys[indexPath.row];
    [cell.textLabel setTextColor:[UIColor colorWithRed:28.0/255.0 green:147.0/255.0 blue:243.0/255.0 alpha:1.0]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    AdTypeViewController *adsTestVc = [[AdTypeViewController alloc] init];
    adsTestVc.modalPresentationStyle = UIModalPresentationFullScreen;
    NSString *key = _netWorksDic.allKeys[indexPath.row];
    adsTestVc.titleStr =  _netWorksDic.allKeys[indexPath.row];
    NSArray *ads = _netWorksDic[key];
    NSMutableArray *adTypes =  [NSMutableArray new];
    if (![ads[0] isEqualToString:@""]) {
        [adTypes addObject: @[@"Banner", ads[0]]];
    }
    
    if (![ads[1] isEqualToString:@""]) {
        [adTypes addObject: @[@"Interstitial", ads[1]]];
    }
    
    if (![ads[2] isEqualToString:@""]) {
        [adTypes addObject: @[@"Native", ads[2]]];
    }
    
    if (![ads[3] isEqualToString:@""]) {
        [adTypes addObject: @[@"RewardedVideo", ads[3]]];
    }
    
    if (![ads[4] isEqualToString:@""]) {
        [adTypes addObject: @[@"FeedList", ads[4]]];
    }
    adsTestVc.adsDic = [NSArray arrayWithArray:adTypes];
    
    [self presentViewController:adsTestVc animated:YES completion:nil];
}

@end
