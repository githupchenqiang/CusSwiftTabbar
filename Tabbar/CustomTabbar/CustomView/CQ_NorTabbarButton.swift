//
//  CQ_NorTabbarButton.swift
//  Tabbar
//
//  Created by chenq@kensence.com on 2018/3/17.
//  Copyright © 2018年 chenq@kensence.com. All rights reserved.
//

import UIKit

class CQ_NorTabbarButton: UIButton {
    var barItem:UITabBarItem?
    
    override init(frame: CGRect) {
      super.init(frame: frame)
        titleLabel?.font = UIFont.systemFont(ofSize: 10)
        titleLabel?.textAlignment = NSTextAlignment.center
        adjustsImageWhenHighlighted = false
        imageView?.contentMode = UIViewContentMode.center
        imageView?.centerX = (titleLabel?.centerX)!
    
    }

    override func layoutSubviews() {
        
        super.layoutSubviews()
        titleLabel?.x = 0
        titleLabel?.Width = Width
        titleLabel?.height = 16
        if #available(iOS 11.0, *){
            titleLabel?.height -= 1;
        }
        titleLabel?.y = height - (titleLabel?.height)!
        
        imageView?.centerX = (titleLabel?.centerX)!
        imageView?.y = height - (titleLabel?.y)! - 7
 
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
