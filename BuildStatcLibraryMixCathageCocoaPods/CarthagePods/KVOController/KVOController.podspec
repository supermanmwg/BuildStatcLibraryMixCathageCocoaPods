Pod::Spec.new do |s| 
  s.name         = 'KVOController'
  s.version      = '1.2.0'
  s.license      =  { :type => 'BSD' }
  s.homepage     = 'https://github.com/facebook/KVOController'
  s.authors      = { 'Kimon Tsinteris' => 'kimon@mac.com', 'Nikita Lutsenko' => 'nlutsenko@me.com' }
  s.summary      = 'Simple, modern, thread-safe key-value observing.'
  s.description  = <<-DESC
                      KVOController builds on Cocoa's time-tested key-value observing implementation. It offers a simple, modern API, that is also thread safe.
                      Benefits include:
                      Notification using blocks, custom actions, or NSKeyValueObserving callback.
                      No exceptions on observer removal.
                      Implicit observer removal on controller dealloc.
                      Thread-safety with special guards against observer resurrection.
                      DESC
  s.source       = { :git => 'https://github.com/facebook/KVOController.git', :tag => "v#{s.version.to_s}" }
  s.ios.deployment_target = '6.0'
  s.requires_arc = true
  s.vendored_frameworks = 'KVOController.framework'
  s.static_framework = true
  s.xcconfig = { 'HEADER_SEARCH_PATHS' => '"${SRCROOT}/CarthagePods/KVOController/KVOController.framework/Headers"' }
end
