//
//  UNOAppDelegate.h
//  Grocery List
//
//  Created by Daniel Ward on 1/22/14.
//  Copyright (c) 2014 UNO CSCI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GooglePlus/GooglePlus.h>

@interface UNOAppDelegate : UIResponder <UIApplicationDelegate>


@property (strong, nonatomic) UIWindow *window;

+ (dispatch_queue_t)longWorkQueue;

+ (dispatch_queue_t)networkQueue;
@end
