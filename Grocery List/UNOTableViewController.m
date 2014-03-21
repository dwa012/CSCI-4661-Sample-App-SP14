//
//  UNOTableViewController.m
//  Grocery List
//
//  Created by daniel on 2/17/14.
//  Copyright (c) 2014 UNO CSCI. All rights reserved.
//

#import "UNOTableViewController.h"
#import "UNODetailViewController.h"
#import "UNOAppDelegate.h"
#import "UNOApiController.h"
#import "UNOPostCell.h"
#import "UIImageView+JMImageCache.h"
#import "SVProgressHUD.h"
#import "UIScrollView+SVPullToRefresh.h"


@interface UNOTableViewController () {
  NSArray *data;
}

@end

@implementation UNOTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
  self = [super initWithStyle:style];
  if (self) {

  }
  return self;
}
- (id)initWithCoder:(NSCoder *)aDecoder {
  if(self = [super initWithCoder:aDecoder]){

  }

  return self;
}

- (void) initData {
  [SVProgressHUD showWithStatus:@"Loading..."];

  dispatch_async([UNOAppDelegate networkQueue], ^{

    [UNOApiController getPosts:self withCompletion:^(NSArray *array) {
      data = array;

      [SVProgressHUD dismiss];

      [[self tableView] reloadData];
    }];

  });
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
  [self initData];
}

- (void)viewDidLoad
{
  [super viewDidLoad];

  [[self tableView] addPullToRefreshWithActionHandler:^{
    [self initData];
  }];


  [self initData];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return [data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *CellIdentifier = @"Cell";
  UNOPostCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

  CatstagramPost *post = [data objectAtIndex:indexPath.row];

  [[cell post] setText:[post post]];

  if ([[post images] count] > 0) {
    [[cell image] setImageWithURL:[NSURL URLWithString:[[post images] objectAtIndex:0]]];
  }

  return cell;
}

#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  if ([[segue identifier] isEqualToString:@"showDetail"]) {
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    UNODetailViewController *detail = [segue destinationViewController];

    [detail setData:[data objectAtIndex:indexPath.row]];
  }
}


@end
