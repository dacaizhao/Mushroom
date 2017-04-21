# Mushroom
一:采用MVP开发模式
1:数据的请求与得到数据完全独立 减少网络请求代码过长与耦合
2:增加网络模块非常方便 
1:handleShowCellCount 控制其cell数量
2:ViewPresenster extension  29行 内可方便增加 方法
3:得到数据 只刷新对应cell
4:cell偷懒了 并没有写多个 -_-! 但是不影响整体框架思路  

二:swift 与 oc 混合开发
1:oc用于封装基本库 稍有积累的公司 都应该有自己的一套基本库 这里模拟了http.framework
2:创建 1targets ->aggregate -> run script 自动构建framework脚本
3:基于OC的稳定性 所以用OC作为基本库的封装
4:本DEMO 利用xcworkspace 既项目开发 也是基本库封装的过程

三:lib中 是自己封装的 
1:swiftProgressHUD  HUD https://github.com/dacaizhao/swiftProgressHUD
2:MJExtensionSwift  模型解析 https://github.com/dacaizhao/MJExtensionSwift

四:网络请求采用懒加载方式
1:willDisplay tableView 即将显示时候请求网络
2:handleShowCellArr 维护数组 防止重复请求
3:支持未请求之前也显示一定的页面 
