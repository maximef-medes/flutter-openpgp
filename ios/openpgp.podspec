#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint openpgp.podspec' to validate before publishing.
#

xcframework_path = File.join(__dir__, "OpenPGPBridge.xcframework").gsub(/ /, '\ ')
Pod::Spec.new do |s|
  s.name             = 'openpgp'
  s.version          = '0.7.0'
  s.summary          = 'library for use openPGP.'
  s.description      = <<-DESC
  library for use openPGP.
                       DESC
  s.homepage         = 'https://github.com/jerson/flutter-openpgp'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Gerson Alexander Pardo Gamez' => 'jeral17@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files =  'Classes/**/*'

  s.dependency 'Flutter'
  s.platform = :ios, '12.0'
  
  s.vendored_frameworks = 'OpenPGPBridge.xcframework'
  s.static_framework = false
  s.xcconfig = {
    'OTHER_LDFLAGS[sdk=iphoneos*]' => "$(inherited) -ObjC -force_load #{xcframework_path}/ios-arm64/OpenPGPBridge.framework/OpenPGPBridge",
    'OTHER_LDFLAGS[sdk=iphonesimulator*]' => "$(inherited) -ObjC -force_load #{xcframework_path}/ios-arm64_x86_64-simulator/OpenPGPBridge.framework/OpenPGPBridge",
    'OTHER_LDFLAGS[sdk=maccatalyst*]' => "$(inherited) -ObjC -force_load #{xcframework_path}/ios-arm64_x86_64-maccatalyst/OpenPGPBridge.framework/OpenPGPBridge"
  }
  # Flutter.framework does not contain a i386 slice. Only x86_64 simulators are supported.
  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386'
  }

  s.swift_version = '5.0'

end
