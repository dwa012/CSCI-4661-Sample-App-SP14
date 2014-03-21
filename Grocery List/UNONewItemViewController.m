//
//  UNONewItemViewController.m
//  Catstagram
//
//  Created by Daniel Ward on 3/17/14.
//  Copyright (c) 2014 UNO CSCI. All rights reserved.
//

#import "UNONewItemViewController.h"
#import "UNOAppDelegate.h"
#import "CatstagramPost.h"
#import "UNOApiController.h"
#import "SVProgressHUD.h"
#import <UIImage+Resizing.h>

@interface UNONewItemViewController ()

@end

@implementation UNONewItemViewController

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

  // Do any additional setup after loading the view.
  [[self postField] setReturnKeyType:UIReturnKeyDone];
  [self postField].delegate = self;
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (IBAction)sendButton:(id)sender {
  [SVProgressHUD show];
  dispatch_async([UNOAppDelegate networkQueue], ^{

    CatstagramPost *post = [[CatstagramPost alloc] init];
    [post setPost:self.postField.text];

    if ([[self image] image] != nil) {
      NSString *imageBase64 = [UIImagePNGRepresentation([[self image] image]) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
      [post addImageURL:imageBase64];
    }

    [UNOApiController sendPost:post
                   withSuccess:^{
                     dispatch_async(dispatch_get_main_queue(), ^{
                       [SVProgressHUD dismiss];
                       [[self navigationController] popViewControllerAnimated:YES];

                       [SVProgressHUD showSuccessWithStatus:@"Sent"];
                     });
                   }
                     withError:^{
                       dispatch_async(dispatch_get_main_queue(), ^{
                         [SVProgressHUD dismiss];
                         [SVProgressHUD showErrorWithStatus:@"Error"];
                       });
                     }];
  });
}

- (IBAction)addImageSelected:(id)sender {

  UIImagePickerControllerSourceType type =
          UIImagePickerControllerSourceTypePhotoLibrary;

  BOOL ok = [UIImagePickerController isSourceTypeAvailable:type];

  if (!ok) {
    NSLog(@"alas");
    return;
  }

  UIImagePickerController* picker = [UIImagePickerController new];
  picker.sourceType = type;
  picker.mediaTypes =
          [UIImagePickerController availableMediaTypesForSourceType:type];
  picker.delegate = self;
  [self presentViewController:picker animated:YES completion:nil]; // iPhone
}

#pragma mark UITextFieldDelegate

- (void)textFieldShouldReturn:(UITextField *)textField {
  [textField resignFirstResponder];
}

#pragma mark UIImagePickerControllerDelegate

-(void)imagePickerController:
        (UIImagePickerController *)picker
        didFinishPickingMediaWithInfo:(NSDictionary *)info
{

  NSURL* url = info[UIImagePickerControllerMediaURL];
  UIImage* im = info[UIImagePickerControllerOriginalImage];
  UIImage* edim = info[UIImagePickerControllerEditedImage];

  if (edim)
    im = edim;

  UIImage *temp = [im scaleToFitSize:(CGSize){500, 500}];
  temp = [temp cropToSize:(CGSize){500, 500} usingMode:NYXCropModeCenter];

  [[self image] setImage:temp];

  [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)imagePickerControllerDidCancel:
        (UIImagePickerController *)picker
{
  [self dismissViewControllerAnimated:YES completion:nil];
}
@end
