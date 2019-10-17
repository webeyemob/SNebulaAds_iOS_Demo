//
//  MediationTestViewController.m
//  TaurusXAds_iOS_TestApp
//
//  Created by tang on 2019/7/10.
//  Copyright © 2019 we. All rights reserved.
//

#import "MediationTestViewController.h"
@import TaurusXAds;
#import "Masonry.h"
#import "macro.h"

static NSString const *BANNER_ADUNITID[] = {@"f75c4fbf-6719-44bf-82f9-109d6a8c7850", @"e00f3ae4-eeb6-4392-83e5-69dae7700fa0", @"50836b28-3ffe-46ce-a19a-75450c2f7c45", @"0ce9a579-aee8-4061-b56a-4a39573f7c34", @"2dbc42ad-4101-4e04-bcf5-593a53f8916f", @"440755db-d1d7-4d43-8489-e106b3ce83cb", @"c73a2e55-5e37-44db-a163-263d5335b5a6", @"00db4b41-df32-45eb-bfe8-ebb359ff50c5", @"e33da295-26ad-4a2e-b62c-b9c3272b999f", @"51162bd8-cbf9-4df5-a5bf-4605acbd67e4", @"8f101596-c115-4e39-a7f7-a2860685a139", @"f0d4519a-28d2-4c23-a5d1-a6f790676a25", @"38243d0c-3a2b-4b7e-8932-d51d3bb6271b", @"a59c44a6-648a-4724-9bf4-aa522300640e", @"384e6f45-aeb1-40c8-af9d-39fc87ad4f72", @"13d072e8-629a-4613-8509-681314535dec", @"cc8ab886-f96f-4fdb-afd8-a0b15fca7021", @"a9b2fe0f-7ec2-483b-9be8-dadacf7ff71e", @"a4d35cb4-cefb-486e-8b69-9f21c65354f1", @"8eb24df2-98c0-4cf3-82bf-f095849d9dcb", @"45c5a951-9082-475f-99a7-ede480e56e90", @"ab635fc9-f9ad-493c-af2f-01ed5f242879", @"1df76864-27d0-4dcb-bd0d-a1195093ec43", @"af443a4c-3551-4e61-a576-83cd28b8477b", @"183ac829-feff-49bc-a912-a18c4437309e", @"7464f7bd-5d40-4394-8919-e39d29c4fe67", @"fc110d56-2f85-42fc-8d65-28b1c95fc4b6", @"77ba560b-e30e-46b5-a0d1-c160777057b5", @"865a0c3e-29cb-4ff2-8304-c143962bdd15", @"29a77187-f5f5-4f0c-8640-635f98a23569", @"5f47109f-fbd9-4d00-8bcd-5af6fcb72ce6", @"581e6ff6-0cbd-442a-89b1-8aa0b9bcb6e2", @"bfcb8b8c-0dcc-4467-8cdc-2f504f061a18", @"a72d5111-a6c4-4dd9-8500-fa6df348d1b5", @"4bce46cd-c5fd-401f-aa2a-211f9be59b17", @"1ae37ee5-4022-4c27-a746-16e41b932b0b", @"2b9f013a-4d9e-4a80-9b3b-4290d8c05090", @"76ebab67-1403-48f2-aae5-745f4ac4abdc", @"88f4ac3a-a28b-4b61-9bd3-ea3e954982df", @"1ba0d13c-3d4b-45b9-a759-826cd8023e3e", @"b40869d5-fd0d-413e-8a77-f8e81c55ab08",
    @"3c0c5b9d-c623-41d9-906f-ab9c342ba8d1", @"cfb42f3e-67cf-48ad-90df-a5307e843da5", @"b79c943a-3e4a-477a-a0d5-8d0ef3623eca", @"9645a18c-d292-49a3-b25a-011ba5b5c3ec", @"1f47a719-41f7-43f0-bbd7-d00c172161f1", @"f2129592-4de2-4eb3-9a78-92b391ecc612", @"2c18f3d2-7d4e-4890-a898-3396fb8f30fa", @"11457d40-4527-4006-93d4-7211fb38caa4", @"0e7f62c0-08ff-4979-ad23-f291b651fccc", @"f93c124d-d262-429a-8b67-821611c2bd02", @"2cf88c95-08be-43b5-9d76-6a6061dff79c", @"73535651-8de6-41fd-8856-2304f83945fc", @"78131646-d4b1-44c5-a16d-3b20a7137a88", @"4623244a-25ea-4054-87cb-32b93a1f0d39", @"66c4da40-617c-45d5-9cb7-5c8b9bdd7d1b", @"f2be300a-0946-49d5-b7c5-3060f6460027", @"88412400-89cb-4108-8260-1a853a2f584e", @"3573d16c-b5ff-420f-9a32-c390c1f71bef", @"715497b0-e70b-4e03-afc0-2d2cb1022866", @"467b0e19-8759-4167-8f04-efe791a83072", @"681bfbae-c6eb-42ef-a9d9-f4cf2ed3c884", @"0e021404-6745-41be-8b84-b194062a6db2", @"70547c91-a65e-4de4-93a2-5478817e8fea", @"4182d833-1fe8-42d2-8d49-431eb5b8ec66"};

