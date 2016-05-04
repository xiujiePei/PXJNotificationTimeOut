//
//  PXJNSNotificationTimeOut.swift
//  NotificationTimeOut
//
//  Created by hh on 16/5/3.
//  Copyright © 2016年 hh. All rights reserved.
//

import UIKit
let PXJNSNotificationTimeOutLockName = "com.PXJ.NSNotificationTimeOutLock"
let sessionTime = 20.0
class PXJNSNotificationTimeOut: NSObject {
    private var lock:NSRecursiveLock!
    private var timer:NSTimer!
    
    override init() {
        super.init();
        self.timer = NSTimer.scheduledTimerWithTimeInterval(sessionTime, target: self, selector: "timeOutController", userInfo: nil, repeats: false)
        self.lock = NSRecursiveLock();
        self.lock.name = PXJNSNotificationTimeOutLockName
        
    }
    static var instance:PXJNSNotificationTimeOut{
        struct Static {
            static let instance:PXJNSNotificationTimeOut = PXJNSNotificationTimeOut();
        }
        return Static.instance
    }
    
    func PostSessionNotificationStop()->Void{
        self.lock.lock()
        self.timer.invalidate()
        self.lock.unlock()
    }
    
    func PostSessionNotificationStart()->Void{
        self.lock.lock()
        self.timer.invalidate()
        self.timer = NSTimer.scheduledTimerWithTimeInterval(sessionTime, target: self, selector: "timeOutController", userInfo: nil, repeats: false)
        self.lock.unlock()
    }
    
    func timeOutController()->Void{
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            AppDelegate.doSomethingForTimeOut()
        }
    }
}
