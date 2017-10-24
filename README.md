# SwifterRefreshDemo
一个文件实现 Gif 下拉刷新功能

![](https://img.shields.io/badge/platform-iOS-red.svg) 
![](https://img.shields.io/badge/language-Objective--C-orange.svg) 
![](https://img.shields.io/badge/download-791K-brightgreen.svg)
![](https://img.shields.io/badge/license-MIT%20License-brightgreen.svg) 

有过一段swift开发经验的Swifter都应该知道，常规的下拉刷新使用系统级的部件很好实现，但是大多数公司会使用 Gif 作为刷新效果。

| 名称 |1.列表页 |2.展示页 |3.结果页 |
| ------------- | ------------- | ------------- | ------------- |
| 截图 | ![](http://og1yl0w9z.bkt.clouddn.com/17-7-6/49394070.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/17-7-6/43197086.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/17-7-6/14637275.jpg) |
| 描述 | 通过 storyboard 搭建基本框架 | 下拉动画展示 | 刷新后展示 |


## Advantage 框架的优势
* 1.文件少，代码简洁
* 2.不依赖任何其他第三方库
* 3.支持加载 Gif 文件
* 4.具备较高自定义性


## Requirements 要求
* iOS 7+
* Xcode 8+


## Usage 使用方法
### 第一步 声明部件
```
let refreshControl = GIFRefreshControl()
refreshControl.animatedImage = GIFAnimatedImage(data: try! Data(contentsOf: Bundle.main.url(forResource: "guitar", withExtension: "gif")!))
refreshControl.contentMode = .scaleAspectFill
refreshControl.addTarget(self, action: #selector(ViewController.refresh), for: .valueChanged)
tableView.addSubview(refreshControl)
```
### 第二步 响应调用
```
//MARK: Refresh
    func refresh() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
            self.count += 1
            self.refreshControl.endRefreshing()

            self.tableView.beginUpdates()
            self.tableView.insertRows(at: [IndexPath(item: 0, section: 0)],
                with: .none)
            self.tableView.endUpdates()
        }
    }
```

使用简单、效率高效、进程安全~~~如果你有更好的建议,希望不吝赐教!


## License 许可证
SwifterRefreshDemo 使用 MIT 许可证，详情见 LICENSE 文件。


## Contact 联系方式:
* WeChat : WhatsXie
* Email : ReverseScale@iCloud.com
* Blog : https://reversescale.github.io