static NSString const *INTERSTITIAL_ADUNITID[] = { @"e8eae562-6a97-4370-81a8-d1885cd14daf", @"845b77ab-5449-4e48-90ea-5e64bbcbe237", @"81b64fc4-9f9a-4016-ae3d-b175e331ca4a", @"2f450625-9d9e-405f-ac27-25f59177b935", @"1ca38bb5-0a31-4c97-9971-abb7eae53533", @"fbf0b515-7e47-40fc-be72-9ba645c9e6a8", @"499222ec-8d5e-4b5b-bdc5-9a8a19de2dcd", @"e75284ed-d5ba-4dee-b609-0258900dffc5", @"05667e11-ffb3-46c7-a8e1-4d5d1cb8d9a5", @"0eb63c57-f4d8-4e61-9d66-43a99fb44264", @"2c92a7b7-a05d-4964-abd7-cae24e883cfb", @"9b5c293d-0aa8-4f36-8e27-ad9f8defb916", @"d71eb5d5-42f9-4668-86b4-15d4e3dfc5c7", @"f1c8743b-6bd4-4e28-9405-3c04f2053113", @"c9f9be7c-fe4b-4f83-acec-c4b3273b7b21", @"0b9a7bf3-88e9-4cde-8144-98a0b9738ab6", @"83ee1d24-e1e2-4e95-9fba-4c9e0da42f5b", @"b8974d33-175e-47c6-a88f-29a16bf1403c", @"4849c505-bb88-4b1c-9bd5-e21bc620e26e", @"0ede2957-a607-4140-bed1-cee5c69fab40", @"2be8cd15-e62c-4212-97ea-5b16a8cb2e0b", @"5f487dc0-89d8-4717-acfa-77d166f96139", @"b903ccf7-e96b-45ca-b92f-69fa347b1c87", @"f664ffd2-e1cc-42a0-8a8d-19aff278dc31", @"3c515cbe-da8c-4742-b97e-93ac6456d0c8", @"4dfa1d7d-5b7b-47bb-9d65-5d6ad8dccb58", @"ed902bca-b9e4-40d9-9e1f-7bded95aa1fb", @"cf3ab674-ad56-4678-9742-e4200f97d382", @"6901b990-702c-472d-86be-e53684e9027c", @"afc9c5a9-4532-4f25-afa8-24327f8306b6", @"228a35ce-ac95-48e7-aada-30f119bf408e", @"dd141ce4-d01d-4660-9120-f9a1af8bf251", @"0907c6c2-13c5-4ad3-a824-a8609a440434", @"3a421505-3bfe-4323-a8ec-649375072baa", @"9fb1b763-a127-44a2-9325-6ca7406bc807", @"f4b21522-9e8f-40e5-b46a-c23a3a8b84a9", @"21a12007-f116-4bca-9226-9e3a8ae1047e", @"28e524b4-0c2c-4a32-a94d-a8ef814bc019", @"73c0294d-6d04-485a-8c65-d8e84ce963f2", @"440b298a-fbba-44f9-b1c3-89b9e6643a88", @"fd5bb6b2-88a2-44d5-aad6-b3c3a6abcfd6", @"5872ceb6-a43f-483d-bcda-bc12a4646232", @"7a273a2b-0849-405e-8ff9-4032b9f399fc", @"77686d50-af47-4d19-bc02-c88df5f6100a", @"619bd1fd-e52b-4574-b274-79601a10ec72", @"0f3fb95d-a8a7-44da-80a9-cf6fdcfb1908", @"5a8fa7d1-bb52-455e-92b8-16c36a9232a3", @"91e7ca2f-ae48-40f0-98ce-c160806a21d7", @"dba0ae93-4a22-448f-9081-4042e1e0c39e", @"951d3b7f-13e4-402a-a6ba-b6454948b99b", @"03eb9513-e0ea-4ee1-b045-8444e6cadf39", @"b932c991-e857-4a9f-b4a3-935b23ed24c0", @"e378084d-ff53-46d7-8143-455eb8595c38", @"b77c6442-8777-4ff4-90f1-939cd074ff18", @"b0b9d327-9d7d-48f5-a0ed-366fdc039692", @"c83f988a-c91c-400f-8451-41bbfe6e1197", @"6db18a98-326c-4480-bf43-498d7624047c", @"c3ad128d-f04f-4d7f-89ee-e01e8b896047", @"6fd5660d-d887-48d5-b8b0-61a8e44d4c86", @"1b239262-f781-444e-a631-ef916d9543b0", @"f753ecb4-b580-4d3e-a675-f8fc326fced6", @"ecb3140c-1d21-4f30-adf8-66330a76efb0", @"7fe8c2dc-649a-4f56-b05c-88092ad92873", @"0770ea01-47ff-40d0-9bdc-e89e7ddaa8f9", @"4c2c23d1-451c-4a67-82ef-34e2baa56f2b", @"17f509d8-66bf-4ad1-8285-c80a9d5bd06a"};

