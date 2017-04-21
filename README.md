# Mushroom
一:采用MVP开发模式<br />
1:数据的请求与得到数据完全独立 减少网络请求代码过长与耦合<br />
2:增加网络模块非常方便 <br />
1:handleShowCellCount 控制其cell数量<br />
2:ViewPresenster extension  29行 内可方便增加 方法<br />
3:得到数据 只刷新对应cell<br />
4:cell偷懒了 并没有写多个 -_-! 但是不影响整体框架思路  <br />

二:swift 与 oc 混合开发<br />
1:oc用于封装基本库 稍有积累的公司 都应该有自己的一套基本库 这里模拟了http.framework<br />
2:创建 1targets ->aggregate -> run script 自动构建framework脚本<br />
3:基于OC的稳定性 所以用OC作为基本库的封装<br />
4:本DEMO 利用xcworkspace 既项目开发 也是基本库封装的过程<br />

三:lib中 是自己封装的 <br />
1:swiftProgressHUD  HUD https://github.com/dacaizhao/swiftProgressHUD<br />
2:MJExtensionSwift  模型解析 https://github.com/dacaizhao/MJExtensionSwift<br />

四:网络请求采用懒加载方式<br />
1:willDisplay tableView 即将显示时候请求网络<br />
2:handleShowCellArr 维护数组 防止重复请求<br />
3:支持未请求之前也显示一定的页面 <br />
