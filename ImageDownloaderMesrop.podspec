#
# Be sure to run `pod lib lint ImageDownloaderMesrop.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ImageDownloaderMesrop'
  s.version          = '0.1.0'
  s.summary          = 'A lightweight Swift utility for downloading and caching images.'

  s.description      = <<-DESC
 ImageDownloader is a lightweight Swift utility that simplifies downloading and caching images from the web.
  It’s ideal for use in iOS apps where performance and simplicity are key.
                       DESC

  s.homepage         = 'https://github.com/MesropGrigoryan/ImageDownloaderMesrop'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'MesropGrigoryan' => 'megrigoryan@griddynamics.com' }
  s.source           = { :git => 'https://github.com/MesropGrigoryan/ImageDownloaderMesrop.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'
  s.swift_version = '5.0'

  s.source_files = '*.swift'
  # Source/**/*.{swift,h,m}g
  
  # s.resource_bundles = {
  #   'ImageDownloaderMesrop' => ['ImageDownloaderMesrop/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
