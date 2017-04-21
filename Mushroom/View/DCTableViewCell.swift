//
//  DCTableViewCell.swift
//  Mushroom
//
//  Created by point on 2017/4/19.
//  Copyright © 2017年 dacai. All rights reserved.
//

import UIKit

class DCTableViewCell: UITableViewCell {
    
    @IBOutlet weak var juhua: UIActivityIndicatorView!
    @IBOutlet weak var titleText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        
    }
    
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}


//这里的重复代码可以抽取   这里的重复代码可以抽取 这里的重复代码可以抽取 这里的重复代码可以抽取
extension DCTableViewCell {
    func cellOneConfigWithIndexPath(indexPath : IndexPath , model:OneModel) {
        if !model.isRequest {
            juhua.startAnimating();
            
        }else {
            juhua.stopAnimating();
            juhua.isHidden = true;
        }
        titleText.text = model.userName
    }
    
    func cellTwoConfigWithIndexPath(indexPath : IndexPath , model:TwoModel) {
        if !model.isRequest {
            juhua.startAnimating();
            
        }else {
            juhua.stopAnimating();
            juhua.isHidden = true;
        }
        titleText.text = model.userName
    }
    
    func cellThreeConfigWithIndexPath(indexPath : IndexPath , model:ThreeModel) {
        if !model.isRequest {
            juhua.startAnimating();
            
        }else {
            juhua.stopAnimating();
            juhua.isHidden = true;
        }
        titleText.text = model.userName
    }
    
    func cellFourConfigWithIndexPath(indexPath : IndexPath , model:FourModel) {
        if !model.isRequest {
            juhua.startAnimating();
            
        }else {
            juhua.stopAnimating();
            juhua.isHidden = true;
        }
        titleText.text = model.userName
    }
    
    func cellFiveConfigWithIndexPath(indexPath : IndexPath , model:FiveModel) {
        if !model.isRequest {
            juhua.startAnimating();
            
        }else {
            juhua.stopAnimating();
            juhua.isHidden = true;
        }
        titleText.text = model.userName
    }
    
    
}

