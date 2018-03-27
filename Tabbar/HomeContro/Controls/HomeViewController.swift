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
        title = "首页"
        view.addSubview(CollectionView);
        laodData(page: 1)
        CollectionView.reloadData()
    }
    
    func laodData(page:NSInteger){
        self.shopsArray = PublicSource.getBundleData(pathName: "1")
    }
    
    lazy var shopsArray: NSMutableArray = {
        let shop = NSMutableArray()
        return shop
    }()

    lazy var CollectionView:UICollectionView = {
        let layout:cqWaterFlowLayout = cqWaterFlowLayout()
        layout.delegate = self
        let collection = UICollectionView(frame:CGRect(x: 0, y: 0, width:self.view.frame.size.width, height:self.view.frame.size.height), collectionViewLayout: layout)
        collection.backgroundColor = UIColor.white
        collection.register(UINib.init(nibName: "ShopsCell", bundle: nil), forCellWithReuseIdentifier: "shops")
        collection.dataSource = self
        collection.delegate = self;
        return collection;
    }()
}

extension HomeViewController:UICollectionViewDataSource,cqWaterFlowLayoutDelegate,UICollectionViewDelegate{
    
    //返回的是item的高度
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shopsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:ShopsCell = CollectionView.dequeueReusableCell(withReuseIdentifier: "shops", for: indexPath) as! ShopsCell
        let model:Source = shopsArray[indexPath.row] as! Source
        cell.setShopsData(shop: model)
        return cell
    }
    ///item列数
    
    func columnCountInWaterflowLayout(waterflowLayout: cqWaterFlowLayout) -> CGFloat {
        return 3
    }
    
    func waterflowLayout(waterflowLayout: cqWaterFlowLayout, heightForItemIndex: NSInteger, itemWidth: CGFloat) -> CGFloat {
        let model:Source = shopsArray[heightForItemIndex] as! Source
        
        return itemWidth * model.h! / model.w!
    }
    ///item左右间距
    func columnMarginInWaterflowLayout(waterflowLayout: cqWaterFlowLayout) -> CGFloat {
        return 5
    }
    ///item上下的间距
    func rowMarginInWaterflowLayout(waterflowLayout: cqWaterFlowLayout) -> CGFloat {
        return 10;
    }
    ///layout距离边框的距离
    func edgeInsetsInWaterflowLayout(waterflowLayout: cqWaterFlowLayout) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 10, 10, 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detail = DetailViewController()
        detail.block = {(parameValue)->() in
            print(parameValue ?? String())
        }
        navigationController?.pushViewController(detail, animated: true)
    }
}
