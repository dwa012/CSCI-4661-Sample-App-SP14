//
//  UNOItemViewController.m
//  Grocery List
//
//  Created by Daniel Ward on 1/22/14.
//  Copyright (c) 2014 UNO CSCI. All rights reserved.
//

#import "UNOItemViewController.h"
#import "UNOSecondViewController.h"

@interface UNOItemViewController ()
@end

@implementation UNOItemViewController

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
    [self setTitle:@"cool app"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goDoIt:(id)sender {
    [sender setTitle:@"WHOOO!!!" forState:UIControlStateNormal];

    NSArray *data = [[NSArray alloc] initWithObjects:@"my cool text", nil];
    NSMutableArray *mdata = [data mutableCopy];

    UNOSecondViewController *vc = [[UNOSecondViewController alloc] initWithNibName:@"UNOSecondViewController" bundle:nil data:@[@"yo"]];
    [[self navigationController] pushViewController:vc animated:YES];
}
@end
