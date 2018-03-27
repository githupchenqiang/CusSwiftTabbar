//
//  CQ_Tabbar.swift
//  Tabbar
//
//  Created by chenq@kensence.com on 2018/3/17.
//  Copyright © 2018年 chenq@kensence.com. All rights reserved.
//

import UIKit


protocol CQTabbarDelegate:NSObjectProtocol {
    func tabbarSelected(tabbar:CQ_Tabbar,clickIndex:NSInteger)
}


class CQ_Tabbar: UIView {
    let tabbarTag = 1200
    weak var Delegate:CQTabbarDelegate?
    var selectedIndex:NSInteger?
    var currentSelectedIndex:NSInteger = 0
    var subViewCount:NSInteger = 1
    var seleButton:UIButton?
    var bigButton:CQ_TabbarBigButton?
    
    func setItems(items:NSArray){
        
        for i in 0..<items.count {
            let tabbarItem  = items[i] as! UITabBarItem
            
            if i == 2 {
                //设置中间突出按钮
                let BigButton = CQ_TabbarBigButton(type: .custom)
                BigButton.tag = self.subviews.count + tabbarTag
                BigButton .setImage(tabbarItem.image, for: .normal)
                BigButton.adjustsImageWhenHighlighted = false
                
                //设置文字
                BigButton.setTitle(tabbarItem.title, for: .normal)
                BigButton.setTitleColor(UIColor.init(hexString: "#6B6B6B"), for: .normal)
                BigButton.setTitleColor(UIColor.init(hexString: "#63B8FF"), for: .selected)
                BigButton.addTarget(self, action: #selector(btnClick(btn:)), for: .touchDown)
                addSubview(BigButton)
                bigButton = BigButton
            }else
            {
                let NorButton = CQ_NorTabbarButton(type: .custom)
                NorButton.tag = self.subviews.count + tabbarTag
                NorButton .setImage(tabbarItem.image, for: .normal)
                NorButton.setImage(tabbarItem.selectedImage, for: .selected)
                NorButton.adjustsImageWhenHighlighted = false
                NorButton.barItem = tabbarItem
                NorButton.setTitle(tabbarItem.title, for: .normal)
                

                NorButton.setTitleColor(UIColor.init(hexString: "#6B6B6B"), for: .normal)
                NorButton.setTitleColor(UIColor.init(hexString: "#63B8FF"), for: .selected)
                NorButton.addTarget(self, action: #selector(btnClick(btn:)), for: .touchDown)
                addSubview(NorButton)
                
                
                if (self.selectedIndex != nil) {
                   subViewCount = self.selectedIndex! + 1
                }
                
                if (subviews.count == subViewCount) {
                    selectedIndex = subviews.count - 1
                    btnClick(btn: NorButton)
                }
         
            }
            
         }

    }
    
    //留给外界可以设置选中第几个item
  public  func setSelectIndexItem(Index:NSInteger){
        selectedIndex = Index
        let button = viewWithTag(tabbarTag + Index)
    btnClick(btn: button as! UIButton)
        
    }
    
    //item选中的执行事件
    func btnClick(btn:UIButton){
       seleButton?.isSelected = false
        btn.isSelected = true
        seleButton = btn
        Delegate?.tabbarSelected(tabbar: self, clickIndex: btn.tag - tabbarTag)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let Count:NSInteger = subviews.count
        var X:CGFloat = 0
        var Y:CGFloat = 0
        let W:CGFloat = UIScreen.main.bounds.size.width / CGFloat(Count)
        
        var H = 49
        for i in 0..<Count {
            let btn:UIButton = subviews[i] as! UIButton
            X = CGFloat(i) * W
          //由于第三个按钮上部是突出的所以这里Y上移12
            if i == 2 {
                Y = -12
                H += 12
                 btn.frame = CGRect(x: X, y: Y, width: W, height: CGFloat(H))
            }else
            {
                //其他按钮正常位置不变
                H = 49
                 Y  = 0
                 btn.frame = CGRect(x: X, y: Y, width: W, height: CGFloat(H))
            }
           
        }
        
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let PointW = 43
        let PointH = 61
        let PointX = (ScreenW - CGFloat(PointW)) / 2
        let PointY = -12
        let rect:CGRect = CGRect(x: Int(PointX), y: PointY, width: PointW, height: PointH)
        if rect.contains(point) {
            return bigButton
        }
       return super.hitTest(point, with: event)
        
    }
  
}
