//
//  AppDelegate.swift
//  KVOPattern
//
//  Created by 张楚昭 on 16/6/5.
//  Copyright © 2016年 tianxing. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    //dynamic表示该属性是在运行时动态派发的
    dynamic var appStatus: NSString!
    //定义观察者
    var observer: AppStatusObserver!

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        self.observer = AppStatusObserver()
        /**
         注册通知：告诉观察者（AppStatusObserver)开始观察AppDelegate的appStatus属性变化
         - parameter addObserver: 观察者
         - parameter forKeyPath: 被关注对象的属性
         - parameter options:    属性变化设置的选项，本例中New和Old表示把属性新旧两个值都传递给观察者，这些值是NSKeyValueObservingOptions类型的成员
         - parameter context:    上下文内容，它的类型是C语言形式的任何指针类型，Swift：UnsafeMutablePointer<Void>,Objective-C:void *
         */
        self.addObserver(self.observer, forKeyPath: "appStatus", options: [.New, .Old], context: nil)
        self.appStatus = "Launch"
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
        self.appStatus = "inactive-willresignactive"
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        self.appStatus = "background-didenterbackground"
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
        self.appStatus = "inactive-willenterforeground"
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        self.appStatus = "active-didbecomeactive"
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        self.appStatus = "terminate"
    }


}

