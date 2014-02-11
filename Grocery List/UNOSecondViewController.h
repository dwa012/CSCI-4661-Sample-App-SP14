//
//  UNOSecondViewController.h
//  Grocery List
//
//  Created by Daniel Ward on 2/10/14.
//  Copyright (c) 2014 UNO CSCI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UNOSecondViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *button;

- (IBAction)pushed:(id)sender;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil data:(NSArray *)stuff;
@end
