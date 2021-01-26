Pod::Spec.new do |s|
  s.name         = "MMKV"
  s.version      = "1.2.7"
  s.summary      = "MMKV is a cross-platform key-value storage framework developed by WeChat."

  s.description  = <<-DESC
                      The MMKV, for Objective-C.
                      MMKV is an efficient, complete, easy-to-use mobile key-value storage framework used in the WeChat application.
                      It can be a replacement for NSUserDefaults & SQLite.
                   DESC

  s.homepage     = "https://github.com/Tencent/MMKV"
  s.license      = { :type => "BSD 3-Clause" }
  s.author       = { "guoling" => "guoling@tencent.com" }
  s.source       = { :git => "https://github.com/Tencent/MMKV.git", :tag => "v#{s.version}" }
  s.requires_arc = false
  s.ios.deployment_target = "9.0"
  s.vendored_frameworks = 'MMKV.framework'
  s.pod_target_xcconfig = {
    "CLANG_CXX_LANGUAGE_STANDARD" => "gnu++17",
    "CLANG_CXX_LIBRARY" => "libc++",
    "CLANG_WARN_OBJC_IMPLICIT_RETAIN_SELF" => "NO",
  }
  s.xcconfig = { 'HEADER_SEARCH_PATHS' => '"${SRCROOT}/CarthagePods/MMKV/MMKV.framework/Headers"' }
end
