#
# Be sure to run `pod lib lint TimelineTableViewCell.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ImageStackView'
  s.version          = '1.1.0'
  s.summary          = 'A beautiful image stack view'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'ImageStackView is a beautiful image stack view to show your selected images.'

  s.homepage         = 'https://github.com/kf99916/ImageStackView'
  s.screenshots      = ['https://raw.githubusercontent.com/kf99916/ImageStackView/master/screenshots/imageStackView-1.png', 'https://raw.githubusercontent.com/kf99916/ImageStackView/master/screenshots/imageStackView-2.png']
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Zheng-Xiang Ke' => 'kf99916@gmail.com' }
  s.source           = { :git => 'https://github.com/kf99916/ImageStackView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'ImageStackView/**/*.swift'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
