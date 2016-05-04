//
//  ViewController.swift
//  NotificationTimeOut
//
//  Created by hh on 16/5/3.
//  Copyright © 2016年 hh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        PXJNSNotificationTimeOut.instance.PostSessionNotificationStart()
    }


}

