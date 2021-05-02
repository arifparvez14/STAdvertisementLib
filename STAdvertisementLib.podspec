
Pod::Spec.new do |spec|

  spec.name         = "STAdvertisementLib"
  spec.version      = "0.0.3"
  spec.summary      = "STAdvertisementLib app is a library app for the ST user"

  spec.description  = <<-DESC
 This CocoaPods library helps you perform meaningful calculation like addition and others.
                   DESC

  spec.homepage     = "http://EXAMPLE/STAdvertisementLib"

  spec.homepage     = "https://github.com/arifparvez14/STAdvertisementLib"
  spec.license      = { :type => "MIT", :file => "LICENSE" }


  spec.author             = { "Muhammad Ariful Islam" => "arif.mbstu22@gmail.com" }

  spec.ios.deployment_target = "12.1"
  spec.swift_version = "4.2"

  spec.source       = { :git => "https://github.com/arifparvez14/STAdvertisementLib.git", :tag => "#{spec.version}" }
  spec.source_files  = "STAdvertisementLib/**/*.{h,m,swift,xib}"


end
