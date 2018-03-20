//
//  CQ_TabbarBigButton.swift
//  Tabbar
//
//  Created by chenq@kensence.com on 2018/3/17.
//  Copyright © 2018年 chenq@kensence.com. All rights reserved.
//

import UIKit


class CQ_TabbarBigButton: UIButton {

    var BgView:UIView?
    
    
    
    override init(frame: CGRect) {
   super.init(frame: frame)
        titleLabel?.font = UIFont.systemFont(ofSize: 10)
        titleLabel?.textAlignment = NSTextAlignment.center
        imageView?.contentMode = UIViewContentMode.center
        
        
        BgView = UIView()
        BgView?.backgroundColor = UIColor.init(patternImage: UIImage(named: "tab_Irregular")!)
        insertSubview(BgView!, at: 0)
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
        
        BgView?.Width = 43
        BgView?.height = height
//        BgView?.x = (Width - (BgView?.Width)!) / 2
        BgView?.y = 0
        BgView?.centerX = (titleLabel?.centerX)!

        imageView?.centerX = (titleLabel?.centerX)!
        imageView?.y = height - (titleLabel?.y)! - 11
 
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
    
}
