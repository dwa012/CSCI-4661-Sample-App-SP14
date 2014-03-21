//
//  UNOSignInViewController.h
//  Grocery List
//
//  Created by Daniel Ward on 3/12/14.
//  Copyright (c) 2014 UNO CSCI. All rights reserved.
//

#import <GooglePlus/GooglePlus.h>

@class GPPSignInButton;

@interface UNOSignInViewController : UIViewController <GPPSignInDelegate>

@property (strong, nonatomic) IBOutlet UIView *signInButton;

@end