static NSString const *NATIVE_ADUNITID[] = {@"eeb846fe-d824-4cad-8c43-1c18ab5d4694", @"73573863-0007-4db0-b883-8b0b082df6f6", @"3f1c3c68-21a8-441f-9982-5cea7784f7b0", @"7104186c-dedd-4650-8b7a-444a6da39f7f", @"281efab4-5292-4120-b82f-3a70487616ad", @"8a70f510-7605-4c4c-8ffe-596127540cb7", @"d644c600-9416-484d-85b7-67e6c5cd6442", @"99cd5fe1-a3de-426e-8592-4d7599d7804c", @"e91e34e5-5613-478d-b101-8994cdc0ee01", @"32b36572-5035-48e5-8864-9a2bbdd56b8e", @"92167569-b0f7-4d30-a103-855671a2572b", @"137075d1-7cb8-4947-8ba8-6890d0a72e0b", @"fc048148-d46a-43a0-a161-0a4ed40ccffa", @"187da139-ef8f-402b-bc25-305b607736ef", @"0f75e181-4d65-4f76-8e52-e38bc93c5962", @"41ec29ce-c4b8-42ef-ac3c-42fe0d1ad2c1", @"97b9f1fe-8fda-43df-9f75-c17454427d38", @"08a9bf47-fc99-486a-8fd8-b0b18d327036", @"be299d98-a868-435e-b669-8eeafb23884c", @"428cb5ff-291d-4cc4-ab87-e4545c4247f2", @"79e421f9-d12f-44f4-8cde-86a287403365", @"4ef2ac5d-127c-4364-a19e-ebf7becbc39b", @"d94dc426-49fc-4594-85ef-ccd4cbefff1d", @"e103bce3-2298-42b2-941f-ad71822fdca2", @"3fc0db6f-4471-4462-8083-2c442df322be", @"f9861614-ba45-477c-9c65-730c0196ebb2", @"abe76d69-dc15-46d4-83d0-7cfc403dad4e", @"a1715f64-6b5b-4cf7-8b08-ac267a9db40f", @"ff8727c9-8a57-481f-b61e-a1d42f6d5be1", @"b8b241ce-0a12-437b-a7e7-d0c29acb2726", @"5234a95f-1056-4683-b25a-a2a6d16b6816", @"562b0d21-85db-4cb3-83c9-d8c07c70b859", @"0142e752-b507-48c7-b84f-cc7d94609edb", @"7b2a6fdf-d004-4f78-95ca-a20260b808b5", @"a54a1f5d-239e-432a-a47a-0957df39b6fe", @"8b14a192-3a80-4d3d-8ae9-754026a7e5cc", @"e0eb431f-3ba9-4f3e-a26a-d6e0bab196fb", @"2727e971-de5e-4a27-bc3b-94329c7336cb", @"2c499fe2-e06f-4e39-af4a-7dfe657bd5f0", @"307dfc73-af28-4f24-b8ed-50a61d3985d9", @"8af4696d-e06b-4759-b0d1-6e090bb7fdd0", @"b37759a7-ec96-43f4-a452-d94057c142f1", @"2673a78b-ad10-4313-ac13-24ded8455860", @"de07fbcc-d058-43be-a1cf-cdc4babe012d", @"46a2bbb7-604a-4a8f-ba46-638678a0f7dd", @"80599bc3-83c1-405d-ab7f-cc03c90056ec", @"7fd48ec4-9005-46d8-a143-91f1841a5c64", @"e7e84aff-b036-45b7-a38a-afae96ee5dff", @"28ec9561-388d-4d31-841c-b48e22c804ea", @"0725e97c-40d8-4b8c-adef-2efd3147686c", @"a341d991-e901-448b-93f9-8a9a466bfe28", @"8443cf35-86be-406c-963e-076829ca60c4", @"1eeef7a8-17e7-4ef5-a9f8-a4800a39cdf9", @"8464397e-a32a-4315-815d-fb60eb801117", @"9a5d7397-1814-4592-8fbc-70f14c08b9a5", @"1d53d0d5-9d5b-4e34-9253-ddb9599061d2", @"cc8fae8b-6a5a-4bd3-9a09-72e033acb219", @"368f79a2-556b-4f9d-8ad3-44c1006c2e27", @"dc4753d4-08ac-41f7-9027-8f77ba92f5b1", @"7cc9a5a6-355e-46cc-a8cd-191eb4e08efd", @"0962a262-a78c-4bb8-a414-722a9483914e", @"93f6db6e-d343-481d-a4f4-724a39dba096", @"6fc09272-dade-4076-866b-8d70b1959c41", @"9f032347-59da-4e6f-a7ef-0003823e116f"};

