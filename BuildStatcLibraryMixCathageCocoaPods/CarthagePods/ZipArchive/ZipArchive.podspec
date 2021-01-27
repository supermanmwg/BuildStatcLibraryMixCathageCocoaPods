Pod::Spec.new do |s| 
  s.name         = 'ZipArchive'
  s.version      = '2.2.2'
  s.summary      = 'Utility class for zipping and unzipping files on iOS, tvOS, watchOS, and macOS.'
  s.description  = 'SSZipArchive is a simple utility class for zipping and unzipping files on iOS, tvOS, watchOS, and macOS. It supports AES and PKWARE encryption.'
  s.homepage     = 'https://github.com/ZipArchive/ZipArchive'
  s.license      = { :type => 'MIT' }
  s.authors      = { 'Sam Soffes' => 'sam@soff.es', 'Joshua Hudson' => nil, 'Antoine Cœur' => nil }
  s.source       = { :git => 'https://github.com/ZipArchive/ZipArchive.git', :tag => "v#{s.version}" }
  s.ios.deployment_target = '9.0'
  s.vendored_frameworks = 'ZipArchive.framework'
  s.libraries = 'z', 'iconv'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES',
  'GCC_PREPROCESSOR_DEFINITIONS' => 'HAVE_INTTYPES_H HAVE_PKCRYPT HAVE_STDINT_H HAVE_WZAES HAVE_ZLIB' }
  s.static_framework = true
  s.xcconfig = { 'HEADER_SEARCH_PATHS' => '"${SRCROOT}/CarthagePods/ZipArchive/ZipArchive.framework/Headers"' }
end
