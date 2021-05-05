# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'

# ignore all warnings from all pods
inhibit_all_warnings!

target 'OpenConnect' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  pod 'SwiftLint'
  pod 'SwiftGen'
  pod 'TinyConstraints'
  pod 'Tabman', '~> 2.9'
  pod 'Charts'
  pod 'gRPC-Swift', '~> 1.0.0'
  pod 'Kingfisher'
  
  # Pods for OpenConnect

  target 'OpenConnectTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'OpenConnectUITests' do
    # Pods for testing
  end

end
