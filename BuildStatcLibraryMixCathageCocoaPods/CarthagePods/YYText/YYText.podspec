Pod::Spec.new do |s| 
  s.name         = 'YYText'
  s.summary      = 'Powerful text framework for iOS to display and edit rich text.'
  s.version      = '1.0.7'
  s.license      = { :type => 'MIT' }
  s.authors      = { 'ibireme' => 'ibireme@gmail.com' }
  s.social_media_url = 'http://blog.ibireme.com'
  s.homepage     = 'https://github.com/ibireme/YYText'
  s.source       = { :git => 'https://github.com/ibireme/YYText.git', :tag => s.version.to_s }
  s.requires_arc = true
  s.ios.deployment_target = '9.0'
  s.vendored_frameworks = 'YYText.framework'
  s.static_framework = true
  s.xcconfig = { 'HEADER_SEARCH_PATHS' => '"${SRCROOT}/CarthagePods/YYText/YYText.framework/Headers"' }
end
