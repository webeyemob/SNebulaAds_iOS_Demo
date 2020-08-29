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
    _netWorksDic = @{
        @"AdColony": @[@{@"Banner": @[@{@"320*50": @"f0963a3d-6f80-4ac0-8414-f9005de4e525"},
                                      @{@"300*250": @"f0963a3d-6f80-4ac0-8414-f9005de4e525"}]},
                       @{@"Interstitial": @[@{@"Interstitial": @"b03fecaf-69e2-4b76-b81d-d2ce2428ea49"}]},
                       @{@"RewardedVideo":@[@{@"RewardedVideo": @"18fca7ad-eaa5-49a7-a9c8-1c860af54fb8"}]}],
        
        @"AdMob": @[@{@"Banner": @[@{@"Banner 320*50": @"260a7430-acd9-4dec-a4f2-e24a08855212"},
                                   @{@"Banner 320*100": @"1490bfbd-dd3b-4952-810e-6ae62cbb7f52"},
                                   @{@"Banner 300*250": @"c956b6f1-9beb-4c37-91db-af3b68f2e0b6"},
                                   @{@"Banner 728*90": @"885c1a8e-fb8c-4193-bbca-00220f33475b"},
                                   @{@"Banner 468*60": @"8f54db9d-14c8-42f9-82ee-32e08bde15c3"},
                                   @{@"Anchored Adaptive Banner": @"e9bd3bbb-f87b-4203-8524-ff1a98769e00"},
                                   @{@"Inline Adaptive Banner": @"c32afc38-303a-4563-a2a7-2141fcb6cc3b"}]},
                    @{@"Interstitial": @[@{@"Interstitial": @"833c620a-4fb3-4268-a733-88cb30f5eb90"}]},
                    @{@"Native": @[@{@"Native": @"9007ea51-bb55-4e6d-b57c-ba3924ba4a1e"}]},
                    @{@"FeedList":@[@{@"FeedList": @"745757d4-7f27-4ff2-8856-11ca47914898"}]},
                    @{@"RewardedVideo":@[@{@"RewardedVideo": @"b6e0a185-3738-470a-a1dd-aa9c9db3fbe0"}]},
                    @{@"Splash":@[@{@"App Open Ads Portrait": @"07810cc9-67ae-42d3-8c2b-d37338e96a24"},
                                  @{@"App Open Ads Landscape": @"7935bd0b-52fb-4f19-9b48-abb3f524c818"}]}],
                    
        @"AdGeneration": @[@{@"Banner": @[@{@"320*50": @"8544f540-bc56-4177-b4c8-6f4daf18e06c"},
                                          @{@"320*100": @"17660834-a7f9-49cd-b995-78fe54c90719"},
                                          @{@"300*250": @"52b431b7-1124-4e2f-af94-57d2e97d731a"},
                                          @{@"728*90": @"bbff51fc-99fb-4ad7-81fc-87f570333b93"}]},
                           @{@"Interstitial": @[@{@"Interstitial": @"e34bbdba-6c36-4d1e-a4a8-fe2c787b498b"}]},
                           @{@"Native": @[@{@"Native": @"5b465d9f-dcba-47d2-81ae-3ace1e905f33"}]},
                           @{@"FeedList": @[@{@"FeedList": @"8221a2a7-9e3d-4187-9635-cf6548b84a82"}]}],
        
        @"Amazon": @[@{@"Banner": @[@{@"320*50": @"b6f1b556-846c-4b83-bdc1-d7f2483e55c1"}]},
                     @{@"Interstitial": @[@{@"Interstitial": @"a2b17126-0b61-4e61-be08-32fefa9fa355"}]}],
                    
        @"AppLovin": @[@{@"Banner": @[@{@"320*50": @"5a4ec11a-517b-47f5-86ce-a85b56fa8aea"},
                                      @{@"300*250": @"5a4ec11a-517b-47f5-86ce-a85b56fa8aea"}]},
                       @{@"Interstitial": @[@{@"Interstitial": @"7bacc417-e6cb-4893-9606-7746e608424b"}]},
                       @{@"Native": @[@{@"Native": @"2ffa7e68-2615-4ee0-b693-6b44199bcc58"}]},
                       @{@"FeedList": @[@{@"FeedList": @"9304f0fa-ef05-4e9c-9199-ec0da21f3310"}]},
                       @{@"RewardedVideo":@[@{@"RewardedVideo": @"5c7a2b41-5a44-4924-ac81-c711096fedf6"}]}],
                    
        @"Baidu": @[@{@"Banner": @[@{@"320*50": @"482b2551-68fc-4f66-bcf7-34f6fd5886fa"},
                       @{@"300*250": @"482b2551-68fc-4f66-bcf7-34f6fd5886fa"}]},
                    @{@"Interstitial": @[@{@"interstitial": @"9b8ec564-8f6e-4718-a422-edfe721e6deb"}]},
                    @{@"Native": @[@{@"Custom": @"fd1dfc46-1994-4dbc-b524-186aa69ddb9d"},
                                   @{@"Smart Opt": @"0c4526dc-71b9-4b4d-b626-b29100c71b12"},
                                   @{@"Express Carousel": @"3184d9ba-8ec5-4a04-8bdc-d10e267dabe5"},
                                   @{@"Portrait Video": @"63cbe828-291f-491f-99ed-854cefaf8369"}]},
                    @{@"FeedList": @[@{@"Native": @"e69df2ed-406c-4a87-a791-7045bec52f6d"},
                                     @{@"Smart Opt": @"0ac86ed2-1bdf-4c3f-9f5a-b657523e41b2"},
                                     @{@"Express Carousel": @"8858e181-f365-4361-8633-c2d9dd18adc6"},
                                     @{@"Portrait Video": @"ea8d9387-2de9-4fcd-8c5c-91f46dc35f47"}]},
                    @{@"RewardedVideo":@[@{@"RewardedVideo": @"13833c8d-e4f1-4bce-94e6-91c1ba32e3d1"}]},
                    @{@"MixView": @[@{@"banner320*50": @"6eae4ec7-4255-4a40-8d9a-691acf859e50"}]},
                    @{@"MixFullScreen":@[@{@"banner300*250": @"0443c180-8414-406b-9b81-373b0fbc5c93"}]},
                    @{@"Splash":@[@{@"splash": @"9bee7b8b-60c4-4e75-8a49-e6e405bc9893"}]}],
                    
        @"Chartboost": @[@{@"Banner": @[@{@"320*50": @"85a6b55c-5ca3-410d-b674-3d94dfa33577"}]},
                         @{@"Interstitial": @[@{@"Interstitial": @"f8ae6d45-dfb0-4779-b886-f972c57e7fa8"}]},
                         @{@"RewardedVideo":@[@{@"RewardedVideo": @"7f4fc9c0-c73d-46bd-bbb2-893366d731b2"}]}],
                    
        @"Criteo": @[@{@"Banner": @[@{@"320*50": @"08047dd3-8259-4f4c-9542-e4c1c770465d"}]},
                     @{@"Interstitial": @[@{@"Interstitial": @"3aae3e21-37b9-4717-a844-69c8895684a3"}]}],
                    
        @"DFP": @[@{@"Banner": @[@{@"Banner 320*50": @"74e81da4-e35d-4ab3-9594-49d45f31baef"},
                                 @{@"Banner 320*100": @"be0ccf79-a7f8-4fed-8282-6db3a8af4b7c"},
                                 @{@"Banner 300*250": @"fe0ef62a-7362-4e86-8413-a1ccadced3f4"},
                                 @{@"Banner 728*90": @"c9c5937e-974f-4787-88c7-33239b6688e0"},
                                 @{@"Banner 468*60": @"13b0f6ec-667e-498a-987a-c8dc7ce85da3"},
                                 @{@"Anchored Adaptive Banner": @"1a744e4b-d4f2-4dba-aea9-761ef488d01a"},
                                 @{@"Inline Adaptive Banner": @"6971a6e5-1429-404c-9081-f6bcf236d9ab"}]},
                  @{@"Interstitial": @[@{@"Interstitial": @"e3bdf261-5f5c-4373-9be3-8a33f5d90cdb"}]},
                  @{@"Native": @[@{@"Native": @"374fec30-1e64-4bce-80f0-52ade0e1b4fa"}]},
                  @{@"FeedList":@[@{@"FeedList": @"29b5f82c-ac72-400f-80af-6ea2f25a57c8"}]},
                  @{@"RewardedVideo":@[@{@"RewardedVideo": @"a90612c7-f0e9-4f0d-bf0a-1a0da044eee4"}]},
                  @{@"Splash":@[@{@"App Open Ads Portrait": @"e717482f-3ffa-4bd4-b608-c1e2cf3449cd"},
                                @{@"App Open Ads Landscape": @"f9e9cbf4-b771-4d16-bab0-1ec692d7a616"}]}],
                    
        @"DisplayIO": @[@{@"Banner": @[@{@"320*50": @"d65bbeac-3121-4f63-a783-6e32b765dfb0"},
                                       @{@"300*250": @"cb4d50e6-c830-4d7e-b33c-db6040447fe9"}]},
                        @{@"Interstitial": @[@{@"Interstitial": @"9c870974-4b79-400b-9c06-77a43745e145"}]},
                        @{@"Native": @[@{@"Infeed": @"609f9bd6-dbd8-4571-ac3e-a3c1cfe62af7"},
                                       @{@"Interscroller": @"fa244e09-d0bf-4904-a6b6-7fc85b519562"}]},
                        @{@"FeedList": @[@{@"Infeed": @"d6ec8d0b-10c7-419b-9fc9-b0af9cebca27"},
                                         @{@"Interscroller": @"b6cc4d67-356e-421e-9ff4-f3be1048975d"}]},
                        @{@"RewardedVideo":@[@{@"RewardedVideo": @"0e99ee22-4f9c-4203-9206-6df8cb410499"}]}],
                    
        @"DU AD Platform": @[@{@"Banner": @[@{@"320*50": @"dddc68cd-3bb1-45d1-853d-7d5383e68fc7"}]},
                             @{@"Interstitial": @[@{@"Interstitial": @"c997d32b-d13a-46e1-8247-fb569f20afe2"}]},
                             @{@"Native": @[@{@"Native": @"4e09ec7d-c62e-4446-b021-7b7f37e947ce"}]}],
                    
        @"Facebook": @[@{@"Banner": @[@{@"320*50": @"90302de7-2d6e-4560-b6e7-1af5d567e72f"},
                                      @{@"300*250": @"90302de7-2d6e-4560-b6e7-1af5d567e72f"}]},
                       @{@"Interstitial": @[@{@"Interstitial": @"73fb1092-d6eb-4813-85db-29df120b4c6d"}]},
                       @{@"Native": @[@{@"Native": @"d2eab5cd-04b0-440a-a775-176183b4c5fd"},
                                      @{@"Native Banner": @"4bb16062-9b77-4aec-8d4e-42262efad4d1"}]},
                       @{@"FeedList": @[@{@"Native": @"476e8de0-3355-47d8-ab83-ad54971142ed"},
                                        @{@"Native Banner": @"f00ceef8-80ec-427e-8b3f-db152a11ff13"}]},
                       @{@"RewardedVideo":@[@{@"RewardedVideo": @"dcf9244e-2a86-49e6-a4bd-2e7d828a9719"}]}],
        
        @"Five": @[@{@"Banner": @[@{@"300*250": @"2c766777-13a7-47b5-b855-762f200f7d0b"}]},
                    @{@"Interstitial": @[@{@"Interstitial": @"b424c14c-8a37-4e96-b74b-e2fea472e2de"}]},
                    @{@"RewardedVideo":@[@{@"RewardedVideo": @"1bd2c3d0-a46e-45a4-b580-d67be7b96a2e"}]}],
        
        @"Flurry": @[@{@"Banner": @[@{@"320*50": @"9da72407-51f7-4e9e-8928-889696ece7e5"},
                                    @{@"300*250": @"9da72407-51f7-4e9e-8928-889696ece7e5"}]},
                     @{@"Interstitial": @[@{@"Interstitial": @"6b3ef504-5964-43ce-91d8-f51a54274f5a"}]},
                     @{@"Native": @[@{@"Native": @"a5cbbcfe-d7ac-4baa-bbb9-990000bfbd6b"}]},
                     @{@"RewardedVideo":@[@{@"RewardedVideo": @"66a04cde-003f-4223-824d-6dc9f6f1221c"}]}],
                    
        @"Fyber": @[@{@"Banner": @[@{@"320*50": @"34c9bbcb-50be-40aa-bd30-13ae100d8a6b"},
                                   @{@"300*250": @"34c9bbcb-50be-40aa-bd30-13ae100d8a6b"}]},
                    @{@"Interstitial": @[@{@"Interstitial": @"b861d69a-ca96-42b0-a882-9c6c822acc89"}]},
                    @{@"RewardedVideo":@[@{@"RewardedVideo": @"880071c0-5263-4db8-893a-d39ffd5a6d95"}]}],
                    
        @"GDT": @[@{@"Banner": @[@{@"Banner 2.0": @"522767ca-3d4f-4399-b654-ada7c06ed904"}]},
                  @{@"Interstitial": @[@{@"Interstitial 2.0 Normal": @"d978890e-23f4-4fe6-b415-f11f66270025"},
                                       @{@"Interstitial 2.0 FullScreenVideo": @"0dde0129-055e-44c7-9d0f-cb474e048707"}]},
                  @{@"Native": @[@{@"Custom 2.0": @"54e45182-2b75-49ca-812d-ea3eea7387a3"},
                                 @{@"Express": @"5edfc3a8-1056-4f18-8cca-07ee6019a4dd"}]},
                  @{@"FeedList":@[@{@"Custom 2.0": @"803fea96-4403-44f7-9ec9-7e96a1a91a29"},
                                  @{@"Express": @"505daf24-b197-48c7-b383-905a2d68e47c"},
                                  @{@"Express 2.0": @"e538c7a1-1c09-440c-990f-a69b87173c0e"}]},
                  @{@"RewardedVideo":@[@{@"RewardedVideo": @"b156abf1-2767-4073-a7a5-bdaf6026f032"}]},
                  @{@"Splash":@[@{@"Splash": @"cfc8a9ef-0dcd-490c-b093-b1bd9ffb800c"}]}],
        
        @"i-mobile": @[@{@"Banner": @[@{@"320*50": @"789f6106-4271-469f-bdbe-61d570a2dc2f"}]},
                       @{@"Interstitial": @[@{@"Interstitial": @"0aefe90d-ebc9-4414-aaa4-8fb1532bbdef"}]},
                       @{@"Native": @[@{@"Native": @"d85a1436-0453-4e50-a3d8-3bffcf0ba906"},
                                      @{@"FullScreen/InLine": @"f62f5bc2-1d79-4bf9-b075-b086120146e6"}]},
                       @{@"FeedList": @[@{@"Native": @"4441a96b-d6d9-40aa-9787-0dced7586ab2"},
                                        @{@"FullScreen/InLine": @"b9c55cd3-adfd-4332-b2e7-cb4fda876f24"}]}],
                    
        @"InMobi": @[@{@"Banner": @[@{@"320*50": @"4ecb5c23-d6d8-4f40-861d-132ab528ca4b"},
                                    @{@"300*250": @"4ecb5c23-d6d8-4f40-861d-132ab528ca4b"}]},
                     @{@"Interstitial": @[@{@"Interstitial": @"bd5625a2-f8a6-40f2-a970-5a6e03751939"}]},
                     @{@"Native": @[@{@"Native": @"1ac3e8a0-3fc9-4393-a756-ff79ac10c4e2"}]},
                     @{@"FeedList":@[@{@"FeedList": @"f002b284-05d4-45a6-8555-873d47b0670e"}]},
                     @{@"RewardedVideo":@[@{@"RewardedVideo": @"28dc4bbf-8dd4-4c91-a8ee-3bf62827082e"}]},
                     @{@"Splash":@[@{@"Splash": @"aede1061-35a3-41d4-9093-b61ba805fad2"}]}],
                    
        @"IronSource": @[@{@"Banner": @[@{@"320*50": @"db4892b3-309d-4cee-b14a-27ce231c8278"}]},
                         @{@"Interstitial": @[@{@"Interstitial": @"213c91c0-232a-4e5a-b33e-4e681eb77e87"}]},
                         @{@"RewardedVideo": @[@{@"RewardedVideo": @"fe23a332-c86b-4dd9-8d8f-5567d83e489d"}]}],
                    
        @"KuaiShou": @[@{@"Interstitial": @[@{@"Interstitial": @"b6cd35cb-1e86-48cd-a94c-6fc325d04807"}]},
                       @{@"FeedList": @[@{@"Custom": @"5b7254a0-75cb-4164-ae68-61af6e951c66"},
                                        @{@"Express": @"86aa7899-ae1d-4b5d-9428-77b6457e9619"},
                                        @{@"Draw": @"aa705fc6-b25a-47e7-8811-98281a4eeeaf"}]},
                       @{@"RewardedVideo": @[@{@"RewardedVideo": @"6e9a103c-eca1-4ce5-bf2e-9e72191762f9"}]},
                       @{@"Splash": @[@{@"Splash": @"d2267b66-bc9f-4fbd-9b95-30fa66bd48e5"}]}],
                    
        @"Maio": @[@{@"Interstitial": @[@{@"Interstitial": @"cbf35d4d-622e-4465-8d7a-d803415561b3"}]},
                   @{@"RewardedVideo": @[@{@"RewardedVideo": @"8dc2c295-0663-4c67-906c-30a718a5af9e"}]}],
                    
        @"Marketplace": @[@{@"Banner": @[@{@"320*50": @"1cb5d587-5801-4ac3-bdaf-3b3a950ef6f0"},
                                         @{@"300*250": @"1cb5d587-5801-4ac3-bdaf-3b3a950ef6f0"}]},
                          @{@"Interstitial": @[@{@"Interstitial": @"f46922af-b059-4c80-9960-38c87bf5da9e"}]},
                          @{@"Native": @[@{@"Native": @"27a0aad5-1d33-465c-9738-f908b402bf88"}]},
                          @{@"FeedList":@[@{@"FeedList": @"6d29854c-65d6-4e19-8901-709d63ba2d3e"}]},
                          @{@"RewardedVideo":@[@{@"RewardedVideo": @"f939a944-1ebe-491a-91b3-2a40e4828fe4"}]},
                          @{@"Splash":@[@{@"Splash": @"7f1d00b6-4b76-4565-8a43-e05414408903"}]}],
                    
        @"MoPub": @[@{@"Banner": @[@{@"320*50": @"3e6c21ae-efe5-47f1-9118-ac43f9ece5c0"},
                                   @{@"300*250": @"3e6c21ae-efe5-47f1-9118-ac43f9ece5c0"}]},
                    @{@"Interstitial": @[@{@"Interstitial": @"e171e8af-8ad1-4faf-806e-fcb75bd3ed36"}]},
                    @{@"Native": @[@{@"Native": @"dffb5339-7971-41cc-a814-a46f0c4ec4cf"}]},
                    @{@"FeedList": @[@{@"Native": @"02fffe55-a5aa-4aaa-b209-97d4338a8ff4"}]},
                    @{@"RewardedVideo":@[@{@"RewardedVideo": @"c6abc185-6d96-4168-9690-5356f779770e"}]}],
                    
        @"Mobvista": @[@{@"Banner": @[@{@"320*50": @"c1ba5bb5-ca70-4ff9-9fd6-7022625b8646"},
                                      @{@"320*100": @"bed762fe-574f-47e2-86b3-2855c231e33b"},
                                      @{@"300*250": @"9ab699ac-ad7a-41d5-ab9e-bbae7a99918f"}]},
                       @{@"Interstitial": @[@{@"Interstitial Static Image": @"c2ef033c-3405-4488-9148-50281962fed6"},
                                            @{@"Interstitial Video": @"2270fbdc-1646-4ee0-857d-12facb1c7141"}]},
                       @{@"Native": @[@{@"Native Custom": @"6f3d1528-4389-4ba4-af70-eb4114143ab0"}]},
                       @{@"FeedList":@[@{@"FeedList Custom": @"1669a846-9acc-49d2-a977-2f1eb3805d16"},
                                       @{@"FeedList Auto Rendering": @"727d9a45-03f2-4fe8-8a39-630079f77d7d"}]},
                       @{@"RewardedVideo":@[@{@"RewardedVideo": @"8721f6e0-f0ff-41ab-92cc-38ce6c2ec65e"},
                                            @{@"Interactive Ads": @"fc3f5920-ad3b-4410-bcbc-04a4cec61314"}]},
                       @{@"Splash":@[@{@"Splash": @"f5f5c853-c1b2-460a-bcc5-3c57b9877bc0"}]}],
                    
        @"NathAds": @[@{@"Banner": @[@{@"320*50-image": @"4c1c31d2-73af-44ac-a90d-da422a53f157"},
                                     @{@"300*250-video": @"9d55dc8c-c7e9-4aa7-b92e-eb4fb01ad3e7"}]},
                      @{@"Interstitial": @[@{@"image": @"cb458482-1362-4b12-aa3b-add8c78ac083"},
                                           @{@"模版video": @"fd136c8f-b259-4e1d-aa87-baef34b82547"},
                                           @{@"原生video": @"aab125e8-e121-4864-966c-20724d3992dc"}]},
                      @{@"Native": @[@{@"image": @"3a9b40b5-d835-43a7-bea6-b5f650511de3"},
                                     @{@"video": @"8029c724-2c66-468f-a3b8-732e6004f32f"}]},
                      @{@"RewardedVideo":@[@{@"模版video": @"97386f3d-4781-4673-853a-b312e5bd2a43"},
                                           @{@"原生video": @"2afa5088-a5eb-448b-af99-2863ab90b275"}]},
                      @{@"FeedList":@[@{@"image": @"88176717-0e92-494f-880f-1232f35b64fa"},
                                      @{@"video": @"8da4e792-01fb-48fa-a2f6-258cc07c9fa9"}]},
                      @{@"Splash":@[@{@"image": @"8b0cc2f4-ef47-493a-b573-415960e5ee17"},
                                    @{@"app": @"fea8a26a-1216-44a3-b8a0-58dc95452036"}]}],
        
        @"Nend": @[@{@"Banner": @[@{@"320*50": @"3c570f15-17e7-49b6-b870-9e99e576d785"},
                                  @{@"300*250": @"3c570f15-17e7-49b6-b870-9e99e576d785"}]},
                   @{@"Interstitial": @[@{@"Interstitial": @"af471689-8f42-4dbb-8af8-8d89419f1e61"}]},
                   @{@"Native": @[@{@"Image Native": @"df6a54e9-5264-420b-81e4-e1a8cfbd601e"},
                                  @{@"Video Native": @"5b80a42f-86dc-4e4d-902a-dbf6f424c26d"}]},
                   @{@"FeedList": @[@{@"Image Native": @"65dc8da3-0f25-48d1-9cd2-94827126c22b"},
                                    @{@"Video Native": @"f7e6beda-1f8b-45c4-bcba-42a78be882f0"}]},
                   @{@"RewardedVideo":@[@{@"RewardedVideo": @"c4c74261-2976-4b33-8a98-ecb3f2a43e22"}]}],
                     
        @"Sigmob": @[@{@"Interstitial": @[@{@"Interstitial": @"01c8b492-59f3-4397-8d59-f5096b1c2385"}]},
                     @{@"RewardedVideo": @[@{@"RewardedVideo": @"6b687064-aa91-43a0-a1a8-89bbd81e9ffb"}]},
                     @{@"Splash": @[@{@"Splash": @"a46fe35d-d6a2-450f-888d-b6508f8ee809"}]}],
                    
        @"Tapjoy": @[@{@"Interstitial": @[@{@"Interstitial": @"ba08236a-ea5e-4137-80ac-ee21e86c6a47"}]},
                     @{@"RewardedVideo": @[@{@"RewardedVideo": @"9ec0a0fa-e21b-453b-b052-1d760e8554fc"}]}],
                    
        @"TikTok": @[@{@"Banner": @[@{@"Express 320*50": @"2dbe0d9b-c462-4f2f-979f-9f21725d38f1"},
                                    @{@"Express 320*100": @"13bbeb2a-d5d8-4cbd-badd-3b03e602b407"},
                                    @{@"Express 300*250": @"573379bf-7442-47f6-9fc9-3463be7c4c2a"},
                                    @{@"Express 468*60": @"28f657a1-2903-4941-bc65-a7c608ab14c8"},
                                    @{@"Express 728*90": @"63daee07-9a92-4883-a5d3-ad65ad42bb8b"}]},
                     @{@"Interstitial": @[@{@"Normal": @"f2079959-2b7d-4177-ad75-7a46f35311d8"},
                                          @{@"Express Interstitial 2:3": @"92456d12-b5ee-42e4-9a51-530e8486624f"},
                                          @{@"Express Interstitial 3:2": @"6e7dfa58-8646-4982-813e-b05ad57a671f"},
                                          @{@"Express Interstitial 1:1": @"71035fbb-1222-44db-bfbe-02088940ff9c"},
                                          @{@"FullScreenVideo": @"760f7930-2800-4a96-81f7-63b8b5d12ea4"},
                                          @{@"Express FullScreenVideo": @"6882e2d0-0dae-468a-b477-d9b1d821758b"}]},
                     @{@"Native": @[@{@"Custom Banner": @"be126dd8-1cea-45dc-876d-0f4a0b3b9c20"},
                                    @{@"Custom Interstitial": @"8f40c271-ed41-473c-93b3-51aa661b8ae1"},
                                    @{@"Custom FeedList": @"c9fe4a9a-ce1e-433e-896d-432b8a48f0d5"},
                                    @{@"Express FeedList": @"356ab13a-e44b-45ce-9471-4d35fc133acc"}]},
                     @{@"FeedList":@[@{@"Custom": @"5a62d07f-ead0-4c0d-b503-aca2b87f99a6"},
                                     @{@"Express": @"1aeed505-355f-43fd-b77f-b09e4825ac59"},
                                     @{@"Draw": @"03a12353-c9a5-464b-baf7-6d2928a1838d"},
                                     @{@"Express Draw": @"10b04504-6d2a-402b-a584-1d4a9c0d875a"},
                                     @{@"Custom Banner": @"e5addad7-3512-4cd0-a57a-b4bd7969350a"},
                                     @{@"Custom Interstitial": @"ef76874e-358d-4523-b30a-d80a2dfa2e99"}]},
                     @{@"RewardedVideo":@[@{@"Normal": @"c6907083-d63a-46a7-a5b8-3ebd46a6fc72"},
                                          @{@"Express": @"6795d15d-ada9-4426-b22d-0121ec7ae395"}]},
                     @{@"Splash":@[@{@"Normal": @"2d5538a5-d686-4567-af9f-464dd3f2b956"},
                                   @{@"Express": @"9f6623b0-4485-4485-aa53-090279ec92f2"}]}],
                    
        @"Unity Ads": @[@{@"Banner": @[@{@"320*50": @"58f48a0c-371a-492a-bf71-31df58e161f4"}]},
                        @{@"Interstitial": @[@{@"Interstitial": @"b1384aa1-9391-453b-93e8-5228730a4bed"}]},
                        @{@"RewardedVideo": @[@{@"RewardedVideo": @"6f4e0465-969c-49fd-8dfb-832b5548c09b"}]}],
                     
        @"Vungle": @[@{@"Banner": @[@{@"Banner": @"67f934c7-871a-4bc8-a0f0-621e4de832f9"},
                                    @{@"MREC": @"e8fbe4f1-5fab-4abc-ba51-747f26246df1"}]},
                     @{@"Interstitial": @[@{@"Interstitial": @"3f5a47fa-57ab-4d7f-a57c-6b53eb11410b"}]},
                     @{@"Native": @[@{@"Native": @"809f33f6-591d-4d47-a669-e7df653ae716"}]},
                     @{@"FeedList": @[@{@"FeedList": @"317244b2-e865-4b80-ac57-853b3eb92180"}]},
                     @{@"RewardedVideo": @[@{@"RewardedVideo": @"5c4daea1-ea30-419d-a4d5-3f72f1748998"}]}]
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
