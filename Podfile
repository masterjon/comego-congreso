# Uncomment this line to define a global platform for your project
# platform :ios, '9.0'

target 'comego-congreso' do
  # Comment this line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  pod 'Alamofire', '~> 4.6.0'
  pod 'SwiftyJSON'
  pod 'Firebase/Core'
  pod 'Firebase/Messaging'
  pod 'SideMenu'
  pod 'Segmentio', '~> 2.1.2'
  pod 'ImageSlideshow', '~> 1.4'
  pod "ImageSlideshow/Alamofire"

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
    end
  end
end
