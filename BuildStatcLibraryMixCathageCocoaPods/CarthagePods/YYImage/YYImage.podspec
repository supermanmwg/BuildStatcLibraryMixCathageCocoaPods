Pod::Spec.new do |s| 
  s.name         = 'YYImage'
  s.summary      = 'Image framework for iOS to display/encode/decode animated WebP, APNG, GIF, and more.'
  s.version      = '1.0.4'
  s.license      = { :type => 'MIT' }
  s.authors      = { 'ibireme' => 'ibireme@gmail.com' }
  s.social_media_url = 'http://blog.ibireme.com'
  s.homepage     = 'https://github.com/ibireme/YYImage'
  s.source       = { :git => 'https://github.com/ibireme/YYImage.git', :tag => s.version.to_s }
  s.requires_arc = true
  s.ios.deployment_target = '9.0'
  s.vendored_frameworks = 'YYImage.framework'
  s.static_framework = true
  s.xcconfig = { 'HEADER_SEARCH_PATHS' => '"${SRCROOT}/CarthagePods/YYImage/YYImage.framework/Headers"' }
end
