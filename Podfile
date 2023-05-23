project 'iOS_Demo.xcodeproj'
source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '12.0'

inhibit_all_warnings!
install!'cocoapods',:deterministic_uuids=>false


target 'iOS_Demo' do

    use_frameworks!
    pod 'Masonry'
    pod 'SNebulaAds'
    pod 'SNebulaAdMediation_GDT'
    pod 'SNebulaAdMediation_KuaiShou'
    pod 'SNebulaAdMediation_TikTok_CN'
    pod 'SNebulaAdMediation_Mobrain'
    pod 'SNebulaAd_Mobrain_TikTok'
#    pod 'SNebulaAd_Mobrain_KuaiShou'
#    pod 'ABUAdGdtAdapter'
#    pod 'SNebulaAd_Mobrain_GDT'

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
    end
  end
end
