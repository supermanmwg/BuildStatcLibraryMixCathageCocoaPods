Pod::Spec.new do |s|
  s.name         = "MarqueeLabel"
  s.version      = "4.0.2"
  s.summary      = "A drop-in replacement for UILabel, which automatically adds a scrolling marquee effect when needed."
  s.homepage     = "https://github.com/cbpowell/MarqueeLabel"
  s.license      = { :type => 'MIT' }
  s.author       = "Charles Powell"
  s.source       = { :git => "https://github.com/cbpowell/MarqueeLabel.git", :tag => s.version.to_s }
  s.frameworks   = 'UIKit', 'QuartzCore'
  s.requires_arc = true
  s.source_files = 'Sources/*.swift'
  s.ios.deployment_target = '9.0'
  s.swift_version = '5.0'
  s.vendored_frameworks = 'MarqueeLabel.framework'
  s.xcconfig = { 'HEADER_SEARCH_PATHS' => '"${SRCROOT}/CarthagePods/MarqueeLabel/MarqueeLabel.framework/Headers"' }
end
