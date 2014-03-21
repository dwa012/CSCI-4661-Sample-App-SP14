//
//  CatstagramPost.m
//  Catstagram
//
//  Created by Daniel Ward on 3/17/14.
//  Copyright (c) 2014 UNO CSCI. All rights reserved.
//

#import "CatstagramPost.h"

@implementation CatstagramPost

- (id)init {
  self = [super init];
  if (self) {
    self.images = [[NSArray alloc] init];
  }

  return self;
}

- (void) addImageURL:(NSString *)url {
  self.images = [self.images arrayByAddingObject:url];
}

+ (CatstagramPost *) fromDictionary:(NSDictionary *)dictionary {
  CatstagramPost *result = [[CatstagramPost alloc] init];

  [result setUsername:[dictionary objectForKey:@"username"]];
  [result setPost:[dictionary objectForKey:@"post"]];

  for (NSString *image in [dictionary objectForKey:@"images"]) {
    [result addImageURL:image];
  }

  return result;
}

- (NSDictionary *) toDictionary {
  NSMutableDictionary *result = [[NSMutableDictionary alloc] init];

  [result setValue:[self post] forKey:@"post"];

  if ([[self images] count] > 0){
    [result setValue:[self images] forKey:@"images"];
  }

  return result;
}
@end
