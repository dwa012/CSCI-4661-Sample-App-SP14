//
//  UNODetailViewController.m
//  Grocery List
//
//  Created by Daniel Ward on 2/18/14.
//  Copyright (c) 2014 UNO CSCI. All rights reserved.
//

#import "UNODetailViewController.h"

@interface UNODetailViewController ()

@end

@implementation UNODetailViewController

@synthesize item = _item;
@synthesize image = _image;
@synthesize textView = _textView;

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

    [self setTitle:[_item title]];

    [_image setImage:[UIImage imageNamed:[_item imageName]]];
    [_textView setText:[_item longText]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
