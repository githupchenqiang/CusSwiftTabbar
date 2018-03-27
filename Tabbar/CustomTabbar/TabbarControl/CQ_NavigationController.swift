//
//  CQ_NavigationController.swift
//  Tabbar
//
//  Created by chenq@kensence.com on 2018/3/16.
//  Copyright © 2018年 chenq@kensence.com. All rights reserved.
//

import UIKit
class CQ_NavigationController: UINavigationController {
    
    var PopDelegate:Any?
    override func viewDidLoad() {
        super.viewDidLoad()
        let appearance = UINavigationBar.appearance()
        let att = NSMutableDictionary()
        att[NSFontAttributeName] = UIFont.systemFont(ofSize: 20)
        att[NSForegroundColorAttributeName] = UIColor.yellow
        appearance.titleTextAttributes = att as? [String : Any]
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
        
        
        //设置导航条的背景
//        appearance .setBackgroundImage(UIImage.ima, for: .defaultPrompt)
        
        navigationBar.barTintColor = UIColor.init(hexString: "#5CACEE")

        //设置文字
        appearance.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white,NSFontAttributeName:UIFont(name:"Heiti SC" ,size:16)!]
        navigationController?.navigationItem.backBarButtonItem?.tintColor = UIColor.red
        PopDelegate = interactivePopGestureRecognizer?.delegate
        self.delegate = self
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            let BarButtonItem = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.fixedSpace, target: nil, action: nil)
            BarButtonItem.width = -5
            //设置导航栏按钮
            let backButton = UIBarButtonItem.SetButtonItemImage(ImageName:"navigationbar_back_image", hightImage: "navigationbar_back_image",target: self, action:#selector(back))
            viewController.navigationItem.leftBarButtonItems = [BarButtonItem,backButton]
            self.interactivePopGestureRecognizer?.delegate = nil
            
        }
         super.pushViewController(viewController, animated: animated)
    }

    func back(){
    self.popViewController(animated: true)
    }
   
}

extension CQ_NavigationController:UINavigationControllerDelegate{
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        if viewController == viewControllers.first {
            self.interactivePopGestureRecognizer?.delegate = PopDelegate as? UIGestureRecognizerDelegate
        }
    }
}

extension UIBarButtonItem {
    class func SetButtonItemImage(ImageName:NSString,hightImage:NSString,target:Any?, action:Selector) -> UIBarButtonItem {
        let button = UIButton.init()
        //设置背景图片
        
        button.setBackgroundImage(UIImage(named: ImageName as String), for: .normal)
        if hightImage.length > 0 {
            button.setBackgroundImage(UIImage(named: hightImage as String), for: .highlighted)
        }
        
        //设置按钮的尺寸为背景图片的尺寸
        button.frame.size = (button.currentBackgroundImage?.size)!
        button.adjustsImageWhenHighlighted = false
        
        //监听按钮的点击
        button.addTarget(target, action: action, for: .touchUpInside)
        return UIBarButtonItem.init(customView: button)
        
    }
 
}
