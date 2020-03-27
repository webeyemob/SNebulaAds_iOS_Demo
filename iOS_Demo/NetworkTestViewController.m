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
    _netWorksDic = @{@"AdColony": @[@{@"Banner": @[@{@"320*50": @"f0963a3d-6f80-4ac0-8414-f9005de4e525"}, @{@"300*250": @"f0963a3d-6f80-4ac0-8414-f9005de4e525"}]}, @{@"Interstitial": @[@{@"interstitial" : @"b03fecaf-69e2-4b76-b81d-d2ce2428ea49"}]}, @{@"RewardedVideo":@[@{@"RewardedVideo": @"18fca7ad-eaa5-49a7-a9c8-1c860af54fb8"}]}],
                     @"Admob": @[@{@"Banner": @[@{@"320*50": @"260a7430-acd9-4dec-a4f2-e24a08855212"}, @{@"300*250": @"260a7430-acd9-4dec-a4f2-e24a08855212"}]}, @{@"Interstitial": @[@{@"interstitial" : @"833c620a-4fb3-4268-a733-88cb30f5eb90"}]}, @{@"Native": @[@{@"native": @"9007ea51-bb55-4e6d-b57c-ba3924ba4a1e"}]}, @{@"RewardedVideo":@[@{@"RewardedVideo": @"b6e0a185-3738-470a-a1dd-aa9c9db3fbe0"}]}, @{@"FeedList":@[@{@"FeedList": @"745757d4-7f27-4ff2-8856-11ca47914898"}]}, @{@"MixView": @[@{@"banner320*50": @"381d5515-c86c-4e42-865b-d348e740ab6f"}]}, @{@"MixFullScreen":@[@{@"banner300*250" : @"3266a141-8771-428d-bd56-ff8b0076ea9b"}]}],
                     @"AdGeneration": @[@{@"Banner": @[@{@"320*50": @"8544f540-bc56-4177-b4c8-6f4daf18e06c"}, @{@"300*250": @"8544f540-bc56-4177-b4c8-6f4daf18e06c"}]}, @{@"Interstitial": @[@{@"interstitial" : @"e34bbdba-6c36-4d1e-a4a8-fe2c787b498b"}]}, @{@"Native": @[@{@"native": @"5b465d9f-dcba-47d2-81ae-3ace1e905f33"}]}, @{@"MixView": @[@{@"banner320*50": @"1d591af3-7184-49f6-a6d0-5eef158b8504"}]}, @{@"MixFullScreen":@[@{@"banner300*250" : @"babb0ddb-88b7-430c-be93-291ee223c52b"}]}],
                     @"Amazon": @[@{@"Banner": @[@{@"320*50": @"b6f1b556-846c-4b83-bdc1-d7f2483e55c1"}]}, @{@"Interstitial": @[@{@"interstitial" : @"a2b17126-0b61-4e61-be08-32fefa9fa355"}]}],
                    @"AppLovin": @[@{@"Banner": @[@{@"320*50": @"5a4ec11a-517b-47f5-86ce-a85b56fa8aea"}, @{@"300*250": @"5a4ec11a-517b-47f5-86ce-a85b56fa8aea"}]}, @{@"Interstitial": @[@{@"interstitial" : @"7bacc417-e6cb-4893-9606-7746e608424b"}]}, @{@"Native": @[@{@"native": @"2ffa7e68-2615-4ee0-b693-6b44199bcc58"}]}, @{@"RewardedVideo":@[@{@"RewardedVideo": @"5c7a2b41-5a44-4924-ac81-c711096fedf6"}]}, @{@"MixView": @[@{@"banner320*50": @"cbed7422-8ed8-4b24-b78e-009ec47aceda"}]}, @{@"MixFullScreen":@[@{@"banner300*250" : @"86029578-83ce-41ba-a047-41d442c8854f"}]}],
                    @"Baidu": @[@{@"Banner": @[@{@"320*50": @"482b2551-68fc-4f66-bcf7-34f6fd5886fa"}, @{@"300*250": @"482b2551-68fc-4f66-bcf7-34f6fd5886fa"}]}, @{@"Interstitial": @[@{@"interstitial" : @"9b8ec564-8f6e-4718-a422-edfe721e6deb"}]}, @{@"Native": @[@{@"native": @"fd1dfc46-1994-4dbc-b524-186aa69ddb9d"}]}, @{@"RewardedVideo":@[@{@"RewardedVideo": @"13833c8d-e4f1-4bce-94e6-91c1ba32e3d1"}]}, @{@"FeedList":@[@{@"FeedList": @"e69df2ed-406c-4a87-a791-7045bec52f6d"}]}, @{@"MixView": @[@{@"banner320*50": @"6eae4ec7-4255-4a40-8d9a-691acf859e50"}]}, @{@"MixFullScreen":@[@{@"banner300*250" : @"0443c180-8414-406b-9b81-373b0fbc5c93"}]}, @{@"Splash":@[@{@"splash" : @"9bee7b8b-60c4-4e75-8a49-e6e405bc9893"}]}],
                    @"Chartboost": @[@{@"Banner": @[@{@"320*50": @"85a6b55c-5ca3-410d-b674-3d94dfa33577"}]}, @{@"Interstitial": @[@{@"interstitial" : @"f8ae6d45-dfb0-4779-b886-f972c57e7fa8"}]}, @{@"RewardedVideo":@[@{@"RewardedVideo": @"7f4fc9c0-c73d-46bd-bbb2-893366d731b2"}]}],
                    @"Criteo": @[@{@"Banner": @[@{@"320*50": @"08047dd3-8259-4f4c-9542-e4c1c770465d"}]}, @{@"Interstitial": @[@{@"interstitial" : @"3aae3e21-37b9-4717-a844-69c8895684a3"}]}],
                    @"DFP": @[@{@"Banner": @[@{@"320*50": @"74e81da4-e35d-4ab3-9594-49d45f31baef"}, @{@"300*250": @"74e81da4-e35d-4ab3-9594-49d45f31baef"}]}, @{@"Interstitial": @[@{@"interstitial" : @"e3bdf261-5f5c-4373-9be3-8a33f5d90cdb"}]}, @{@"Native": @[@{@"native": @"374fec30-1e64-4bce-80f0-52ade0e1b4fa"}]}, @{@"RewardedVideo":@[@{@"RewardedVideo": @"a90612c7-f0e9-4f0d-bf0a-1a0da044eee4"}]}, @{@"FeedList":@[@{@"FeedList": @"29b5f82c-ac72-400f-80af-6ea2f25a57c8"}]}, @{@"MixView": @[@{@"banner320*50": @"d2ba90e3-8978-4a10-829e-a71d9f95c834"}]}, @{@"MixFullScreen":@[@{@"banner300*250" : @"43309363-b2e0-4674-9599-b428e80f30ca"}]}],
                    @"DisplayIO": @[@{@"Banner": @[@{@"320*50": @"cb4d50e6-c830-4d7e-b33c-db6040447fe9"}]}, @{@"Interstitial": @[@{@"interstitial" : @"9c870974-4b79-400b-9c06-77a43745e145"}]}, @{@"Native": @[@{@"native" : @"609f9bd6-dbd8-4571-ac3e-a3c1cfe62af7"}]}, @{@"RewardedVideo":@[@{@"RewardedVideo": @"0e99ee22-4f9c-4203-9206-6df8cb410499"}]}],
                    @"DU AD Platform": @[@{@"Banner": @[@{@"320*50": @"dddc68cd-3bb1-45d1-853d-7d5383e68fc7"}]}, @{@"Interstitial": @[@{@"interstitial" : @"c997d32b-d13a-46e1-8247-fb569f20afe2"}]}, @{@"Native": @[@{@"native" : @"4e09ec7d-c62e-4446-b021-7b7f37e947ce"}]}, @{@"MixView":@[@{@"banner320*50": @"e442fde0-d698-4b79-a08b-6355c995fe7d"}]}],
                    @"Facebook": @[@{@"Banner": @[@{@"320*50": @"90302de7-2d6e-4560-b6e7-1af5d567e72f"}, @{@"300*250": @"90302de7-2d6e-4560-b6e7-1af5d567e72f"}]}, @{@"Interstitial": @[@{@"interstitial" : @"73fb1092-d6eb-4813-85db-29df120b4c6d"}]}, @{@"Native": @[@{@"native": @"d2eab5cd-04b0-440a-a775-176183b4c5fd"}]}, @{@"RewardedVideo":@[@{@"RewardedVideo": @"dcf9244e-2a86-49e6-a4bd-2e7d828a9719"}]}, @{@"MixView": @[@{@"banner320*50": @"ca00ab2c-ba60-49ff-99d5-048174178048"}]}, @{@"MixFullScreen":@[@{@"banner300*250" : @"2d99ffd0-2e55-4c82-b5d4-bc0a6c313cca"}]}],
                    @"Five": @[@"2c766777-13a7-47b5-b855-762f200f7d0b", @"b424c14c-8a37-4e96-b74b-e2fea472e2de", @"", @"1bd2c3d0-a46e-45a4-b580-d67be7b96a2e", @"", @"", @"",@""],
                    @"Flurry": @[@{@"Banner": @[@{@"320*50": @"9da72407-51f7-4e9e-8928-889696ece7e5"}, @{@"300*250": @"9da72407-51f7-4e9e-8928-889696ece7e5"}]}, @{@"Interstitial": @[@{@"interstitial" : @"6b3ef504-5964-43ce-91d8-f51a54274f5a"}]}, @{@"Native": @[@{@"native": @"a5cbbcfe-d7ac-4baa-bbb9-990000bfbd6b"}]}, @{@"RewardedVideo":@[@{@"RewardedVideo": @"66a04cde-003f-4223-824d-6dc9f6f1221c"}]}, @{@"MixView": @[@{@"banner320*50": @"7ffeef1b-06ac-4f40-b03a-9a22c9df0b7b"}]}, @{@"MixFullScreen":@[@{@"banner300*250" : @"7ffeef1b-06ac-4f40-b03a-9a22c9df0b7b"}]}],
                    @"Fyber": @[@{@"Banner": @[@{@"320*50": @"34c9bbcb-50be-40aa-bd30-13ae100d8a6b"}, @{@"300*250": @"34c9bbcb-50be-40aa-bd30-13ae100d8a6b"}]}, @{@"Interstitial": @[@{@"interstitial" : @"b861d69a-ca96-42b0-a882-9c6c822acc89"}]}, @{@"RewardedVideo":@[@{@"RewardedVideo": @"880071c0-5263-4db8-893a-d39ffd5a6d95"}]}, @{@"MixView": @[@{@"banner320*50": @"1cba0098-813a-414d-a65c-c447410e0bcb"}]}, @{@"MixFullScreen":@[@{@"banner300*250" : @"812da3e9-cf5d-4edc-9697-149eaee05270"}]}],
                    @"GDT": @[@{@"Banner": @[@{@"320*50": @"522767ca-3d4f-4399-b654-ada7c06ed904"}, @{@"300*250": @"522767ca-3d4f-4399-b654-ada7c06ed904"}]}, @{@"Interstitial": @[@{@"interstitial" : @"d978890e-23f4-4fe6-b415-f11f66270025"}]}, @{@"Native": @[@{@"native": @"54e45182-2b75-49ca-812d-ea3eea7387a3"}]}, @{@"RewardedVideo":@[@{@"RewardedVideo": @"b156abf1-2767-4073-a7a5-bdaf6026f032"}]}, @{@"FeedList":@[@{@"FeedList": @"803fea96-4403-44f7-9ec9-7e96a1a91a29"}]}, @{@"MixView": @[@{@"banner320*50": @"6bd66c4e-c520-4680-84e3-322abd85daf8"}]}, @{@"MixFullScreen":@[@{@"banner300*250" : @"db54e3df-6a1d-4189-90df-ee6b0e231e24"}]}, @{@"Splash":@[@{@"splash" : @"cfc8a9ef-0dcd-490c-b093-b1bd9ffb800c"}]}],
                    @"I-Mobile": @[@{@"Banner": @[@{@"320*50": @"789f6106-4271-469f-bdbe-61d570a2dc2f"}]}, @{@"Interstitial": @[@{@"interstitial" : @"0aefe90d-ebc9-4414-aaa4-8fb1532bbdef"}]}, @{@"Native": @[@{@"native": @"d85a1436-0453-4e50-a3d8-3bffcf0ba906"}]}],
                    @"InMobi": @[@{@"Banner": @[@{@"320*50": @"4ecb5c23-d6d8-4f40-861d-132ab528ca4b"}, @{@"300*250": @"4ecb5c23-d6d8-4f40-861d-132ab528ca4b"}]}, @{@"Interstitial": @[@{@"interstitial" : @"bd5625a2-f8a6-40f2-a970-5a6e03751939"}]}, @{@"Native": @[@{@"native": @"1ac3e8a0-3fc9-4393-a756-ff79ac10c4e2"}]}, @{@"RewardedVideo":@[@{@"RewardedVideo": @"28dc4bbf-8dd4-4c91-a8ee-3bf62827082e"}]}, @{@"FeedList":@[@{@"FeedList": @"f002b284-05d4-45a6-8555-873d47b0670e"}]}, @{@"Splash":@[@{@"splash" : @"aede1061-35a3-41d4-9093-b61ba805fad2"}]}],
                    @"IronSource": @[@{@"Banner": @[@{@"320*50": @"db4892b3-309d-4cee-b14a-27ce231c8278"}]}, @{@"Interstitial": @[@{@"interstitial" : @"213c91c0-232a-4e5a-b33e-4e681eb77e87"}]}, @{@"RewardedVideo": @[@{@"rewardedVideo": @"fe23a332-c86b-4dd9-8d8f-5567d83e489d"}]}],
                    @"KuaiShou": @[@{@"Interstitial": @[@{@"interstitial" : @"b6cd35cb-1e86-48cd-a94c-6fc325d04807"}]}, @{@"Native": @[@{@"native": @"e2738494-f1e0-46ee-8154-1e995c1d61b9"}]},  @{@"RewardedVideo": @[@{@"rewardedVideo": @"6e9a103c-eca1-4ce5-bf2e-9e72191762f9"}]}, @{@"FeedList": @[@{@"FeedList": @"86aa7899-ae1d-4b5d-9428-77b6457e9619"}]}],
                    @"Maio": @[@{@"Interstitial": @[@{@"interstitial" : @"cbf35d4d-622e-4465-8d7a-d803415561b3"}]}, @{@"RewardedVideo": @[@{@"rewardedVideo": @"8dc2c295-0663-4c67-906c-30a718a5af9e"}]}],
                    @"Marketplace": @[@{@"Banner": @[@{@"320*50": @"1cb5d587-5801-4ac3-bdaf-3b3a950ef6f0"}, @{@"300*250": @"1cb5d587-5801-4ac3-bdaf-3b3a950ef6f0"}]}, @{@"Interstitial": @[@{@"interstitial" : @"f46922af-b059-4c80-9960-38c87bf5da9e"}]}, @{@"Native": @[@{@"native": @"27a0aad5-1d33-465c-9738-f908b402bf88"}]}, @{@"RewardedVideo":@[@{@"RewardedVideo": @"f939a944-1ebe-491a-91b3-2a40e4828fe4"}]}, @{@"FeedList":@[@{@"FeedList": @"6d29854c-65d6-4e19-8901-709d63ba2d3e"}]}, @{@"MixView":@[@{@"banner": @"040ec8c9-321d-43e2-b8b4-7dd1a17b8857"}]}, @{@"MixFullScreen":@[@{@"native": @"d004fb25-1041-444d-8dd4-7876727ace71"}]}, @{@"Splash":@[@{@"splash" : @"7f1d00b6-4b76-4565-8a43-e05414408903"}]}],
                    @"Mopub": @[@{@"Banner": @[@{@"320*50": @"3e6c21ae-efe5-47f1-9118-ac43f9ece5c0"}, @{@"300*250": @"3e6c21ae-efe5-47f1-9118-ac43f9ece5c0"}]}, @{@"Interstitial": @[@{@"interstitial" : @"e171e8af-8ad1-4faf-806e-fcb75bd3ed36"}]}, @{@"Native": @[@{@"native": @"dffb5339-7971-41cc-a814-a46f0c4ec4cf"}]}, @{@"RewardedVideo":@[@{@"RewardedVideo": @"c6abc185-6d96-4168-9690-5356f779770e"}]}, @{@"MixView":@[@{@"banner": @"fdb2077c-cfec-4811-9138-1dd08ade3a7a"}]}, @{@"MixFullScreen":@[@{@"native": @"b1cd9895-b43c-466d-94fa-153064651c0f"}]}],
                    @"Mobvista": @[@{@"Banner": @[@{@"320*50": @"c1ba5bb5-ca70-4ff9-9fd6-7022625b8646"}, @{@"300*250": @"c1ba5bb5-ca70-4ff9-9fd6-7022625b8646"}]}, @{@"Interstitial": @[@{@"interstitial" : @"c2ef033c-3405-4488-9148-50281962fed6"}]}, @{@"Native": @[@{@"native": @"6f3d1528-4389-4ba4-af70-eb4114143ab0"}]}, @{@"RewardedVideo":@[@{@"RewardedVideo": @"8721f6e0-f0ff-41ab-92cc-38ce6c2ec65e"}]}, @{@"FeedList":@[@{@"feedList": @"1669a846-9acc-49d2-a977-2f1eb3805d16"}]}, @{@"MixView":@[@{@"banner": @"f4a20e31-c636-40f0-b172-2812a6a77b95"}]}, @{@"MixFullScreen":@[@{@"native": @"14ae5c8d-8e4b-4d69-a674-d2867ed5e4e1"}]}],
                    @"Nend": @[@{@"Banner": @[@{@"320*50": @"3c570f15-17e7-49b6-b870-9e99e576d785"}, @{@"300*250": @"3c570f15-17e7-49b6-b870-9e99e576d785"}]}, @{@"Interstitial": @[@{@"interstitial" : @"af471689-8f42-4dbb-8af8-8d89419f1e61"}]}, @{@"Native": @[@{@"native": @"df6a54e9-5264-420b-81e4-e1a8cfbd601e"}]}, @{@"RewardedVideo":@[@{@"RewardedVideo": @"c4c74261-2976-4b33-8a98-ecb3f2a43e22"}]}, @{@"MixView":@[@{@"banner": @"792ca51d-de2e-4b79-84f0-a69411fdbe1f"}]}, @{@"MixFullScreen":@[@{@"native": @"323601f9-633f-49f2-b6e6-807117cb611d"}]}],
                     @"Sigmob": @[@{@"Interstitial": @[@{@"interstitial" : @"01c8b492-59f3-4397-8d59-f5096b1c2385"}]}, @{@"RewardedVideo": @[@{@"rewardedVideo": @"6b687064-aa91-43a0-a1a8-89bbd81e9ffb"}]}, @{@"Splash": @[@{@"Splash": @"a46fe35d-d6a2-450f-888d-b6508f8ee809"}]}],
                    @"Tapjoy": @[@{@"Interstitial": @[@{@"interstitial" : @"ba08236a-ea5e-4137-80ac-ee21e86c6a47"}]}, @{@"RewardedVideo": @[@{@"rewardedVideo": @"9ec0a0fa-e21b-453b-b052-1d760e8554fc"}]}],
                    @"Tiktok": @[@{@"Banner": @[@{@"320*50": @"f5e34294-4ce4-48fe-a400-6e3f1289c397"}, @{@"300*250": @"f5e34294-4ce4-48fe-a400-6e3f1289c397"}]}, @{@"Interstitial": @[@{@"interstitial" : @"f2079959-2b7d-4177-ad75-7a46f35311d8"}]}, @{@"Native": @[@{@"native": @"be126dd8-1cea-45dc-876d-0f4a0b3b9c20"}]}, @{@"RewardedVideo":@[@{@"RewardedVideo": @"c6907083-d63a-46a7-a5b8-3ebd46a6fc72"}]}, @{@"FeedList":@[@{@"FeedList": @"5a62d07f-ead0-4c0d-b503-aca2b87f99a6"}]}, @{@"MixView":@[@{@"banner": @"e0541bbb-c065-4659-9c56-8d9128ee116e"}]}, @{@"MixFullScreen":@[@{@"native": @"dff07570-c609-4752-b554-f303818c2199"}]}, @{@"Splash":@[@{@"splash" : @"2d5538a5-d686-4567-af9f-464dd3f2b956"}]}],
                    @"Unity Ads": @[@{@"Banner": @[@{@"320*50" : @"58f48a0c-371a-492a-bf71-31df58e161f4"}]}, @{@"Interstitial": @[@{@"interstitial" : @"b1384aa1-9391-453b-93e8-5228730a4bed"}]}, @{@"RewardedVideo": @[@{@"rewardedVideo": @"6f4e0465-969c-49fd-8dfb-832b5548c09b"}]}],
                     @"Vungle": @[@{@"Banner": @[@{@"320*50" : @"e8fbe4f1-5fab-4abc-ba51-747f26246df1"}]}, @{@"Interstitial": @[@{@"interstitial" : @"3f5a47fa-57ab-4d7f-a57c-6b53eb11410b"}]}, @{@"Native": @[@{@"native" : @"809f33f6-591d-4d47-a669-e7df653ae716"}]}, @{@"RewardedVideo": @[@{@"rewardedVideo": @"5c4daea1-ea30-419d-a4d5-3f72f1748998"}]}]};
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
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = [UIColor grayColor];
    [self.view addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(header.mas_bottom).offset(1);
        make.height.equalTo(@1);
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
    
    adsTestVc.adsDic = _netWorksDic[key];
    
    [self presentViewController:adsTestVc animated:YES completion:nil];
}

@end
