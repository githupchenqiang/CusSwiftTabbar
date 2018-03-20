//
//  Public.swift
//  Tabbar
//
//  Created by chenq@kensence.com on 2018/3/17.
//  Copyright © 2018年 chenq@kensence.com. All rights reserved.
//

import Foundation
import UIKit
public let ScreenW = UIScreen.main.bounds.size.width
public let ScreenH = UIScreen.main.bounds.size.height



//status bar height.

public let statusBarHeight = (IS_iPhoneX == 1 ? 44 : 20)

// Tabbar height.
public let TabbarHeight = (IS_iPhoneX == 1 ? (49 + 34) : 49)

// Tabbar safe bottom margin.
public let TabbarSafeBottomMargin = IS_iPhoneX == 1 ? 34 : 0

// Status bar & navigation bar height.
public let NavigationBarHeight = IS_iPhoneX == 1 ? 88 : 64
//判断是否iPhone X
public let IS_iPhoneX  =  UIScreen.main.bounds.size.height ==  812 ? 1:0

