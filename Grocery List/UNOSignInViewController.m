//
//  UNOSignInViewController.m
//  Grocery List
//
//  Created by Daniel Ward on 3/12/14.
//  Copyright (c) 2014 UNO CSCI. All rights reserved.
//

#import "UNOConstants.h"
#import "UNOSignInViewController.h"
#import <GoogleOpenSource/GoogleOpenSource.h>

@interface UNOSignInViewController ()

@end

@implementation UNOSignInViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) viewWillAppear:(BOOL)animated
{


  if ([[GPPSignIn sharedInstance] authentication]) {
    [self segueToLanding];
  }
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    dispatch_async(dispatch_get_main_queue(), ^{
      [self.signInButton setHidden:YES];
    });

    GPPSignIn *signIn = [GPPSignIn sharedInstance];
    signIn.shouldFetchGooglePlusUser = YES;
    //signIn.shouldFetchGoogleUserEmail = YES;  // Uncomment to get the user's email

    // You previously set kClientId in the "Initialize the Google+ client" step
    signIn.clientID = [UNOConstants GPSClientId];

    // Uncomment one of these two statements for the scope you chose in the previous step
    signIn.scopes = @[ kGTLAuthScopePlusLogin, @"email" ];  // "https://www.googleapis.com/auth/plus.login" scope
    //signIn.scopes = @[ @"profile" ];            // "profile" scope

    // Optional: declare signIn.actions, see "app activities"
    signIn.delegate = self;
    
    [signIn trySilentAuthentication];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)refreshInterfaceBasedOnSignIn
{
    if ([[GPPSignIn sharedInstance] authentication]) {
        [self segueToLanding];
    } else {
      dispatch_async(dispatch_get_main_queue(), ^{
        [self.signInButton setHidden:NO];
      });
    }
}

- (void) segueToLanding {
    [self performSegueWithIdentifier:@"sign in finished" sender:self];
}

# pragma mark GPSignInDelegate

- (void)finishedWithAuth: (GTMOAuth2Authentication *)auth
                   error: (NSError *) error
{
    if (error) {
      dispatch_async(dispatch_get_main_queue(), ^{
        [self.signInButton setHidden:NO];
      });
    } else {
        [self refreshInterfaceBasedOnSignIn];
    }
}



@end