static NSString const *REWARDEDVIDEO_ADUNITID[] = {@"ec42b251-8c1c-47c2-a0b5-624727aaaa9a", @"1f630533-06b2-4c56-bd74-f80594cb6f73", @"118ededb-324a-4413-913d-ec35b0bd88dd", @"12871c39-e460-4520-b92c-6fcf23cdb960", @"95a5df75-8de9-4363-a6cf-5eeaf4de7a0c", @"7816b6ea-b06f-4ab1-90d5-bd719da10f8d", @"470f0db5-ffd2-4daa-98cd-adbc872e1add", @"15c5562a-7ff0-439d-9370-5c7836377c0c", @"18702737-8c00-44e8-8d21-b7c3e358ff80", @"33cd7742-bccf-48bc-bc15-171ed4685197", @"dc0d8b2d-b2b5-44b2-abbf-a53c5c74d47c", @"58558f8e-122c-42ba-8a70-22c0ea8ae533", @"7ad589f2-0799-4350-9552-17064ceed7b7", @"a5849f12-321e-41dc-89af-f4fb6089f9a3", @"d19b5c66-6492-4b2b-9644-3713e9f12c85", @"205b8cde-72f5-4c3f-8ed5-d7da58ecc739", @"f3335a94-08f9-4525-be41-69ad80cbf490", @"a8420dd1-0477-4e70-9ecf-32d11bd8ebca", @"8956b439-f985-4499-9d21-188384289b39", @"4a0d6939-20ec-4020-b877-8341d8a59852", @"4c054b6a-0fe0-4af3-9a85-927ca72bea21", @"186de36e-a8a8-4b6b-a43f-5a0dade14897", @"7f6ca532-508c-40a3-870c-6ff315c51169", @"7e51e98e-f5c5-4dcf-873e-9a210d28075a", @"c0a3378e-4c44-4873-8033-c20be3e738e1", @"3a984e01-ead8-4977-bdd7-a62e0082eb09", @"4450ffa6-e5fe-4154-9101-0569b3f84133", @"a120164f-801f-4c85-bebb-07d3b7c138a9", @"45aa07fd-3bf0-490c-b96d-3c2fdb6ed418", @"9b712f36-1499-4478-93f0-4def10f81fe5", @"961b5d4a-3791-40c1-ac99-110fe98fdf0f", @"ab82256d-629c-4f1f-b0c9-84865c7837d3", @"a8ecc4ce-0069-4501-8c0a-489a9b4e07ca", @"2bc0f7c8-8ea3-45c6-b39a-077c13116ae2", @"40fd3c5c-0c48-4e78-9445-ad3df278d742", @"2be6b75a-e5e0-4e78-b028-2301ec7e5d46", @"2eb80062-9eb0-48fc-854e-7fbe2f5d0648", @"1604f65b-efdc-4e56-8f52-7cb205bed628", @"91be139a-987b-41dd-8a51-b9b5a5618829", @"bf0ee1b0-afe8-4d75-b95b-300f55f34d88", @"0c5c280b-b4b2-4287-9bc4-2671d9265ee1", @"f0db4e5d-f731-40df-84f7-ab182df332be", @"9068aa22-e1a8-49d6-a683-5a167f37bf81", @"5404c22e-eff8-4b35-825a-ed5c8f7bf294", @"01c7dd7e-572b-41bc-a56f-8566d8454f20", @"84bca864-9560-456a-8495-9eb7def80466", @"53eb4768-30da-493f-b71e-da3119370307", @"004f62ea-c77d-41ac-824a-ad7c17e312b1", @"9047a2c5-f601-4800-9ed4-287e93c99ac8", @"97c22240-1179-4b5d-a718-5170297bd24f", @"4c15ce21-4908-409a-ab57-4739ae31a42e", @"c460cfbe-1b27-45d8-a072-cf5949afad02", @"99fabaf1-989a-493f-8e35-db3fa10eb8c7", @"db5c9aed-2079-45bc-a227-7dec0c2e4255", @"62e8a294-cce7-45ec-915a-14adcd09dec0", @"c36811d9-7b32-416a-ac43-0b37cc093cc9", @"4f82b050-bd52-45c1-9ee0-b9ac54330a58", @"6d7d73d1-af7c-4650-aa84-c37fe3b4252d", @"769fdc73-1f1c-47a0-898c-7aebe901b1a7", @"5a041cf9-6746-4195-aab9-6367dce087f7", @"5615efed-bbd0-496e-9d3b-ea693c775a2b", @"cebc3d1b-2b04-41fc-82fa-29a814c35190", @"dfb43fa7-1dc2-4df0-bafc-88c5868352c0", @"84dfe5eb-2ebf-431b-bcc4-52e437b53de1"};


