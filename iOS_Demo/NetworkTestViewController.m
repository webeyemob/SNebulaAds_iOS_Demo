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
@property (nonatomic, strong) NSArray *sortedArray;
@property (nonatomic, strong) NSMutableArray *adsArr;
@end

@implementation NetworkTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    // Do any additional setup after loading the view.
    _netWorksDic = @{@"AdColony": @[@"f0963a3d-6f80-4ac0-8414-f9005de4e525", @"b03fecaf-69e2-4b76-b81d-d2ce2428ea49",
                                          @"", @"18fca7ad-eaa5-49a7-a9c8-1c860af54fb8", @"", @"", @"",@""],
                           @"Admob": @[@"260a7430-acd9-4dec-a4f2-e24a08855212", @"833c620a-4fb3-4268-a733-88cb30f5eb90", @"9007ea51-bb55-4e6d-b57c-ba3924ba4a1e", @"b6e0a185-3738-470a-a1dd-aa9c9db3fbe0", @"745757d4-7f27-4ff2-8856-11ca47914898", @"381d5515-c86c-4e42-865b-d348e740ab6f", @"3266a141-8771-428d-bd56-ff8b0076ea9b",@""],
                           @"AdGeneration": @[@"8544f540-bc56-4177-b4c8-6f4daf18e06c", @"e34bbdba-6c36-4d1e-a4a8-fe2c787b498b", @"5b465d9f-dcba-47d2-81ae-3ace1e905f33", @"", @"", @"1d591af3-7184-49f6-a6d0-5eef158b8504", @"babb0ddb-88b7-430c-be93-291ee223c52b",@""],
                           @"Amazon": @[@"b6f1b556-846c-4b83-bdc1-d7f2483e55c1", @"a2b17126-0b61-4e61-be08-32fefa9fa355", @"", @"", @"", @"", @"",@""],
                           @"AppLovin": @[@"5a4ec11a-517b-47f5-86ce-a85b56fa8aea", @"7bacc417-e6cb-4893-9606-7746e608424b", @"2ffa7e68-2615-4ee0-b693-6b44199bcc58", @"5c7a2b41-5a44-4924-ac81-c711096fedf6", @"", @"cbed7422-8ed8-4b24-b78e-009ec47aceda", @"86029578-83ce-41ba-a047-41d442c8854f",@""],
                           @"Baidu": @[@"482b2551-68fc-4f66-bcf7-34f6fd5886fa", @"9b8ec564-8f6e-4718-a422-edfe721e6deb", @"fd1dfc46-1994-4dbc-b524-186aa69ddb9d", @"13833c8d-e4f1-4bce-94e6-91c1ba32e3d1", @"e69df2ed-406c-4a87-a791-7045bec52f6d", @"6eae4ec7-4255-4a40-8d9a-691acf859e50", @"0443c180-8414-406b-9b81-373b0fbc5c93", @"9bee7b8b-60c4-4e75-8a49-e6e405bc9893"],
                           @"Chartboost": @[@"85a6b55c-5ca3-410d-b674-3d94dfa33577", @"f8ae6d45-dfb0-4779-b886-f972c57e7fa8", @"", @"7f4fc9c0-c73d-46bd-bbb2-893366d731b2", @"", @"", @"",@""],
                           @"Criteo": @[@"08047dd3-8259-4f4c-9542-e4c1c770465d", @"3aae3e21-37b9-4717-a844-69c8895684a3", @"", @"", @"", @"", @"",@""],
                           @"DFP": @[@"74e81da4-e35d-4ab3-9594-49d45f31baef", @"e3bdf261-5f5c-4373-9be3-8a33f5d90cdb", @"374fec30-1e64-4bce-80f0-52ade0e1b4fa", @"a90612c7-f0e9-4f0d-bf0a-1a0da044eee4", @"29b5f82c-ac72-400f-80af-6ea2f25a57c8", @"d2ba90e3-8978-4a10-829e-a71d9f95c834", @"43309363-b2e0-4674-9599-b428e80f30ca",@""],
                           @"DisplayIO": @[@"cb4d50e6-c830-4d7e-b33c-db6040447fe9", @"9c870974-4b79-400b-9c06-77a43745e145", @"", @"0e99ee22-4f9c-4203-9206-6df8cb410499", @"", @"", @"",@""],
                           @"DU AD Platform": @[@"dddc68cd-3bb1-45d1-853d-7d5383e68fc7", @"c997d32b-d13a-46e1-8247-fb569f20afe2", @"4e09ec7d-c62e-4446-b021-7b7f37e947ce", @"", @"", @"e442fde0-d698-4b79-a08b-6355c995fe7d", @"",@""],
                           @"Facebook": @[@"90302de7-2d6e-4560-b6e7-1af5d567e72f", @"73fb1092-d6eb-4813-85db-29df120b4c6d", @"d2eab5cd-04b0-440a-a775-176183b4c5fd", @"dcf9244e-2a86-49e6-a4bd-2e7d828a9719", @"", @"ca00ab2c-ba60-49ff-99d5-048174178048", @"2d99ffd0-2e55-4c82-b5d4-bc0a6c313cca",@""],
                           @"Five": @[@"2c766777-13a7-47b5-b855-762f200f7d0b", @"b424c14c-8a37-4e96-b74b-e2fea472e2de", @"", @"1bd2c3d0-a46e-45a4-b580-d67be7b96a2e", @"", @"", @"",@""],
                           @"Flurry": @[@"9da72407-51f7-4e9e-8928-889696ece7e5", @"6b3ef504-5964-43ce-91d8-f51a54274f5a", @"a5cbbcfe-d7ac-4baa-bbb9-990000bfbd6b", @"66a04cde-003f-4223-824d-6dc9f6f1221c", @"", @"7ffeef1b-06ac-4f40-b03a-9a22c9df0b7b", @"7ffeef1b-06ac-4f40-b03a-9a22c9df0b7b",@""],
                           @"Fyber": @[@"34c9bbcb-50be-40aa-bd30-13ae100d8a6b", @"b861d69a-ca96-42b0-a882-9c6c822acc89", @"", @"880071c0-5263-4db8-893a-d39ffd5a6d95", @"", @"1cba0098-813a-414d-a65c-c447410e0bcb", @"812da3e9-cf5d-4edc-9697-149eaee05270",@""],
                           @"GDT": @[@"522767ca-3d4f-4399-b654-ada7c06ed904", @"d978890e-23f4-4fe6-b415-f11f66270025", @"54e45182-2b75-49ca-812d-ea3eea7387a3", @"b156abf1-2767-4073-a7a5-bdaf6026f032", @"803fea96-4403-44f7-9ec9-7e96a1a91a29", @"6bd66c4e-c520-4680-84e3-322abd85daf8", @"db54e3df-6a1d-4189-90df-ee6b0e231e24", @"cfc8a9ef-0dcd-490c-b093-b1bd9ffb800c"],
                            @"I-Mobile": @[@"789f6106-4271-469f-bdbe-61d570a2dc2f", @"0aefe90d-ebc9-4414-aaa4-8fb1532bbdef", @"d85a1436-0453-4e50-a3d8-3bffcf0ba906", @"", @"", @"", @"",@""],
                            @"InMobi": @[@"789f6106-4271-469f-bdbe-61d570a2dc2f", @"0aefe90d-ebc9-4414-aaa4-8fb1532bbdef", @"d85a1436-0453-4e50-a3d8-3bffcf0ba906", @"", @"", @"", @"",@""],
                           @"IronSource": @[@"db4892b3-309d-4cee-b14a-27ce231c8278", @"213c91c0-232a-4e5a-b33e-4e681eb77e87", @"", @"fe23a332-c86b-4dd9-8d8f-5567d83e489d", @"", @"", @"",@""],
                           @"KuaiShou": @[@"", @"b6cd35cb-1e86-48cd-a94c-6fc325d04807", @"e2738494-f1e0-46ee-8154-1e995c1d61b9", @"6e9a103c-eca1-4ce5-bf2e-9e72191762f9", @"86aa7899-ae1d-4b5d-9428-77b6457e9619", @"", @"",@""],
                           @"Maio": @[@"", @"cbf35d4d-622e-4465-8d7a-d803415561b3", @"", @"8dc2c295-0663-4c67-906c-30a718a5af9e", @"", @"", @"",@""],
                           @"Marketplace": @[@"35b2f7fc-a0f8-4bc4-a8b9-ede18f3bbcdc", @"ae68976b-cefc-4153-aab3-82b93cb5372b", @"27a0aad5-1d33-465c-9738-f908b402bf88", @"46db4ee2-c7a7-4d46-b273-64faaabf5fce", @"", @"28771158-b638-4672-a9b1-1c04bbcdd678", @"d004fb25-1041-444d-8dd4-7876727ace71",@""],
                           @"Mopub": @[@"3e6c21ae-efe5-47f1-9118-ac43f9ece5c0", @"e171e8af-8ad1-4faf-806e-fcb75bd3ed36", @"dffb5339-7971-41cc-a814-a46f0c4ec4cf", @"c6abc185-6d96-4168-9690-5356f779770e", @"", @"fdb2077c-cfec-4811-9138-1dd08ade3a7a", @"b1cd9895-b43c-466d-94fa-153064651c0f",@""],
                           @"Mobvista": @[@"c1ba5bb5-ca70-4ff9-9fd6-7022625b8646", @"c2ef033c-3405-4488-9148-50281962fed6", @"6f3d1528-4389-4ba4-af70-eb4114143ab0", @"8721f6e0-f0ff-41ab-92cc-38ce6c2ec65e", @"1669a846-9acc-49d2-a977-2f1eb3805d16", @"f4a20e31-c636-40f0-b172-2812a6a77b95", @"14ae5c8d-8e4b-4d69-a674-d2867ed5e4e1",@""],
                           @"Nend": @[@"3c570f15-17e7-49b6-b870-9e99e576d785", @"af471689-8f42-4dbb-8af8-8d89419f1e61", @"df6a54e9-5264-420b-81e4-e1a8cfbd601e", @"c4c74261-2976-4b33-8a98-ecb3f2a43e22", @"", @"792ca51d-de2e-4b79-84f0-a69411fdbe1f", @"323601f9-633f-49f2-b6e6-807117cb611d",@""],
                            @"Tapjoy":@[@"", @"ba08236a-ea5e-4137-80ac-ee21e86c6a47", @"", @"9ec0a0fa-e21b-453b-b052-1d760e8554fc", @"", @"", @"",@""],
                           @"Tiktok":@[@"f5e34294-4ce4-48fe-a400-6e3f1289c397", @"f2079959-2b7d-4177-ad75-7a46f35311d8", @"be126dd8-1cea-45dc-876d-0f4a0b3b9c20", @"c6907083-d63a-46a7-a5b8-3ebd46a6fc72", @"5a62d07f-ead0-4c0d-b503-aca2b87f99a6", @"e0541bbb-c065-4659-9c56-8d9128ee116e", @"dff07570-c609-4752-b554-f303818c2199", @"2d5538a5-d686-4567-af9f-464dd3f2b956"],
                           @"Unity Ads": @[@"58f48a0c-371a-492a-bf71-31df58e161f4", @"b1384aa1-9391-453b-93e8-5228730a4bed", @"", @"6f4e0465-969c-49fd-8dfb-832b5548c09b", @"", @"", @"",@""],
                           @"Vungle": @[@"e8fbe4f1-5fab-4abc-ba51-747f26246df1", @"3f5a47fa-57ab-4d7f-a57c-6b53eb11410b", @"809f33f6-591d-4d47-a669-e7df653ae716", @"5c4daea1-ea30-419d-a4d5-3f72f1748998", @"", @"", @"",@""]
                           };
    //get all key in dic
     NSArray *keyArray = [_netWorksDic allKeys];
         
     //order key
    _sortedArray = [keyArray sortedArrayUsingComparator:^NSComparisonResult(id obj1,id obj2) {
             return[obj1 compare:obj2 options:NSNumericSearch];
     }];
    
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
    
    cell.textLabel.text = _sortedArray[indexPath.row];
    [cell.textLabel setTextColor:[UIColor colorWithRed:28.0/255.0 green:147.0/255.0 blue:243.0/255.0 alpha:1.0]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    AdTypeViewController *adsTestVc = [[AdTypeViewController alloc] init];
    adsTestVc.modalPresentationStyle = UIModalPresentationFullScreen;
    NSString *key = _sortedArray[indexPath.row];
    adsTestVc.titleStr =  key;
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
    if (![ads[5] isEqualToString:@""]) {
        [adTypes addObject: @[@"MixView", ads[5]]];
    }
    if (![ads[6] isEqualToString:@""]) {
        [adTypes addObject: @[@"MixFullScreen", ads[6]]];
    }
    if (![ads[7] isEqualToString:@""]) {
        [adTypes addObject: @[@"Splash", ads[7]]];
    }
    adsTestVc.adsDic = [NSArray arrayWithArray:adTypes];
    
    [self presentViewController:adsTestVc animated:YES completion:nil];
}

@end
