//
//  UNONewItemViewController.h
//  Catstagram
//
//  Created by Daniel Ward on 3/17/14.
//  Copyright (c) 2014 UNO CSCI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UNONewItemViewController : UIViewController <UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *postField;
@property (weak, nonatomic) IBOutlet UIImageView *image;

- (IBAction)sendButton:(id)sender;
- (IBAction)addImageSelected:(id)sender;

@end
