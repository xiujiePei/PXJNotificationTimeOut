//
//  NSNotificationTimeOut.h
//  timeOutController
//
//  Created by issuser on 15/10/27.
//  Copyright © 2015年 issuser. All rights reserved.
//

#import <Foundation/Foundation.h>
#define sessionTime 120.0

@interface PXJNSNotificationTimeOut : NSObject
+ (PXJNSNotificationTimeOut *)instance;
- (void)PostSeesionNotificationStart;
- (void)PostSeesionNotificationStop;
@end
