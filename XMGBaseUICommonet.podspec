
Pod::Spec.new do |spec|
  # 名称，pod search搜索的关键词,注意这里一定要和pod spec create XMGBaseUICommonet中的名称一样,否则报错
  spec.name         = "XMGBaseUICommonet"
  # 版本号
  spec.version      = "1.0.3"
  # 库的简介
  spec.summary      = "为了用户体验，自己封装了一些UIKit工具库方便使用"
  # 库的描述
  spec.description  = "为了用户体验，自己封装了一些UIKit工具库方便使用,为了用户体验，自己封装了一些UIKit工具库方便使用为了用户体验，自己封装了一些UIKit工具库方便使用"
  # 项目主页地址
  spec.homepage     = "https://github.com/maweefeng/XMGBaseUICommonet"
  # 许可证 （固定写法，还不清楚为什么要这样写）
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  # 作者 填自己的名字和邮箱或者什么的 不是太重要
  spec.author             = { "maweefeng" => "maweefeng@gmail.com" }
  # 支持的pod的最低系统版本（已过期），改为使用s.platform
  spec.platform     = :ios, "10.0"
  # 项目的地址（这个必须写正确）
  # 其他关联方式
  # 将这个Pod版本与Git仓库中某个commit绑定
  spec.source       = { :git => "https://github.com/maweefeng/XMGBaseUICommonet.git", :tag => spec.version }
  # 需要包含的源文件
  # 源文件的其他写法
  # *匹配所有文件
  # s.source_files  = "BaseUICommponet/*"
  # *.{h,m}匹配所有.h和.m结尾的文件
  # s.source_files  ="BaseUICommponet/*.{h,m}"
  # **表示匹配所有子目录
  # s.source_files  ="BaseUICommponet/**/*"
  spec.source_files  = "XMGBaseUICommonet/Classes/*"
  spec.exclude_files = "XMGBaseUICommonet/Classes/Exclude"

  # spec.resource  = "icon.png"
  # spec.resources = "Resources/*.png"

  spec.frameworks = "UIKit","Foundation"
  # 如果是swfit编写，需要制定swfit语言版本
  spec.swift_version = '5.0'
  # 是否需要ARC自动管理内存
  spec.requires_arc = true

  # 依赖库，不能依赖未发布的库
  spec.dependency  'SnapKit','~> 5.0.1'
  spec.dependency  'pop','~> 1.0.12'
    spec.dependency  'SDWebImage','5.2.3'
   #头像居中
     spec.dependency 'FaceAware','2.1.0'
     spec.dependency 'MJRefresh','3.2.0'
   #弹出框
     spec.dependency 'MMPopupView','1.7.2'
   #空白页展示
     spec.dependency 'DZNEmptyDataSet'
end