@interface MediationTestViewController ()<TXADBannerViewDelegate, TXADInterstitialAdDelegate, TXADNativeAdDelegate, TXADRewardedVideoAdDelegate>


@property (nonatomic, strong) TXADNativeAd *nativeAd;
@property (nonatomic, strong) UIView *nativeAdView;

@property (nonatomic, strong) TXADInterstitialAd *interstitalAd;
@property (nonatomic, strong) TXADRewardedVideoAd *rewardAd;
@property (nonatomic, strong) TXADBannerView *bannerAd;

@property (nonatomic, strong) UIButton *showIntBtn;
@property (nonatomic, strong) UIButton *showNativeBtn;

@property (nonatomic, strong) UIButton *showRewardBtn;

@property (nonatomic, strong) UIView *banner;
@property (nonatomic, strong) UIButton *closeBtn;

@property (nonatomic, strong) UIButton *loadBannerBtn;
@property (nonatomic, strong) UIButton *loadIntBtn;
@property (nonatomic, strong) UIButton *loadNativeBtn;

@property (nonatomic, strong) UIButton *loadRewardBtn;

@property (nonatomic) NSInteger adxIndex;

@property (nonatomic, strong) TXADNativeAdLayout *nativeLayout;

@property (nonatomic) BOOL hasRetried;

