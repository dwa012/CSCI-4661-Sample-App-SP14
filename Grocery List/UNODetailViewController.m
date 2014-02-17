//
//  UNODetailViewController.m
//  Grocery List
//
//  Created by daniel on 2/17/14.
//  Copyright (c) 2014 UNO CSCI. All rights reserved.
//

#import "UNODetailViewController.h"

@interface UNODetailViewController ()

@end

@implementation UNODetailViewController

@synthesize data = _data;
@synthesize image =_image;

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
  [_image setImage:[UIImage imageNamed:[_data objectForKey:@"image"]]];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}

@end
