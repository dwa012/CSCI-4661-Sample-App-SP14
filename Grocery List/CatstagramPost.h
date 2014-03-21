//
//  CatstagramPost.h
//  Catstagram
//
//  Created by Daniel Ward on 3/17/14.
//  Copyright (c) 2014 UNO CSCI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CatstagramPost : NSObject

@property NSString* username;
@property NSString* post;
@property NSArray*  images;

- (void)addImageURL:(NSString *)url;

+ (CatstagramPost *)fromDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)toDictionary;
@end
