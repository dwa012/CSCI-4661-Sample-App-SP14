//
//  UNODetailViewController.h
//  Grocery List
//
//  Created by Daniel Ward on 2/18/14.
//  Copyright (c) 2014 UNO CSCI. All rights reserved.
//

#import "UNOItem.h"

@interface UNODetailViewController : UIViewController

@property (retain, nonatomic) UNOItem *item;

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end
