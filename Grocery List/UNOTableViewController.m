//
//  UNOTableViewController.m
//  Grocery List
//
//  Created by Daniel Ward on 2/18/14.
//  Copyright (c) 2014 UNO CSCI. All rights reserved.
//

#import "UNOTableViewController.h"
#import "UNOCustomCell.h"
#import "UNOItem.h"
#import "UNODetailViewController.h"

@interface UNOTableViewController () {
    NSArray *data;
}

@end

@implementation UNOTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
   NSMutableArray *tempData = [[NSMutableArray alloc] init];

    UNOItem *item = [[UNOItem alloc] init];
    [item setImageName:@"image1.png"];
    [item setTitle:@"Item 1"];
    [item setSubtitle:@"Subtitle 1"];
    [item setLongText:@"Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis "];
    [tempData addObject:item];

    item = [[UNOItem alloc] init];
    [item setImageName:@"image2.png"];
    [item setTitle:@"Item 2"];
    [item setSubtitle:@"Subtitle 2"];
    [item setLongText:@"Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis "];
    [tempData addObject:item];

    item = [[UNOItem alloc] init];
    [item setImageName:@"image3.png"];
    [item setTitle:@"Item 3"];
    [item setSubtitle:@"Subtitle 3"];
    [item setLongText:@"Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis "];
    [tempData addObject:item];

    item = [[UNOItem alloc] init];
    [item setImageName:@"image4.png"];
    [item setTitle:@"Item 4"];
    [item setSubtitle:@"Subtitle 4"];
    [item setLongText:@"Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis "];
    [tempData addObject:item];

    data = tempData;
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
    static NSString *CellIdentifier = @"MyCell";
    UNOCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    UNOItem *item = [data objectAtIndex:indexPath.row];

    [[cell image] setImage:[UIImage imageNamed:[item imageName]]];
    [cell titleText].text = [item title];
    [cell subtitleText].text = [item subtitle];

    return cell;
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    UNODetailViewController *vc =  [segue destinationViewController];
    [vc setItem:[data objectAtIndex:indexPath.row]];
}

@end
