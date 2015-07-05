#
# Be sure to run `pod lib lint Mirror.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "Mirror"
  s.version          = "0.1.0"
  s.summary          = "Mirror - the most simle runtime reflection API in Swift."
  s.description      = <<-DESC
                        Mirror provides a nice API for working with MirrorType
                        and reflect functions in Swift
                       DESC
  s.homepage         = "https://github.com/kostiakoval/Mirror"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Konstantin Koval" => "konstantin@rocketfarm.no" }
  s.source           = { :git => "https://github.com/kostiakoval/Mirror.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/kostiakoval'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'Mirror' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
