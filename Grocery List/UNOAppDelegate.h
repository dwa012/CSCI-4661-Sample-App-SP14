//
//  UNOAppDelegate.h
//  Grocery List
//
//  Created by Daniel Ward on 1/22/14.
//  Copyright (c) 2014 UNO CSCI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GooglePlus/GooglePlus.h>

@interface UNOAppDelegate : UIResponder <UIApplicationDelegate>  {
  NSManagedObjectModel *managedObjectModel;
  NSManagedObjectContext *managedObjectContext;
  NSPersistentStoreCoordinator *persistentStoreCoordinator;
}

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (NSString *)applicationDocumentsDirectory;

+ (dispatch_queue_t)longWorkQueue;

+ (dispatch_queue_t)networkQueue;
@end