@end

@implementation MediationTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.adxIndex = 0;
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
    [testBannerBtn addTarget:self action:@selector(testBanner) forControlEvents:UIControlEventTouchUpInside];
    self.loadBannerBtn = testBannerBtn;
    
    UIButton *testloadIntBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    testloadIntBtn.frame = CGRectMake(20, testBannerBtn.frame.origin.y + 50, 150, 30);
    [self.view addSubview:testloadIntBtn];
    [testloadIntBtn setTitle:@"load Intersitial" forState:UIControlStateNormal];
    //[testloadIntBtn setBackgroundColor:[UIColor blueColor]];
    [testloadIntBtn setTitleColor:[UIColor colorWithRed:28.0/255.0 green:147.0/255.0 blue:243.0/255.0 alpha:1.0]  forState:UIControlStateNormal];
    [testloadIntBtn setTitleColor:[UIColor colorWithRed:135.0/255.0 green:216.0/255.0 blue:80.0/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [testloadIntBtn addTarget:self action:@selector(loadInteristial) forControlEvents:UIControlEventTouchUpInside];
    
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
    [loadNativeBtn addTarget:self action:@selector(loadNative) forControlEvents:UIControlEventTouchUpInside];
    self.loadNativeBtn = loadNativeBtn;
    
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
    [loadRewardBtn addTarget:self action:@selector(loadReward) forControlEvents:UIControlEventTouchUpInside];
    
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
        make.height.equalTo(@(70));
    }];
    
    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [closeBtn setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(closeBanner) forControlEvents:UIControlEventTouchUpInside];
    [banner addSubview:closeBtn];
    self.closeBtn = closeBtn;
    
    [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(banner).offset(-5);
        make.top.equalTo(banner).offset(5);
        make.width.equalTo(@(15));
        make.height.equalTo(@(15));
    }];
    
    self.banner = banner;
    banner.hidden = YES;
    
    [self createNativeAd];
}

- (void) closePage {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)testBanner {
    if (self.adxIndex >= sizeof(BANNER_ADUNITID)/sizeof(@"")) {
        self.adxIndex = 0;
        [self loadNative];
        return;
    }
    
    NSLog(@"################current banner index %ld adunitID: %@", self.adxIndex,(NSString *)BANNER_ADUNITID[self.adxIndex] );
    
    TXADBannerView *bannerView = [[TXADBannerView alloc] initWithAdUnitId:(NSString *)BANNER_ADUNITID[self.adxIndex] rootViewController:self];
    bannerView.delegate = self;
    
    [self.banner addSubview:bannerView];
    
    [bannerView loadAd];
}

- (void) closeBanner {
    if (self.bannerAd != nil) {
        [self.bannerAd removeFromSuperview];
        self.bannerAd = nil;
        self.banner.hidden = YES;
        
        [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(LoadNextAds) userInfo:nil repeats:NO];
    }
}

- (void) closeNative {
    self.nativeAdView.hidden = YES;
    
    if (self.nativeAd != nil) {
        [[self.nativeAd getAdView] removeFromSuperview];
        self.nativeAd = nil;
        [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(LoadNextNativeAds) userInfo:nil repeats:NO];
    }
    
}

- (void)createNativeAd {
    UIView *adView = [[UIView alloc] initWithFrame:CGRectMake(10, ScreenHeight-kBottomSafeHeight-70-270, ScreenWidth-20, 250)];
    
    [adView setBackgroundColor:[UIColor colorWithRed:206.0/255.0 green:206.0/255.0 blue:206.0/255.0 alpha:1]];
    [self.view addSubview:adView];
    adView.layer.borderColor = [UIColor colorWithRed:36.0/255.0 green:189.0/255.0 blue:155.0/255.0 alpha:1].CGColor;
    adView.layer.cornerRadius = 10;
    adView.layer.borderWidth = 2;
    self.nativeAdView = adView;
    
    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [closeBtn setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(closeNative) forControlEvents:UIControlEventTouchUpInside];
    [adView addSubview:closeBtn];
    
    [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(adView).offset(-5);
        make.top.equalTo(adView).offset(5);
        make.width.equalTo(@(15));
        make.height.equalTo(@(15));
    }];
    
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

