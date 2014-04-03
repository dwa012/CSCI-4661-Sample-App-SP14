//
//  UNODetailViewController.m
//  Grocery List
//
//  Created by daniel on 2/17/14.
//  Copyright (c) 2014 UNO CSCI. All rights reserved.
//

#import "UNODetailViewController.h"
#import "UIImageView+JMImageCache.h"
#import "Image.h"

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

  if ([_data.images count] > 0) {
    NSArray *arr = [_data.images allObjects];
    Image *im = (Image *)[arr objectAtIndex:0];
    [_image setImageWithURL:[NSURL URLWithString:im.url]];
  }
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}

@end
