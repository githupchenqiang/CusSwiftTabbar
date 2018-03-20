//
//  HomeViewController.swift
//  Tabbar
//
//  Created by chenq@kensence.com on 2018/3/16.
//  Copyright © 2018年 chenq@kensence.com. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.navigationController?.pushViewController(DetailViewController(), animated: true)
    }

}
