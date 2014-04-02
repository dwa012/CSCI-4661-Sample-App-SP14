//
//  Post.m
//  Catstagram
//
//  Created by Daniel Ward on 4/2/14.
//  Copyright (c) 2014 UNO CSCI. All rights reserved.
//

#import "Post.h"
#import "UNOAppDelegate.h"

@implementation Post

@dynamic remoteId;
@dynamic username;
@dynamic post;
@dynamic images;

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

@end
