//
//  Post.m
//  Catstagram
//
//  Created by Daniel Ward on 4/2/14.
//  Copyright (c) 2014 UNO CSCI. All rights reserved.
//

#import "Post.h"
#import "UNOAppDelegate.h"
#import "Image.h"

@implementation Post

@dynamic remoteId;
@dynamic username;
@dynamic post;
@dynamic images;

+ (Post *)getEmpty {
    UNOAppDelegate *del = (UNOAppDelegate *) [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [del managedObjectContext];
   return (Post *)[NSEntityDescription insertNewObjectForEntityForName:@"Post" inManagedObjectContext:context];
}

+ (Post *) fromDictionary:(NSDictionary *)dictionary {

  UNOAppDelegate *del = (UNOAppDelegate *) [[UIApplication sharedApplication] delegate];


  Post *result = nil;

  // try to get an existing post, if none exists then make a new one
  if ([Post getPostWithRemoteID:[dictionary objectForKey:@"id"]]){
    result = [Post getPostWithRemoteID:[dictionary objectForKey:@"id"]];
  } else {
    result = [Post getEmpty];
    result.remoteId = [dictionary objectForKey:@"id"];
  }

  result.username = [dictionary objectForKey:@"username"];
  result.post = [dictionary objectForKey:@"post"];

  NSMutableSet *images = [[NSMutableSet alloc] init];

  for (NSString *image in [dictionary objectForKey:@"images"]) {
    Image* temp = [Image getEmpty] ;
    temp.url = image;

    [images addObject:temp];
  }

  if ([images count] > 0) {
    [result addImages:images];
  }

  [del saveContext];

  return result;
}


+ (NSNumber *) getMaxRemoteId {
    UNOAppDelegate *del = (UNOAppDelegate *) [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [del managedObjectContext];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Post" inManagedObjectContext:context];
    [request setEntity:entity];
    
    // Specify that the request should return dictionaries.
    [request setResultType:NSDictionaryResultType];
    
    // Create an expression for the key path.
    NSExpression *keyPathExpression = [NSExpression expressionForKeyPath:@"remoteId"];
    
    // Create an expression to represent the maximum value at the key path 'creationDate'
    NSExpression *maxExpression = [NSExpression expressionForFunction:@"max:" arguments:[NSArray arrayWithObject:keyPathExpression]];
    
    // Create an expression description using the maxExpression and returning a date.
    NSExpressionDescription *expressionDescription = [[NSExpressionDescription alloc] init];
    
    // The name is the key that will be used in the dictionary for the return value.
    [expressionDescription setName:@"maxID"];
    [expressionDescription setExpression:maxExpression];
    [expressionDescription setExpressionResultType:NSDateAttributeType];
    
    // Set the request's properties to fetch just the property represented by the expressions.
    [request setPropertiesToFetch:[NSArray arrayWithObject:expressionDescription]];
    
    // Execute the fetch.
    NSError *error = nil;
    NSArray *objects = [context executeFetchRequest:request error:&error];
    if (objects == nil) {
        return nil;
    }
    else {
        if ([objects count] > 0) {
            return [[objects objectAtIndex:0] valueForKey:@"maxID"];
        } else {
            return nil;
        }
    }
}

+ (Post *) getPostWithRemoteID:(NSString *)remoteId {
  UNOAppDelegate *del = (UNOAppDelegate *) [[UIApplication sharedApplication] delegate];
  NSManagedObjectContext *context = [del managedObjectContext];

  NSFetchRequest *request = [[NSFetchRequest alloc] init];
  NSEntityDescription *entity = [NSEntityDescription entityForName:@"Post" inManagedObjectContext:context];
  [request setEntity:entity];

  // Specify that the request should return dictionaries.
  [request setResultType:NSManagedObjectResultType];

  NSPredicate *predicate = [NSPredicate predicateWithFormat:@"remoteId = %@", remoteId];
  [request setPredicate:predicate];

  // Execute the fetch.
  NSError *error;
  NSArray *objects = [context executeFetchRequest:request error:&error];
  if (objects == nil) {
    return nil;
  }
  else {
    if ([objects count] > 0) {
      return (Post *)[objects objectAtIndex:0];
    } else {
      return nil;
    }
  }
}

@end
