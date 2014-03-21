//
//  UNOLandingViewController.m
//  Catstagram
//
//  Created by Daniel Ward on 3/20/14.
//  Copyright (c) 2014 UNO CSCI. All rights reserved.
//

#import "UNOSplashViewController.h"
#import <GoogleOpenSource/GoogleOpenSource.h>

@interface UNOSplashViewController ()

@end

@implementation UNOSplashViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	GPPSignIn *signIn = [GPPSignIn sharedInstance];
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
        [self performSegueWithIdentifier:@"to list" sender:self];
    } else {
        [self performSegueWithIdentifier:@"to signin" sender:self];
    }
}

@end
