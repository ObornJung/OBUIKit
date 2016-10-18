
Pod::Spec.new do |s|

    s.name         = "OBUIKit"
    s.version      = "1.0.0"
    s.summary      = "Base UI library."

    s.description      = <<-DESC
    TODO: A library of base UI.
    DESC

    s.homepage     = "https://github.com/ObornJung/OBUIKit"
    s.license      = { :type => "MIT", :file => "LICENSE" }
    s.author       = { "Oborn.Jung" => "obornjung@gmail.com" }
    s.authors      = { "Oborn.Jung" => "obornjung.jj@alibaba-inc.com" }

    s.platform     = :ios, "7.0"
    s.source       = { :git => "https://github.com/ObornJung/OBUIKit.git", :tag => s.version }

    s.source_files = 'OBUIKit/*.{m,h}'
    s.public_header_files = 'OBUIKit/*.h'

    s.subspec 'Moudle' do |ss|
        ss.source_files = 'OBUIKit/Moudle/**/*.{m,h}'
        ss.public_header_files = 'OBUIKit/Moudle/**/*.h'
    end

    s.subspec 'UIExtend' do |ss|
        ss.source_files = 'OBUIKit/UIExtend/**/*.{m,h}'
        ss.public_header_files = 'OBUIKit/UIExtend/**/*.h'
    end

    s.requires_arc = true
    s.frameworks   = "Foundation", "UIKit"

end
