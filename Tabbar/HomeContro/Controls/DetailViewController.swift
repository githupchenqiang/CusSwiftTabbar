//
//  DetailViewController.swift
//  Tabbar
//
//  Created by chenq@kensence.com on 2018/3/20.
//  Copyright © 2018年 chenq@kensence.com. All rights reserved.
//

import UIKit

typealias Detailblock = (_ parameValue:String?)->()

class DetailViewController: UIViewController {
    var block:Detailblock?
    
    override func viewDidLoad() {
        super.viewDidLoad()

}
  
    override func viewWillDisappear(_ animated: Bool) {
        if (block != nil) {
            block!("1233")
        }
    }
    
    
}
