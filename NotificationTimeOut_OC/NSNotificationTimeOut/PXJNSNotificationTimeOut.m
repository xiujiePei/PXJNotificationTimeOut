//
//  NSNotificationTimeOut.m
//  timeOutController
//
//  Created by issuser on 15/10/27.
//  Copyright © 2015年 issuser. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "PXJNSNotificationTimeOut.h"
#import "AppDelegate.h"
#define PXJNSNotificationTimeOutLockName @"com.PXJ.NSNotificationTimeOutLock"

static PXJNSNotificationTimeOut *notificationTimeOut = nil;
@interface PXJNSNotificationTimeOut ()
@property(nonatomic,strong)NSRecursiveLock *lock;
@property(nonatomic,strong)NSTimer *timer;
@end
@implementation PXJNSNotificationTimeOut

- (id)init{
    if (self = [super init]) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:sessionTime target:self selector:@selector(timeOutController) userInfo:nil repeats:NO];
        self.lock = [[NSRecursiveLock alloc] init];
        self.lock.name = PXJNSNotificationTimeOutLockName;
    }
    return self;
}

+ (PXJNSNotificationTimeOut *)instance{
    
    if (notificationTimeOut == nil) {
        @synchronized(self) {
            if (notificationTimeOut == nil) {
                notificationTimeOut = [[self alloc] init];
            }
        }
    }
    return notificationTimeOut;
}

- (void)PostSeesionNotificationStop{
    [self.lock lock];
    [self.timer invalidate];//从runloop中移除,暂停计时器，timer=nil
    [self.lock unlock];
}

- (void)PostSeesionNotificationStart{
    [self.lock lock];
    [self.timer invalidate];//从runloop中移除,暂停计时器，timer=nil
    self.timer = [NSTimer scheduledTimerWithTimeInterval:sessionTime target:self selector:@selector(timeOutController) userInfo:nil repeats:NO];
    [self.lock unlock];
}

- (void)timeOutController{
    dispatch_async(dispatch_get_main_queue(), ^{
        [AppDelegate doSomethingForTimeOut];
    });
}

@end
