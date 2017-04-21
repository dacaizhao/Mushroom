//
//  ThreeModel.swift
//  Mushroom
//
//  Created by point on 2017/4/20.
//  Copyright © 2017年 dacai. All rights reserved.
//

import UIKit

class ThreeModel: NSObject {
    // 用户ID
    var userId : String = ""
    var isRequest : Bool = false
    // 用户名字
    var userName : String = "我是3 我还没有请到数据"
    
    init(dict : [String : Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override init() {
        super.init()
    }
    
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}
