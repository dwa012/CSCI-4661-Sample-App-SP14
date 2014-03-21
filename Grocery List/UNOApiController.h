//
//  UNOApiController.h
//  Catstagram
//
//  Created by Daniel Ward on 3/17/14.
//  Copyright (c) 2014 UNO CSCI. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CatstagramPost;

@interface UNOApiController : NSObject

+ (void)sendPost;

+ (NSURL *)getApiURL;

+ (void)getPosts:(id)sender withCompletion:(void (^)(NSArray *))callbackBlock;

+ (void)sendPost:(CatstagramPost *)post withSuccess:(void (^)(void))successBlock withError:(void (^)(void))errorBlock;

@end
