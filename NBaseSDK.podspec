Pod::Spec.new do |s|
  s.name         = 'NBaseSDK'
  s.version      = "0.0.1-beta"
  s.summary      = 'NBase iOS Framework'
  s.description  = 'Nbase SDKs contain pre-built components and libraries you need for application development and operation.'
  s.homepage     = 'https://www.nbase.io'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'NBase' => 'contact@nbase.io' }
  s.source       = { :http => "https://github.com/nbase-io/NBaseSDK-iOS/releases/download/sdk/NBaseSDK.zip" }
  s.requires_arc = true
  s.platform = :ios, '13.0'
  s.swift_version = '5.3'
  s.documentation_url = 'https://docs.nbase.io'
  s.ios.vendored_frameworks = 'NBaseSDK/NBase.xcframework'
  # s.ios.frameworks = ['UIKit', 'CFNetwork', 'Security', 'Foundation', 'MobileCoreServices', 'SystemConfiguration', 'CoreFoundation']
  # s.ios.library   = 'icucore'
end