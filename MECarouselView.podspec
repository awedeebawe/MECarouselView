Pod::Spec.new do |s|
  s.name         = "MECarouselView"
  s.version      = "1.0.0"
  s.summary      = "A carousel view to UIKit-based applications."

  s.description  = "The MECarouselView is a UIKit framework highly customizable and very adaptative."

  s.homepage     = "https://github.com/massaentertainment"
  s.screenshots  = "https://raw.githubusercontent.com/massaeentertainment/MECircularMenu/master/Screenshots/circm.gif"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author             = "MassaEntertainment"
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/massaentertainment/MECarouselView.git", :tag => "#{s.version}" }

  s.source_files  = "MECarouselView", "CarouselScrollView/*.{h,m,swift}"
end