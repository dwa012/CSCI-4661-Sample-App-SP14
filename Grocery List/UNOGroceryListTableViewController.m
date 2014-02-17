//
//  UNOGroceryListTableViewController.m
//  Grocery List
//
//  Created by daniel on 2/17/14.
//  Copyright (c) 2014 UNO CSCI. All rights reserved.
//

#import "UNOGroceryListTableViewController.h"
#import "UNODetailViewController.h"

@interface UNOGroceryListTableViewController () {
  NSArray *data;
}

@end

@implementation UNOGroceryListTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
  self = [super initWithStyle:style];
  if (self) {
    [self initData];
  }
  return self;
}
- (id)initWithCoder:(NSCoder *)aDecoder {
  if(self = [super initWithCoder:aDecoder])
  {
    [self initData];
  }
  return self;
}

- (void) initData {
  NSMutableArray *tempItems = [[NSMutableArray alloc] init];

  NSDictionary  *item = [[NSDictionary alloc] initWithObjects:@[@"Bread",@"bread.jpg"] forKeys:@[@"name",@"image"]];
  [tempItems addObject:item];

  item = [[NSDictionary alloc] initWithObjects:@[@"Butter",@"butter.jpg"] forKeys:@[@"name",@"image"]];
  [tempItems addObject:item];

  item = [[NSDictionary alloc] initWithObjects:@[@"Milk",@"milk.jpg"] forKeys:@[@"name",@"image"]];
  [tempItems addObject:item];

  item = [[NSDictionary alloc] initWithObjects:@[@"Cereal",@"cereal.jpg"] forKeys:@[@"name",@"image"]];
  [tempItems addObject:item];

  data = tempItems;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
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
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

  cell.textLabel.text = [[data objectAtIndex:indexPath.row] objectForKey:@"name"];

  return cell;
}

#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
  UNODetailViewController *detail = [segue destinationViewController];
  [detail setData:[data objectAtIndex:indexPath.row]];
}


@end
