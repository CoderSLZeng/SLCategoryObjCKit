#
# Be sure to run `pod lib lint SLCategoryObjCKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'SLCategoryObjCKit'
    s.version          = '0.4.1'
    s.summary          = '封装了常用控件的分类库'
    
    # This description is used to generate tags and improve search results.
    #   * Think: What does it do? Why did you write it? What is the focus?
    #   * Try to keep it short, snappy and to the point.
    #   * Write the description between the DESC delimiters below.
    #   * Finally, don't worry about the indent, CocoaPods strips it!
    
    s.description      = <<-DESC
    封装了
    1.BarButtonItem
    2.Button
    3.Calendar
    4.Color
    5.Date
    6.Image
    7.ImageView
    8.String
    9.TextField
    10.View
    11.Window
    12.Object
    等分类。
    DESC
    
    s.homepage         = 'https://github.com/CoderSLZeng/SLCategoryObjCKit'
    # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'CoderSLZeng' => '359297567@qq.com' }
    s.source           = { :git => 'https://github.com/CoderSLZeng/SLCategoryObjCKit.git', :tag => s.version.to_s }
    # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
    
    s.ios.deployment_target = '8.0'
    
    # 导入二进制文件和非二进制文件判断
    if ENV['IS_BINARY']
        
        s.source_files = 'SLCategoryObjCKit/Classes/**/*.h'
        s.public_header_files = 'SLCategoryObjCKit/Classes/**/*.h'
        s.dependency 'SDWebImage'
        s.dependency 'AFNetworking/Reachability'
        
        if ENV['IS_LIB'] # Use demo: IS_BINARY=1 IS_LIB=1 pod install
            
            # 打包 【.a】 文件命令行
            # pod package SLCategoryObjCKit.podspec --library --exclude-deps --spec-sources='https://github.com/CoderSLZeng/SLCategoryObjCKit.git,https://github.com/CocoaPods/Specs.git'
            
            s.ios.vendored_libraries = 'SLCategoryObjCKit/Products/libSLCategoryObjCKit.a'
            
            else # Use demo: IS_BINARY=1 pod install
            
            # 打包 【.framework】 文件命令行
            # pod package SLCategoryObjCKit.podspec  --exclude-deps --spec-sources='https://github.com/CoderSLZeng/SLCategoryObjCKit.git,https://github.com/CocoaPods/Specs.git'
            
            s.ios.vendored_frameworks = 'SLCategoryObjCKit/Products/SLCategoryObjCKit.framework'
            
        end
        
        else # Use demo: pod install
        # 导入资源文件
        # s.source_files = 'SLCategoryObjCKit/Classes/**/*{.h,.m}'
        
        # 导入图片资源文件
        # s.resource_bundles = {
        #   'SLCategoryObjCKit' => ['SLCategoryObjCKit/Assets/*.png']
        # }
        
        # Subspec
        s.subspec 'BarButtonItem' do |barButtonItem|
            barButtonItem.source_files = 'SLCategoryObjCKit/Classes/BarButtonItem/*.{h,m}'
        end
        
        s.subspec 'Calendar' do |calendar|
            calendar.source_files = 'SLCategoryObjCKit/Classes/Calendar/*.{h,m}'
        end
        
        s.subspec 'View' do |view|
            view.source_files = 'SLCategoryObjCKit/Classes/View/*.{h,m}'
        end
        
        s.subspec 'Image' do |image|
            image.source_files = 'SLCategoryObjCKit/Classes/Image/*.{h,m}'
        end
        
        s.subspec 'ImageView' do |imageView|
            imageView.source_files = 'SLCategoryObjCKit/Classes/ImageView/*.{h,m}'
            imageView.dependency 'SDWebImage'
            imageView.dependency 'AFNetworking/Reachability'
        end
        
        s.subspec 'TextField' do |textField|
            textField.source_files = 'SLCategoryObjCKit/Classes/TextField/*.{h,m}'
        end
        
        s.subspec 'Window' do |window|
            window.source_files = 'SLCategoryObjCKit/Classes/Window/*.{h,m}'
        end
        
        s.subspec 'Color' do |color|
            color.source_files = 'SLCategoryObjCKit/Classes/Color/*.{h,m}'
        end
        
        s.subspec 'Date' do |date|
            date.source_files = 'SLCategoryObjCKit/Classes/Date/*.{h,m}'
        end
        
        s.subspec 'String' do |string|
            string.source_files = 'SLCategoryObjCKit/Classes/String/*.{h,m}'
        end
        
        s.subspec 'Button' do |button|
            button.source_files = 'SLCategoryObjCKit/Classes/Button/*.{h,m}'
        end
        
        s.subspec 'Foundation' do |foundation|
            foundation.source_files = 'SLCategoryObjCKit/Classes/Foundation/*.{h,m}'
        end
        
        s.subspec 'MutableArray' do |mutableArray|
            mutableArray.source_files = 'SLCategoryObjCKit/Classes/MutableArray/*.{h,m}'
        end
        
        s.subspec 'Array' do |array|
            array.source_files = 'SLCategoryObjCKit/Classes/Array/*.{h,m}'
        end
        
        s.subspec 'MutableDictionary' do |mutableDictionary|
            mutableDictionary.source_files = 'SLCategoryObjCKit/Classes/MutableDictionary/*.{h,m}'
        end
        
        s.subspec 'Object' do |object|
            object.source_files = 'SLCategoryObjCKit/Classes/Object/*.{h,m}'
        end
    end
    # s.public_header_files = 'Pod/Classes/**/*.h'
    # s.frameworks = 'UIKit', 'MapKit'
    # s.dependency 'AFNetworking', '~> 2.3'
end
