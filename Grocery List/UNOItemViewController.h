//
//  UNOItemViewController.h
//  Grocery List
//
//  Created by Daniel Ward on 1/22/14.
//  Copyright (c) 2014 UNO CSCI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UNOItemViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *catImage;

- (IBAction)buttonPressed:(id)sender;
- (IBAction)buttonTwoPressed:(id)sender;
@end
