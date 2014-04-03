//
//  Post.h
//  Catstagram
//
//  Created by Daniel Ward on 4/2/14.
//  Copyright (c) 2014 UNO CSCI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Post : NSManagedObject

@property (nonatomic, retain) NSString * remoteId;
@property (nonatomic, retain) NSString * username;
@property (nonatomic, retain) NSString * post;
@property (nonatomic, retain) NSSet *images;
@end

@interface Post (CoreDataGeneratedAccessors)

- (void)addImagesObject:(NSManagedObject *)value;
- (void)removeImagesObject:(NSManagedObject *)value;
- (void)addImages:(NSSet *)values;
- (void)removeImages:(NSSet *)values;

+ (Post *) getEmpty;
+ (Post *) fromDictionary:(NSDictionary *)dictionary;
+ (NSNumber *) getMaxRemoteId;

@end
