//
//  CQ_Tabbar.swift
//  Tabbar
//
//  Created by chenq@kensence.com on 2018/3/16.
//  Copyright © 2018年 chenq@kensence.com. All rights reserved.
//

import UIKit

protocol CQTabbarDelegate:NSObjectProtocol {
    
    func tabbar(tabbar:CQ_Tabbar,didClickBtnIndex:NSInteger)
}

class CQ_Tabbar: UIView{
    var seletedIndex:NSInteger?
    var itemArray:NSArray = []
   weak var Delegate:CQTabbarDelegate?
    
    fileprivate var selButton:UIButton?
    fileprivate var bgButton:CQ_Midbutton?
    fileprivate var SeleIndex:NSInteger?
    
    
    func setItemArray(Items:NSArray){
        for i in 0..<Items.count{
            let tabbarItem:UITabBarItem = Items[i] as! UITabBarItem
            
            if i == 2 {
       
            let midButton = CQ_Midbutton(type: .custom)
            
            midButton.setImage(tabbarItem.image, for: .normal)
            midButton .setImage(tabbarItem.selectedImage, for: .selected)
            midButton.adjustsImageWhenHighlighted = false
            
            //设置文字
            midButton .setTitle(tabbarItem.title, for: .normal)
            midButton .setTitleColor(UIColor.red, for: .normal)
            midButton.setTitleColor(UIColor.purple, for: .selected)
            
            midButton .addTarget(self, action: #selector(btnClick(btn:)), for:UIControlEvents.touchDown)
            self.addSubview(midButton)
            self.bgButton = midButton
            
                
            }else
            {
                
                let midButton = CQ_Midbutton(type: .custom)
                midButton.setImage(tabbarItem.image, for: .normal)
                midButton .setImage(tabbarItem.selectedImage, for: .selected)
                midButton.adjustsImageWhenHighlighted = false
                //设置文字
                midButton .setTitle(tabbarItem.title, for: .normal)
                midButton .setTitleColor(UIColor.red, for: .normal)
                midButton.setTitleColor(UIColor.purple, for: .selected)
                
                midButton .addTarget(self, action: #selector(btnClick(btn:)), for:UIControlEvents.touchDown)
                self.addSubview(midButton)
                
                if ((self.seletedIndex) != nil) {
                    
//                    subviewCount = self.seletedIndex!+1
                }
                
                if self.subviews.count == 1 {
                    self.seletedIndex = self.subviews.count - 1
                btnClick(btn: midButton)
                    
                }

                //添加观察者
            }
            
        }
  
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let count = self.subviews.count
        var X:CGFloat = 0
        var Y:CGFloat = 0
        let w:CGFloat = (UIScreen.main.bounds.size.width) / CGFloat(count)
        var H:CGFloat = 49
        
        for i in 0..<count {
            let button:UIButton  = self.subviews[i] as! UIButton
            X = CGFloat(i) * w
            if i == 2 {
                Y = -12
                H += 12
            }
            button.frame = CGRect(x: X, y: Y, width: w, height: H)
        }
    }

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        //这里宽度和突出部分的宽度一样
        let pointW = 43
        let pointH = 61
        let pointX = (UIScreen.main.bounds.width - CGFloat(pointW)) / 2
        let pointY = -12
        let rect = CGRect(x: Int(pointX), y: pointY, width: pointW, height: pointH)

        if rect.contains(point) {
            return self.bgButton
        }
        return super.hitTest(point, with: event)
    }
    
    
    
    func btnClick(btn:UIButton){
        selButton?.isSelected = false
        btn.isSelected = true
        selButton = btn
        Delegate?.tabbar(tabbar: self, didClickBtnIndex:btn.tag)
    }
    
    
}
