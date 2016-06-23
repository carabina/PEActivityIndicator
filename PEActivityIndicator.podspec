
Pod::Spec.new do |s|
  s.name             = 'PEActivityIndicator'
  s.version          = '0.1.0'
  s.summary          = 'Custom activity indicator'

  s.description      = <<-DESC
    This pod provides customizable activity indicator
                          DESC

  s.homepage         = 'https://github.com/PavelEvsaev/PEActivityIndicator'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Pavel Evsaev' => 'pavel.evsaev@gmail.com' }
  s.source           = { :git => 'https://github.com/PavelEvsaev/PEActivityIndicator.git', :tag => s.version.to_s }

  s.ios.deployment_target = '7.0'
  s.source_files = 'PEActivityIndicator/Classes/**/*'
  s.public_header_files = 'PEActivityIndicator/Classes/**/*.h'
  s.frameworks = 'UIKit'

end