- (void) sendTouchEventOnClose {
    [self.closeBtn sendActionsForControlEvents:UIControlEventTouchUpInside];
}

- (void) LoadNextAds {
    self.adxIndex++;
    [self.loadBannerBtn sendActionsForControlEvents:UIControlEventTouchUpInside];
}

- (void) LoadNextNativeAds {
    self.adxIndex++;
    [self.loadNativeBtn sendActionsForControlEvents:UIControlEventTouchUpInside];
}

- (void) LoadNextInterstitial {
    self.adxIndex++;
    [self loadInteristial];
}

- (void) LoadNextReward {
    self.adxIndex++;
    [self loadReward];
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
        make.height.equalTo(@(50));
    }];
}

- (void)txAdBanner:(TXADBannerView *)bannerView didFailToReceiveAdWithError:(TXADAdError *)adError {
    NSLog(@"TXADBannerView didFailToReceiveAdWithError %d, adunitID: %@" , (int)[adError getCode], bannerView.adUnitId);
    
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(LoadNextAds) userInfo:nil repeats:NO];
}

- (void)txAdBannerWillPresentScreen:(TXADBannerView *)bannerView {
    NSLog(@"TXADBannerView txAdBannerWillPresentScreen, adUnitId is %@", bannerView.adUnitId);
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(sendTouchEventOnClose) userInfo:nil repeats:NO];
}

- (void)txAdBannerDidDismissScreen:(TXADBannerView *)bannerView {
    NSLog(@"TXADBannerView txAdBannerDidDismissScreen, adUnitId is %@", bannerView.adUnitId);
}


- (void)txAdBannerWillLeaveApplication:(TXADBannerView *)bannerView {
    NSLog(@"TXADBannerView txAdBannerWillLeaveApplication, adUnitId is %@", bannerView.adUnitId);
}


#pragma  mark intersitial
- (void) loadInteristial {
    if (self.adxIndex >= sizeof(INTERSTITIAL_ADUNITID)/sizeof(@"")) {
        self.adxIndex = 0;
        [self loadReward];
        return;
    }
    NSLog(@"################current interstitial index %ld adunitID: %@", self.adxIndex,(NSString *)INTERSTITIAL_ADUNITID[self.adxIndex] );
    
    self.interstitalAd = [[TXADInterstitialAd alloc] initWithAdUnitId:(NSString *)INTERSTITIAL_ADUNITID[self.adxIndex]];
    self.interstitalAd.delegate = self;
    [self.interstitalAd loadAd];
}

- (void)showInterstitial {
    if (self.interstitalAd.isReady)
    {
        [self.interstitalAd showFromViewController:self];
    }
}

-(void) closeInterstitalAds {
    [self.navigationController popToRootViewControllerAnimated:YES];
}


#pragma mark <WECreativeInterstitialDelegate>
- (void)txAdInterstitialDidReceiveAd:(TXADInterstitialAd *)interstitialAd {
    NSLog(@"TXADInterstitialAd txAdInterstitialDidReceiveAd, interstitialAd.adUnitId is %@", interstitialAd.adUnitId);
    self.showIntBtn.enabled = YES;
    [self.showIntBtn sendActionsForControlEvents:UIControlEventTouchUpInside];
}

- (void)txAdInterstitial:(TXADInterstitialAd *)interstitialAd didFailToReceiveAdWithError:(TXADAdError *)adError{
    NSLog(@"TXADInterstitialAd didFailToReceiveAdWithError %d", (int)[adError getCode]);
    [self LoadNextInterstitial];
}

- (void)txAdInterstitialWillPresentScreen:(TXADInterstitialAd *)interstitialAd {
    NSLog(@"TXADInterstitialAd txAdInterstitialWillPresentScreen, interstitialAd adUnitId is %@", interstitialAd.adUnitId);
    
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(closeInterstitalAds) userInfo:nil repeats:NO];
}

