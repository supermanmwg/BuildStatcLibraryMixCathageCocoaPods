Pod::Spec.new do |s| 
  s.name         = "MBProgressHUD"
  s.version      = "1.2.0"
  s.summary      = "An iOS activity indicator view."
  s.description  = <<-DESC
                    MBProgressHUD is an iOS drop-in class that displays a translucent HUD
                    with an indicator and/or labels while work is being done in a background thread.
                    The HUD is meant as a replacement for the undocumented, private UIKit UIProgressHUD
                    with some additional features.
                   DESC
  s.homepage     = "http://www.bukovinski.com"
  s.license      = { :type => 'MIT' }
  s.author       = { 'Matej Bukovinski' => 'matej@bukovinski.com' }
  s.source       = { :git => "https://github.com/matej/MBProgressHUD.git", :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.requires_arc = true
  s.vendored_frameworks = 'MBProgressHUD.framework'
  s.static_framework = true
  s.xcconfig = { 'HEADER_SEARCH_PATHS' => '"${SRCROOT}/CarthagePods/MBProgressHUD/MBProgressHUD.framework/Headers"' }
end
