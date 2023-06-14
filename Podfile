# Uncomment the next line to define a global platform for your project
platform :ios, '16.4'

target 'Playgrounds' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Playgrounds
  pod 'SnapKit'
  pod 'SDWebImage'
  pod 'MBProgressHUD'
  pod 'SwiftyJSON'
  pod 'DeviceKit'
  pod 'Tiercel'
  pod 'HandyJSON'
  pod 'R.swift'
  
  # 视图层级
  pod 'LookinServer', :configurations => ['Debug']end

post_install do |installer|
  installer.generated_projects.each do |project|
    project.targets.each do |target|
      target.build_configurations.each do |config|
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '11.0'
       end
    end
  end
end
