//
//  UNOItemViewController.m
//  Grocery List
//
//  Created by Daniel Ward on 1/22/14.
//  Copyright (c) 2014 UNO CSCI. All rights reserved.
//

#import "UNOItemViewController.h"

@interface UNOItemViewController ()

@end

@implementation UNOItemViewController

@synthesize catImage = _catImage;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

//  _catImage.center = CGPointMake(100, 100);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(id)sender {
  [self performSegueWithIdentifier: @"SegueToScene1" sender: self];
}

- (IBAction)buttonTwoPressed:(id)sender {
  [self performSegueWithIdentifier: @"SegueToScene2" sender: self];
}

@end