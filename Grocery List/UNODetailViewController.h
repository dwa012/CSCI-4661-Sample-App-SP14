//
//  UNODetailViewController.h
//  Grocery List
//
//  Created by daniel on 2/17/14.
//  Copyright (c) 2014 UNO CSCI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CatstagramPost.h"

@interface UNODetailViewController : UIViewController

@property (weak, nonatomic) CatstagramPost *data;
@property (weak, nonatomic) IBOutlet UIImageView *image;

@end