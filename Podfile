# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'MobilliumCase' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

	pod 'Alamofire-SwiftyJSON', '~> 3.0'
	pod 'AlamofireObjectMapper', '5.2.1'
 	pod 'Kingfisher', '~> 6.0'

  # Pods for MobilliumCase

  target 'MobilliumCaseTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'MobilliumCaseUITests' do
    # Pods for testing
  end

end

post_install do |pi|
    pi.pods_project.targets.each do |t|
      t.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '10.0'
      end
    end
end
