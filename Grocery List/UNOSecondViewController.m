//
//  UNOSecondViewController.m
//  Grocery List
//
//  Created by Daniel Ward on 2/10/14.
//  Copyright (c) 2014 UNO CSCI. All rights reserved.
//

#import "UNOSecondViewController.h"

@interface UNOSecondViewController () {
    NSArray *_data;
}

@end

@implementation UNOSecondViewController

@synthesize button = _button;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _data = [[NSArray alloc] init];
    }
    return self;
}

- (IBAction)pushed:(id)sender {
    [[self navigationController] popViewControllerAnimated:YES];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil  data:(NSArray *)stuff
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _data = stuff;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    if ([_data count] != 0) {
        [_button setTitle:[_data objectAtIndex:0] forState:UIControlStateNormal];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.


}

@end
