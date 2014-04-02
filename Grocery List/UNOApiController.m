//
//  UNOApiController.m
//  Catstagram
//
//  Created by Daniel Ward on 3/17/14.
//  Copyright (c) 2014 UNO CSCI. All rights reserved.
//

#import "UNOApiController.h"
#import "CatstagramPost.h"
#import "AFHTTPRequestOperation.h"
#import "UNOAppDelegate.h"
#import "AFHTTPRequestOperationManager.h"
#import "GTLServicePlus.h"
#import "Post.h"
#import <GooglePlus/GooglePlus.h>
#import <CoreData/CoreData.h>

@implementation UNOApiController

static NSString* const URLString = @"https://cosmic-tenure-498.appspot.com/_ah/api/catstagram/v1/";

+ (NSURL *) getApiURL {
  return [NSURL URLWithString:URLString];
}

+ (void) getPosts:(id)sender withCompletion:(void (^)(NSArray *))callbackBlock {

  NSLog(@"max id: %@", [Post getMaxRemoteId]);


  NSURL *url = [[UNOApiController getApiURL] URLByAppendingPathComponent:@"post2"];

//  NSDictionary *params = @{ @"maxID" : [[Post getMaxRemoteId] stringValue] };
  NSDictionary *params = @{ };

  AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
  manager.responseSerializer = [AFJSONResponseSerializer serializer];

  [manager GET:[url absoluteString]
     parameters:params
        success:^(AFHTTPRequestOperation *operation, id responseObject) {
          NSLog(@"JSON: %@", responseObject);
          NSDictionary *result = (NSDictionary *)responseObject;

          NSMutableArray* posts = [[NSMutableArray alloc] init];

          for (NSDictionary *item in [result objectForKey:@"items"]) {
            [posts addObject:[CatstagramPost fromDictionary:item]];
          }

          callbackBlock(posts);
        }
        failure:^(AFHTTPRequestOperation *operation, NSError *error) {
          NSLog(@"Get Post Error: %@", [error localizedDescription]);
        }];
}

+ (void) sendPost:(CatstagramPost *)post withSuccess:(void (^)(void))successBlock withError:(void (^)(void))errorBlock {

  NSString *url = [[[UNOApiController getApiURL] URLByAppendingPathComponent:@"post2"] absoluteString];
  NSString *bearer = [NSString stringWithFormat:@"Bearer %@", [[GPPSignIn sharedInstance] idToken]];

  NSDictionary *params = [post toDictionary];

  AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
  manager.requestSerializer = [AFJSONRequestSerializer serializer];
  manager.responseSerializer = [AFJSONResponseSerializer serializer];

  [manager.requestSerializer setValue:bearer forHTTPHeaderField:@"Authorization"];
  [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];

  [manager POST:url
     parameters:params
        success:^(AFHTTPRequestOperation *operation, id responseObject) {
          NSLog(@"JSON: %@", responseObject);
          successBlock();
        }
        failure:^(AFHTTPRequestOperation *operation, NSError *error) {
          NSLog(@"Error: %@", error);
          errorBlock();
  }];
}

@end
