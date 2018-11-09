
Pod::Spec.new do |s|

  s.name         = "KLPersonalCenter"
  s.version      = "0.0.3"
  s.summary      = "项目中的个人中心控制器，通过传入一个plist文件，轻松构建"

  s.homepage     = "https://github.com/KingLight/KLPersonalCenter.git"

  s.license      = "MIT"

  s.author             = { "King" => "dreamhut417@163.com" }

  s.platform     = :ios
  s.platform     = :ios, "9.0"

  s.source       = { :git => "https://github.com/KingLight/KLPersonalCenter.git", :tag => "#{s.version}" }

  #s.source_files  = "Classes", "Classes/**/*.{h,m}"
  # s.public_header_files = "Classes/**/*.h"

  s.framework  = "UIKit"

  s.requires_arc = true

    s.subspec 'Model' do |ss|
      ss.source_files = 'KLPersonalCenter/KLPersonalCenter/Model/*.{h,m}'
    end

    s.subspec 'View' do |ss|
      ss.dependency 'KLPersonalCenter/Model'
      ss.source_files = 'KLPersonalCenter/KLPersonalCenter/View/*.{h,m}'
    end

    s.subspec 'Controller' do |ss|
      ss.dependency 'KLPersonalCenter/Model'
      ss.dependency 'KLPersonalCenter/View'
      ss.source_files = 'KLPersonalCenter/KLPersonalCenter/Controller/*.{h,m,xib,nib}'
    end

end
