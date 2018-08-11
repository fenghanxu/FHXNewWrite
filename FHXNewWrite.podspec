#
# Be sure to run `pod lib lint FHXNewWrite.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FHXNewWrite'
  s.version          = '0.1.1'
  s.summary          = 'A short description of FHXNewWrite.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/fenghanxu/FHXNewWrite'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'fenghanxu' => '1162851277@qq.com' }
  s.source           = { :git => 'https://github.com/fenghanxu/FHXNewWrite.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  # s.ios.deployment_target = '8.0'

  # s.source_files = 'FHXNewWrite/Classes/**/*'
  
  # s.resource_bundles = {
  #   'FHXNewWrite' => ['FHXNewWrite/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  
  s.ios.deployment_target = '8.0'
  
  s.public_header_files = ["Sources/**/*.h","Sources/*/**/*.h","Sources/*/*/**/*.h"]
  
  s.source_files = ["Sources/**","Sources/*/**","Sources/*/*/**"]
  
  s.requires_arc = true
  
  s.frameworks = 'UIKit','Foundation'
  
  s.dependency 'SnapKit'
  
  s.dependency 'FHXFoundation'
  
  s.dependency 'YYCache'
  
  s.dependency 'Kingfisher'
  
  s.dependency 'Charts'
  
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.0' }
  
  
  
  
  
end
