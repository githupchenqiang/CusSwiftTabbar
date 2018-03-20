//
//  CQ_ViewExtension.swift
//  ProductSwift
//
//  Created by chenq@kensence.com on 2016/12/25.
//  Copyright © 2016年 chenq@kensence.com. All rights reserved.
//

import UIKit

extension UIView{
    
    public var x:CGFloat{
        get{
            return  self.frame.origin.x
        }
        
        set(newLeft){
            var Newframe = frame
            Newframe.origin.x = newLeft
            frame = Newframe
        }
    }
    
    
    public var y:CGFloat{
        get{
            return self.frame.origin.y
        }
        
        set(NewTop){
            var Newframe = frame
            Newframe.origin.y = NewTop
            frame = Newframe
            
        }
    }
    
    
    public var Width:CGFloat{
       
        get{
        return frame.size.width
        }
        
        set(NewWidth){
            var Newframe = self.frame
            Newframe.size.width = NewWidth
            frame = Newframe
            
        }
        
    }
    
    public var height:CGFloat{
        get{
            return frame.size.height;
        }
        
        set(NewHeight){
            var Newframe = frame
            Newframe.size.height = NewHeight
            frame = Newframe
            
        }
    }
    
    public var centerY:CGFloat{
        
        get{
            return self.center.y
        }
        
        set(newCenterY){
            var centerY = center
            centerY.y = newCenterY
            center = centerY
        }
    }
    
    
    public var centerX:CGFloat{
        get{
            return center.x
        }
        set(NewX){
            var Ncenter = center
            Ncenter.x = NewX
            center = Ncenter
        }
    }
    
    
    public var Size:CGSize{
        get{
            return frame.size
        }
        
        set(size){
            var frame = self.frame
            frame.size = size
            
        }
    }
        
    
    
    
    
    
    
}
    
