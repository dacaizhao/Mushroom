//
//  ViewController.swift
//  Mushroom
//
//  Created by point on 2017/4/19.
//  Copyright © 2017年 dacai. All rights reserved.
//

import UIKit

private let kCellID = "kCellID"
private let handleShowCellCount = 5
enum TypeRequest:Int {
    case oneRequest = 0
    case twoRequest = 1
    case threeRequest = 2
    case fourRequest = 3
    case fiveRequest = 4
}


class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    fileprivate lazy var tableView : UITableView = { [unowned self] in
        let tableView = UITableView(frame: CGRect.zero)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        return tableView
        }()
    fileprivate lazy var presenter : ViewPresenster = {
        return ViewPresenster(presenter: self)
    }()
    
    var oneModel:OneModel = OneModel()
    var twoModel:TwoModel = TwoModel()
    var threeModel:ThreeModel = ThreeModel()
    var fourModel:FourModel = FourModel()
    var fiveModel:FiveModel = FiveModel()
    
    //维护显示的数组 willDisplay显示 做到请求时加载 并且不会重复请求
    fileprivate lazy var handleShowCellArr : [Int] = {
        var handleShowCellArr = [Int]()
        for i in 0..<handleShowCellCount {
            handleShowCellArr.append(i)
        }
        return handleShowCellArr
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupUI()
    }
    
}

// MARK:- 设置UI
extension ViewController {
    func setupUI() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none;
        tableView.register(UINib(nibName: "DCTableViewCell", bundle: nil), forCellReuseIdentifier: kCellID)
    }
    
}

// MARK:- 获取数据
extension ViewController:ViewPresensterProtocol{
    
    func showOnePost(_ resulet: OneModel, _ success: Bool) {
        oneModel = resulet
        reloadRows(item: TypeRequest.oneRequest.rawValue);
    }
    
    func showTwoPost(_ resulet: TwoModel, _ success: Bool) {
        twoModel = resulet
        reloadRows(item: TypeRequest.twoRequest.rawValue);
    }
    
    
    func showThreePost(_ resulet: ThreeModel, _ success: Bool) {
        threeModel = resulet
        reloadRows(item: TypeRequest.threeRequest.rawValue);
    }
    
    func showFourPost(_ resulet: FourModel, _ success: Bool) {
        fourModel = resulet
        reloadRows(item: TypeRequest.fourRequest.rawValue);
    }
    
    func showFivePost(_ resulet: FiveModel, _ success: Bool) {
        fiveModel = resulet
        reloadRows(item: TypeRequest.fiveRequest.rawValue);
    }
    
    func reloadRows(item:Int)  {
        let indexPath :IndexPath = IndexPath.init(item: item, section: 0)
        tableView.reloadRows(at: [indexPath], with: .none)
    }
}

// MARK:- 代理
extension ViewController {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return handleShowCellCount;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCellID, for: indexPath) as! DCTableViewCell
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.red
        }else {
            cell.backgroundColor = UIColor.yellow
        }
        
        
        //这里应该是一个cell 对应一个模型    看情况吧 如果差异不大也没必要建立多个模型  需要看实际业务需求改变
        if indexPath.item ==  TypeRequest.oneRequest.rawValue{
            
            cell.cellOneConfigWithIndexPath(indexPath: indexPath, model: oneModel)
        }
        if indexPath.item ==  TypeRequest.twoRequest.rawValue{
            cell.cellTwoConfigWithIndexPath(indexPath: indexPath, model: twoModel)
        }
        if indexPath.item ==  TypeRequest.threeRequest.rawValue{
            cell.cellThreeConfigWithIndexPath(indexPath: indexPath, model: threeModel)
        }
        if indexPath.item ==  TypeRequest.fourRequest.rawValue{
            cell.cellFourConfigWithIndexPath(indexPath: indexPath, model: fourModel)
        }
        if indexPath.item ==  TypeRequest.fiveRequest.rawValue{
            cell.cellFiveConfigWithIndexPath(indexPath: indexPath, model: fiveModel)
        }
        
        
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200;
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if handleShowCellArr.contains(indexPath.item) {
            guard let index = handleShowCellArr.index(of: indexPath.item) else {
                return
            }
            handleShowCellArr.remove(at: index)
            if indexPath.item ==  TypeRequest.oneRequest.rawValue{
                presenter.getOneData(param: ["key":"one"], model: oneModel)
            }
            if indexPath.item ==  TypeRequest.twoRequest.rawValue{
                presenter.getTwoData(param: ["key":"one"], model: twoModel)
            }
            if indexPath.item ==  TypeRequest.threeRequest.rawValue{
                presenter.getThreeData(param: ["key":"one"], model: threeModel)
            }
            if indexPath.item ==  TypeRequest.fourRequest.rawValue{
                presenter.getFourData(param: ["key":"one"], model: fourModel)
            }
            if indexPath.item ==  TypeRequest.fiveRequest.rawValue{
                presenter.getFiveData(param: ["key":"one"], model: fiveModel)
            }
            
        }
    }
}
