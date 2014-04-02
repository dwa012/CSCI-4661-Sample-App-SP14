//
//  Image.h
//  Catstagram
//
//  Created by Daniel Ward on 4/2/14.
//  Copyright (c) 2014 UNO CSCI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Post;

@interface Image : NSManagedObject

@property (nonatomic, retain) NSString * url;
@property (nonatomic, retain) Post *post;

+ (Image *)getEmpty;
@end
