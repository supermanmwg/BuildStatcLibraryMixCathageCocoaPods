Pod::Spec.new do |s| 
  s.name         = 'SAMKeychain'
  s.version      = '1.5.3'
  s.description  = 'Simple Cocoa wrapper for the keychain that works on OS X, iOS, tvOS, and watchOS.'
  s.summary      = 'Simple Cocoa wrapper for the keychain.'
  s.homepage     = 'https://github.com/soffes/samkeychain'
  s.author       = { 'Sam Soffes' => 'sam@soff.es' }
  s.source       = { :git => 'https://github.com/soffes/samkeychain.git', :tag => "v#{s.version}" }
  s.license      = { :type => 'MIT' }
  s.ios.deployment_target = '5.0'
  s.vendored_frameworks = 'SAMKeychain.framework'
  s.static_framework = true
  s.xcconfig = { 'HEADER_SEARCH_PATHS' => '"${SRCROOT}/CarthagePods/SAMKeychain/SAMKeychain.framework/Headers"' }
end
