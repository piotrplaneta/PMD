//
//  AddCarViewController.m
//  Cars
//
//  Created by Piotr Płaneta on 13.12.2012.
//  Copyright (c) 2012 Piotr Płaneta. All rights reserved.
//

#import "AddCarViewController.h"
#import "ImagesUtilities.h"

@interface AddCarViewController () <UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@end

@implementation AddCarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (NSString *)model {
    if (_model == nil) {
        _model = [[NSString alloc] init];
    }
    return _model;
}

- (NSString *)producer {
    if (_producer == nil) {
        _producer = [[NSString alloc] init];
    }
    return _producer;
}

- (NSString *)imageFileName {
    if (_imageFileName == nil) {
        _imageFileName = [[NSString alloc] init];
    }
    return _imageFileName;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.modelField.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ImagePicker

- (IBAction)chooseImage:(id)sender
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
    [dateFormater setDateFormat:@"yyyyMMddHHmmss"];
    NSString *imageNameFromDate = [dateFormater stringFromDate:date];
    UIImage *selectedImage = [info valueForKey:UIImagePickerControllerOriginalImage];
    imageNameFromDate = [imageNameFromDate stringByAppendingString:@".jpg"];
    [ImagesUtilities saveImage:selectedImage withName:imageNameFromDate];
    self.imageView.image = selectedImage;
    self.imageFileName = imageNameFromDate;
    [super dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Keyboard

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    self.model = textField.text;
    [textField resignFirstResponder];
    return NO;
}

- (IBAction)endEditinginProducerField:(UITextField *)sender
{
    self.producer = sender.text;
    [sender resignFirstResponder];
}

@end
