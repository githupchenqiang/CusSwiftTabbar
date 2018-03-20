//
//  CQ_Midbutton.swift
//  Tabbar
//
//  Created by chenq@kensence.com on 2018/3/16.
//  Copyright © 2018年 chenq@kensence.com. All rights reserved.
//

import UIKit

class CQ_Midbutton: UIButton {
    var bgview = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        self.titleLabel?.textAlignment = NSTextAlignment.center
        self.adjustsImageWhenHighlighted = false
        //图片的内容模式
        self.imageView?.contentMode = UIViewContentMode.center
        let BgView = UIView()
        BgView.backgroundColor = UIColor.init(patternImage: UIImage(named:"tab_Irregular")!)
        self.insertSubview(BgView, at: 0)
        self.bgview = BgView
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        self.titleLabel?.x = 0
        self.titleLabel?.Width = self.Width
        self.titleLabel?.height = 16
        
        self.titleLabel?.y = self.height - (self.titleLabel?.height)!
        
        self.imageView?.Width = (self.currentImage?.size.width)!
        self.imageView?.height = (self.currentImage?.size.height)!
        self.imageView?.x = (self.Width - (self.imageView?.Width)!)/2
        self.imageView?.y = (self.titleLabel?.y)! - ((self.imageView?.height)! - 1)
        
        self.bgview.Width = 43
        self.bgview.height = self.height
        self.bgview.x = (self.Width - self.bgview.Width)/2
        self.bgview.y = 0
    }
  
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
