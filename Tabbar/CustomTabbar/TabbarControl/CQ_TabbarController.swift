//
//  CQ_TabbarController.swift
//  Tabbar
//
//  Created by chenq@kensence.com on 2018/3/16.
//  Copyright © 2018年 chenq@kensence.com. All rights reserved.
//

import UIKit

class CQ_TabbarController: UITabBarController {
    
    var lastSelectIndex:NSInteger?
    var redPoint:UIView?
    var popDelegate:Any?
    var composeButton:UIButton?
    var CustomTabbar:CQ_Tabbar?
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBar.isHidden = true
        self.tabBar.removeFromSuperview()
        for  childView in self.tabBar.subviews{
            if childView .isKind(of: (CQ_Tabbar.self)) {
                childView .removeFromSuperview()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildVC()
        setUpTabbar()
    }
    
    func setUpTabbar() {
     
        let tabbar = CQ_Tabbar()
        
        tabbar.setItems(items: self.items)
        tabbar.Delegate = self
        tabbar.backgroundColor = UIColor.init(patternImage: UIImage(named: "tab_backgroundX")!)
        tabbar.frame = CGRect(x: 0, y:(ScreenH - CGFloat(TabbarHeight)) , width: ScreenW, height: ScreenH)
        view.addSubview(tabbar)
        // warning 调用选中的这个方法,必须在初始化设置后在调用,不然会报错
//        tabbar.setSelectIndexItem(Index: 1)
        CustomTabbar = tabbar
    }
    
    func setupButton(){
        let rect = self.tabBar.bounds
        let w = rect.size.width / CGFloat(self.childViewControllers.count - 1)
        composeButton?.frame = rect.insetBy(dx: 2 * w, dy: 0)
        composeButton?.height = CGFloat(Int(TabbarHeight))
    }

    func addChildVC(){
        let homeVC = HomeViewController()
        addChildVC(childVC: homeVC, title: "首页", imageName: "Home", selectedImage: "HomeSele")
        
        let NewVC = NewViewController()
        addChildVC(childVC: NewVC, title: "热点", imageName: "hot", selectedImage: "hotSele")
        
        let PushVC = PushViewController()
        addChildVC(childVC: PushVC, title: "发布", imageName: "添加", selectedImage: "添加")
        
        let DataVC = DataViewController()
        addChildVC(childVC: DataVC, title: "搜索", imageName: "Search", selectedImage: "SearchSele")
        
        let profile = ProfileViewController()
        addChildVC(childVC: profile, title: "我的", imageName: "User", selectedImage: "UserSele")
    }
    
    func addChildVC(childVC:UIViewController,title:NSString,imageName:NSString,selectedImage:NSString){
        
        childVC.tabBarItem.title = title as String
        //设置图标
        childVC.tabBarItem.image = UIImage(named: imageName as String)
        
        //设置选中的图标
        var seleImage = UIImage(named: selectedImage as String)
        
        //不要渲染
        seleImage = seleImage?.withRenderingMode(.alwaysOriginal)
        childVC.tabBarItem.selectedImage = seleImage;
        
        self.items .add(childVC.tabBarItem)
        //添加为tabbar控制器的子控制器
        let nav  = CQ_NavigationController(rootViewController: childVC)
        nav.delegate = self //这个代理方必须写上,代理方法也必须实现
        self.addChildViewController(nav)
    }
    
    lazy var items:NSMutableArray = {
       let array = NSMutableArray()
        return array
    }()
  
}

extension CQ_TabbarController:CQTabbarDelegate,UITabBarControllerDelegate,UINavigationControllerDelegate{
    func tabbarSelected(tabbar:CQ_Tabbar,clickIndex:NSInteger){
        super.selectedIndex = clickIndex
    }
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
     let Root:UIViewController = navigationController.viewControllers.first!
        tabBar.isHidden = true
        if viewController != Root {
            CustomTabbar?.removeFromSuperview()
            var dockFrame = CustomTabbar?.frame
            dockFrame?.origin.y = Root.view.height - CGFloat(TabbarHeight)
            if Root.view .isKind(of: UIScrollView.self){
                let scroller:UIScrollView = Root.view as! UIScrollView
                dockFrame?.origin.y += scroller.contentOffset.y
            }
            CustomTabbar?.frame = dockFrame!
            Root.view.addSubview(CustomTabbar!)
        }
    }
    
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        let Root:UIViewController = navigationController.viewControllers.first!
        let Nav:CQ_NavigationController  = navigationController as! CQ_NavigationController
        if viewController == Root {
            navigationController.interactivePopGestureRecognizer?.delegate = Nav.PopDelegate as? UIGestureRecognizerDelegate
            CustomTabbar?.removeFromSuperview()
            CustomTabbar?.frame = CGRect(x: 0.0, y: ScreenH - CGFloat(TabbarHeight), width: ScreenW, height: CGFloat (TabbarHeight))
            view .addSubview(CustomTabbar!)
        }
        
    }
}
