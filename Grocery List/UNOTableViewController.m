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
#import "Post.h"
#import "Image.h"


@interface UNOTableViewController () {

}

@end

@implementation UNOTableViewController

- (id)initWithCoder:(NSCoder *)aDecoder {
  if(self = [super initWithCoder:aDecoder]) {
    UNOAppDelegate *del = (UNOAppDelegate *) [[UIApplication sharedApplication] delegate];
    self.managedObjectContext = [del managedObjectContext];
  }
  return self;
}

- (void) initData {
  // only show the overlay if there are no items
  if ([[[self fetchedResultsController] fetchedObjects] count] == 0){
    [SVProgressHUD showWithStatus:@"Loading..."];
  }


  dispatch_async([UNOAppDelegate networkQueue], ^{

    [UNOApiController getPosts:self withCompletion:^(NSArray *array) {
      [SVProgressHUD dismiss];
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

- (NSString *)cellIdentifier {
  return @"Cell";
}

- (NSString *)entityName {
  return @"Post";
}

- (BOOL)shouldAllowAddNewObject {
  return YES;
}

- (NSArray *)fetchedSortDescriptors {
  NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"remoteId" ascending:NO];
  NSArray *sortDescriptors = @[sortDescriptor];

  return sortDescriptors;
}

- (void)openAddObjectView:(id)sender {
  UIViewController *vc = [[self storyboard] instantiateViewControllerWithIdentifier:@"Add New Post"];
  [self presentViewController:vc animated:YES completion:nil];
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
  [super configureCell:cell atIndexPath:indexPath];
  Post *post = (Post *)[[self fetchedResultsController] objectAtIndexPath:indexPath];
  UNOPostCell *postCell = (UNOPostCell *)cell;

  postCell.post.text = post.post;

  if ([post.images count] > 0) {
    NSArray *arr = [post.images allObjects];
    Image *im = (Image *)[arr objectAtIndex:0];
    [postCell.image setImageWithURL:[NSURL URLWithString:im.url]];
  }
}


#pragma mark - CD Helper


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  if ([[segue identifier] isEqualToString:@"showDetail"]) {
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    UNODetailViewController *detail = [segue destinationViewController];

    [detail setData:[[self fetchedResultsController] objectAtIndexPath:indexPath]];
  }
}


@end
