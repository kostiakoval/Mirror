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
  s.author           = { "Konstantin Koval" => "konstantin.koval1@gmail.com" }
  s.source           = { :git => "https://github.com/kostiakoval/Mirror.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/kostiakoval'

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