- (void)txAdInterstitialDidDismissScreen:(TXADInterstitialAd *)interstitialAd {
    NSLog(@"TXADInterstitialAd txAdInterstitialDidDismissScreen, interstitialAd adUnitId is %@", interstitialAd.adUnitId);
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(LoadNextInterstitial) userInfo:nil repeats:NO];
    
}

- (void)txAdInterstitialWillLeaveApplication:(TXADInterstitialAd *)interstitialAd {
    NSLog(@"TXADInterstitialAd txAdInterstitialWillLeaveApplication, interstitialAd adUnitId is %@", interstitialAd.adUnitId);
}

- (void) loadNative {
    if (self.adxIndex >= sizeof(NATIVE_ADUNITID)/sizeof(@"")) {
        self.adxIndex = 0;
        [self loadInteristial];
        return;
    }
    NSLog(@"################current native index %ld adunitID: %@", self.adxIndex,(NSString *)NATIVE_ADUNITID[self.adxIndex] );
    
    self.nativeAd = [[TXADNativeAd alloc] initWithAdUnitId:(NSString *)NATIVE_ADUNITID[self.adxIndex]];
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
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(LoadNextNativeAds) userInfo:nil repeats:NO];
}


- (void)txAdNativeAdWillPresentScreen:(TXADNativeAd *)nativeAd{
    NSLog(@"TXADNativeAd txAdNativeAdWillPresentScreen, nativeAd adUnitId is %@", nativeAd.adUnitId);
    
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(closeNative) userInfo:nil repeats:NO];
}


- (void)txAdNativeAdDidDismissScreen:(TXADNativeAd *)nativeAd{
    NSLog(@"TXADNativeAd txAdNativeAdDidDismissScreen, nativeAd adUnitId is %@", nativeAd.adUnitId);
}


- (void)txAdNativeAdWillLeaveApplication:(TXADNativeAd *)nativeAd {
    NSLog(@"TXADNativeAd txAdNativeAdWillLeaveApplication, nativeAd adUnitId is %@", nativeAd.adUnitId);
}

- (void)loadReward {
    if (self.adxIndex >= sizeof(REWARDEDVIDEO_ADUNITID)/sizeof(@"")) {
        return;
    }
    NSLog(@"################current reward index %ld adunitID: %@", self.adxIndex,(NSString *)REWARDEDVIDEO_ADUNITID[self.adxIndex] );
    
    self.rewardAd = [[TXADRewardedVideoAd alloc] initWithAdUnitId:(NSString *)REWARDEDVIDEO_ADUNITID[self.adxIndex]];
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
    self.hasRetried = NO;
    [self.showRewardBtn sendActionsForControlEvents:UIControlEventTouchUpInside];
}


- (void)txAdRewardedVideo:(TXADRewardedVideoAd *)rewardedVideoAd didFailToReceiveAdWithError:(TXADAdError *)adError {
    NSLog(@"txAdRewardedVideo didFailToReceiveAdWithError %d",(int)[adError getCode]);
    if (self.hasRetried) {
        self.hasRetried = NO;
        [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(LoadNextReward) userInfo:nil repeats:NO];
    } else {
        self.hasRetried = YES;
        [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(loadReward) userInfo:nil repeats:NO];
    }
}

- (void)txAdRewardedVideoDidStart:(TXADRewardedVideoAd *)rewardedVideoAd {
    NSLog(@"txAdRewardedVideo txAdRewardedVideoDidStart, rewardedVideoAd adUnitId is %@", rewardedVideoAd.adUnitId);
}

- (void)txAdRewardedVideoDidClose:(TXADRewardedVideoAd *)rewardedVideoAd{
    NSLog(@"txAdRewardedVideo txAdRewardedVideoDidComplete, rewardedVideoAd adUnitId is %@", rewardedVideoAd.adUnitId);
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(LoadNextReward) userInfo:nil repeats:NO];
}

- (void)txAdRewardedVideo:(TXADRewardedVideoAd *)rewardedVideoAd didReward:(TXADRewardItem *)item {
    NSLog(@"txAdRewardedVideo did reward, rewardedVideoAd adUnitId is %@", rewardedVideoAd.adUnitId);
}

@end
