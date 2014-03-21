//
//  UNOFadeSegue.m
//  Catstagram
//  http://stackoverflow.com/a/16570483/2614663
//
//  Created by Daniel Ward on 3/12/14.
//  Copyright (c) 2014 UNO CSCI. All rights reserved.
//

#import "UNOFadeSegue.h"
#import <QuartzCore/QuartzCore.h>


@implementation UNOFadeSegue

- (void)perform
{
    CATransition *transition = [CATransition animation];
    transition.duration = 0.5;
    transition.type = kCATransitionFade;
    
    [[[[[self sourceViewController] view] window] layer] addAnimation:transition
                                                               forKey:kCATransitionFade];
    
    [[self sourceViewController]
     presentViewController:[self destinationViewController]
     animated:NO completion:NULL];
}

@end
