//
//  UNOAppDelegate.m
//  Grocery List
//
//  Created by Daniel Ward on 1/22/14.
//  Copyright (c) 2014 UNO CSCI. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "UNOAppDelegate.h"

@implementation UNOAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)application: (UIApplication *)application
            openURL: (NSURL *)url
  sourceApplication: (NSString *)sourceApplication
         annotation: (id)annotation {
    return [GPPURLHandler handleURL:url
                  sourceApplication:sourceApplication
                         annotation:annotation];
}

- (NSManagedObjectContext *) managedObjectContext {
  if (managedObjectContext != nil) {
    return managedObjectContext;
  }
  NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
  if (coordinator != nil) {
    managedObjectContext = [[NSManagedObjectContext alloc] init];
    [managedObjectContext setPersistentStoreCoordinator: coordinator];
  }

  return managedObjectContext;
}

- (NSManagedObjectModel *)managedObjectModel {
  if (managedObjectModel != nil) {
    return managedObjectModel;
  }
  managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];

  return managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
  if (persistentStoreCoordinator != nil) {
    return persistentStoreCoordinator;
  }
  NSURL *storeUrl = [NSURL fileURLWithPath: [[self applicationDocumentsDirectory]
          stringByAppendingPathComponent: @"<Project Name>.sqlite"]];
  NSError *error = nil;
  persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc]
          initWithManagedObjectModel:[self managedObjectModel]];
  if(![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                               configuration:nil URL:storeUrl options:nil error:&error]) {
    /*Error for store creation should be handled in here*/
  }

  return persistentStoreCoordinator;
}

- (NSString *)applicationDocumentsDirectory {
  return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}


+ (dispatch_queue_t)longWorkQueue {
    static dispatch_once_t pred;
    static dispatch_queue_t sharedDispatchQueue;

    dispatch_once(&pred, ^{
        sharedDispatchQueue =
                dispatch_queue_create("cs.uno.edu.csci4661.sp14.longtask", NULL);
    });

    return sharedDispatchQueue;
}

+ (dispatch_queue_t)networkQueue {
  static dispatch_once_t pred;
  static dispatch_queue_t sharedDispatchQueue;

  dispatch_once(&pred, ^{
    sharedDispatchQueue =
            dispatch_queue_create("cs.uno.edu.csci4661.sp14.network", NULL);
  });

  return sharedDispatchQueue;
}

@end
