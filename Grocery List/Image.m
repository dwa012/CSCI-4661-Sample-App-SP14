//
//  Image.m
//  Catstagram
//
//  Created by Daniel Ward on 4/2/14.
//  Copyright (c) 2014 UNO CSCI. All rights reserved.
//

#import "Image.h"
#import "UNOAppDelegate.h"


@implementation Image

@dynamic url;
@dynamic post;

+ (Image *)getEmpty {
  UNOAppDelegate *del = (UNOAppDelegate *) [[UIApplication sharedApplication] delegate];
  NSManagedObjectContext *context = [del managedObjectContext];
  return (Image *)[NSEntityDescription insertNewObjectForEntityForName:@"Post" inManagedObjectContext:context];
}

@end
