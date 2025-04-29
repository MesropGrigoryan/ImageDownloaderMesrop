#
# Be sure to run `pod lib lint ImageDownloaderMesrop.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ImageDownloaderMesrop'
  s.version          = '0.1.8' # <- Match latest git tag
  s.summary          = 'A lightweight Swift utility for downloading and caching images.'

  s.description      = <<-DESC
ImageDownloader is a lightweight Swift utility that simplifies downloading and caching images from the web.
It’s ideal for use in iOS apps where performance and simplicity are key.
  DESC

  s.homepage         = 'https://github.com/MesropGrigoryan/ImageDownloaderMesrop'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'MesropGrigoryan' => 'megrigoryan@griddynamics.com' }
  s.source           = { :git => 'https://github.com/MesropGrigoryan/ImageDownloaderMesrop.git', :tag => s.version.to_s }

  s.ios.deployment_target = '12.0' # <- CocoaPods warns if less than 12.0
  s.swift_version = '5.0'

  s.source_files = '*.swift'

  s.exclude_files = ['Package.swift', 'Example/SupportingFiles/Info.plist', 'Tests/SupportingFiles/Info.plist']

end
