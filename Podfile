source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'

use_frameworks!
inhibit_all_warnings!

def myPods
  pod 'ThunderCats', '~> 2.1'
  pod 'SkyFloatingLabelTextField', '~> 2.0'
  pod 'M13ProgressSuite', '~> 1.2'
  pod 'Crashlytics', '~> 3.8'
  pod 'PureLayout', '~> 3.0'
  pod 'RMDateSelectionViewController'
  pod 'SDWebImage', '~> 4.2'
  pod 'UICKeyChainStore'
  pod 'Firebase/Core'	         # Prerequisite libraries and Analytics
  pod 'Firebase/Auth'	         # Authentication
  pod 'Firebase/Database'	     # Realtime Database
  pod 'Firebase/Storage'       # Storage
end

target 'Seiken' do
  myPods

  target 'SeikenTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'SeikenUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
