//
//  AddCarViewController.h
//  Cars
//
//  Created by Piotr Płaneta on 13.12.2012.
//  Copyright (c) 2012 Piotr Płaneta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddCarViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *producerField;

@property (weak, nonatomic) IBOutlet UITextField *modelField;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (strong, nonatomic) NSString *producer;
@property (strong, nonatomic) NSString *model;
@property (strong, nonatomic) NSString *imageFileName;

@end
