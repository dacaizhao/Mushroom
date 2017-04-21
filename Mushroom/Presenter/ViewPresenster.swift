//
//  ViewPresenster.swift
//  Mushroom
//
//  Created by point on 2017/4/20.
//  Copyright © 2017年 dacai. All rights reserved.
//

import UIKit
import MFoundation

protocol ViewPresensterProtocol {
    func showOnePost(_ resulet: OneModel,_ success:Bool)
    func showTwoPost(_ resulet: TwoModel,_ success:Bool)
    func showThreePost(_ resulet: ThreeModel,_ success:Bool)
    func showFourPost(_ resulet: FourModel,_ success:Bool)
    func showFivePost(_ resulet: FiveModel,_ success:Bool)
}

class ViewPresenster: NSObject {
    var presenter: ViewPresensterProtocol!
    
    init(presenter:ViewPresensterProtocol) {
        self.presenter = presenter;
    }
}

// MARK:- 请求网络
extension ViewPresenster {
    func getOneData(param: [String : Any] , model: OneModel){
        HTTPTool.get("api", parameters: param, success: { (result) in
            let dict = ["userId":"1","userName":"🍄老大您好!非常感谢您能在百忙中看到我的代码🍄"]
            let  model:OneModel = OneModel(dict: dict)
            model.isRequest = true
            self.presenter.showOnePost(model, true)
        }) { (error) in
            
        }
    }
    
    func getTwoData(param: [String : Any] , model: TwoModel){
        HTTPTool.get("api", parameters: param, success: { (result) in
            let dict = ["userId":"1","userName":"🍄姓名:赵旺 博客:https://my.oschina.net/zhaodacai🍄"]
            let model:TwoModel = TwoModel(dict: dict)
            model.isRequest = true
            self.presenter.showTwoPost(model, true)
        }) { (error) in
        }
    }
    
    func getThreeData(param: [String : Any] , model: ThreeModel){
        HTTPTool.get("api", parameters: param, success: { (result) in
            let dict = ["userId":"1","userName":"🍄GitHub:https://github.com/dacaizhao🍄"]
            let model:ThreeModel = ThreeModel(dict: dict)
            model.isRequest = true
            self.presenter.showThreePost(model, true)
        }) { (error) in
        }
    }
    
    func getFourData(param: [String : Any] , model: FourModel){
        HTTPTool.get("api", parameters: param, success: { (result) in
            let dict = ["userId":"1","userName":"🍄座右铭:多抽出一分钟时间学习 让生命更加精彩🍄"]
            let model:FourModel = FourModel(dict: dict)
            model.isRequest = true
            self.presenter.showFourPost(model, true)
        }) { (error) in
        }
    }
    
    func getFiveData(param: [String : Any] , model: FiveModel){
        HTTPTool.get("api", parameters: param, success: { (result) in
            let dict = ["userId":"1","userName":"🍄希望我能成功加入蘑菇团队🍄"]
            let model:FiveModel = FiveModel(dict: dict)
            model.isRequest = true
            self.presenter.showFivePost(model, true)
        }) { (error) in
        }
    }
    
    /*
     let dict = [
     ["user_id":"1","user_name":"zhaodacai1"],
     ["user_id":"2","user_name":"zhaodacai2"],
     ]
     for item in dict {
     self.oneModel.append(OneModel(dict: item))
     }
     */
    
    
}
