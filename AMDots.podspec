#
# Be sure to run `pod lib lint AMDots.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AMDots'
  s.version          = '1.0.3'
  s.summary          = 'AMDots is a loading indicator for iOS.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
AMDots is a loading indicator with dots moving like google loading, there is three type of the loading, scale, jump and shake, each one of them gives you a cool loading to show to the user.
                       DESC

  s.homepage         = 'https://github.com/Abedalkareem/AMDots'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Abedalkareem' => 'abedalkareem.omreyh@yahoo.com' }
  s.source           = { :git => 'https://github.com/Abedalkareem/AMDots.git', :tag => s.version.to_s }
  s.swift_version = '5.0'
   s.social_media_url = 'https://twitter.com/abedalkareemomr'

  s.ios.deployment_target = '12.0'

  s.source_files = 'AMDots/Classes/**/*'
  
  # s.resource_bundles = {
  #   'AMDots' => ['AMDots/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
