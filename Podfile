# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'OCR and Translate' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for OCR and Translate

  target 'OCR and TranslateTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'OCR and TranslateUITests' do
    inherit! :search_paths
    # Pods for testing
  end

pod 'TesseractOCRiOS', '4.0.0'

post_install do |installer|
installer.pods_project.targets.each do |target|
target.build_configurations.each do |config|
config.build_settings['ENABLE_BITCODE'] = 'NO'
end
end
end

end
