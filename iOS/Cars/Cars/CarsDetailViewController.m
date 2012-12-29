//
//  CarsDetailViewController.m
//  Cars
//
//  Created by Piotr Płaneta on 06.12.2012.
//  Copyright (c) 2012 Piotr Płaneta. All rights reserved.
//

#import "CarsDetailViewController.h"
#import "ImagesUtilities.h"

@interface CarsDetailViewController ()

@end

@implementation CarsDetailViewController

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
    self.carImage.image = [ImagesUtilities loadImage: self.car[@"imagePath"]];
    self.producerLabel.text = self.car[@"producer"];
    self.modelLabel.text = self.car[@"model"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
