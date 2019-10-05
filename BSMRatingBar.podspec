#
#  Be sure to run `pod spec lint BSMRatingBar.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

# 1
s.platform = :ios
s.ios.deployment_target = '12.0'
s.name = "BSMRatingBar"
s.summary = "BSMRatingBar lets a user select a rating with an animation"
s.requires_arc = true

# 2
s.version = "0.1.0"

# 3
s.license = { :type => "MIT", :file => "LICENSE" }

# 4 - Replace with your name and e-mail address
s.author = { "Bassam Fouad" => "bassamfouad92@gmail.com" }

# 5 - Replace this URL with your own GitHub page's URL (from the address bar)
s.homepage = "https://bassamfouad92:gamerbsm92@github.com/bassamfouad92/BSMRatingBar"

# 6 - Replace this URL with your own Git URL from "Quick Setup"
s.source = { :git => "https://bassamfouad92:gamerbsm92@github.com/bassamfouad92/BSMRatingBar.git",
:tag => "#{s.version}" }

# 7
s.source_files = "BSMRatingBar/**/*.{swift}"

# 10
s.resources = "BSMRatingBar/**/*.{png,jpeg,jpg,storyboard,xib,xcassets}"

# 9
s.swift_version = "4.2"

end

