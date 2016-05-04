//
//  ViewController.m
//  NotificationTimeOut
//
//  Created by hh on 16/5/4.
//  Copyright © 2016年 pxj. All rights reserved.
//

#import "ViewController.h"
#import "PXJNSNotificationTimeOut.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[PXJNSNotificationTimeOut instance] PostSeesionNotificationStart];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [[PXJNSNotificationTimeOut instance] PostSeesionNotificationStart];
}


@end
