# platform :ios, '10.0'
use_frameworks!

target 'RepSetRepeat' do
  project 'RepSetRepeat/RepSetRepeat.xcodeproj'
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks

  # Pods for RepSetRepeat
  pod 'Alamofire', :git => 'https://github.com/Alamofire/Alamofire.git', :tag => ‘4.4.0’
  pod 'PINRemoteImage', '~> 2.1'
  pod 'BRYXBanner', :git => 'https://github.com/bryx-inc/BRYXBanner.git', :tag => ‘0.7.1’
  pod 'SwiftyBeaver', :git => 'https://github.com/SwiftyBeaver/SwiftyBeaver.git', :tag => '1.1.1'

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.1'
        end
    end
end