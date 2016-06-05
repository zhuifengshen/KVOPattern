//
//  AppStatusObserver.swift
//  KVOPattern
//
//  Created by 张楚昭 on 16/6/5.
//  Copyright © 2016年 tianxing. All rights reserved.
//

import UIKit
/// 观察者
class AppStatusObserver: NSObject {
    /**
     响应属性的变化：NSObject类已实现了NSKeyValueObserving协议
     
     - parameter keyPath: 被关注的属性
     - parameter object:  被关注的对象
     - parameter change:  字典类型，包含了属性变化的内容，这些内容与注册时属性变化设置的选项有关（options参数）
     - parameter context: 注册时传递的上下文内容
     */
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        NSLog("%@ - %@", (keyPath! as NSString), (change![NSKeyValueChangeNewKey] as! NSString))
    }
}
