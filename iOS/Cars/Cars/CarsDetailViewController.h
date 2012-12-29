//
//  CarsDetailViewController.h
//  Cars
//
//  Created by Piotr Płaneta on 06.12.2012.
//  Copyright (c) 2012 Piotr Płaneta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CarsDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *carImage;
@property (weak, nonatomic) IBOutlet UILabel *producerLabel;
@property (weak, nonatomic) IBOutlet UILabel *modelLabel;

@property (strong, nonatomic) NSDictionary *car;

@end
