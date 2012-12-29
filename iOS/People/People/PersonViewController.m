//
//  PersonViewController.m
//  People
//
//  Created by Piotr Płaneta on 20.12.2012.
//  Copyright (c) 2012 Piotr Płaneta. All rights reserved.
//

#import "PersonViewController.h"
#import "Item.h"
#import "ItemsViewController.h"

@interface PersonViewController ()

@end

@implementation PersonViewController

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
	self.lastNameLabel.text = self.person.lastName;
    self.firstNameLabel.text = self.person.firstName;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backgroundTouched:(id)sender
{
    [self.itemNameField resignFirstResponder];
}

- (IBAction)addItem:(id)sender
{
    Item *newItem = [NSEntityDescription insertNewObjectForEntityForName:@"Item" inManagedObjectContext:self.context];
    newItem.name = self.itemNameField.text;
    self.itemNameField.text = @"";
    [self.itemNameField resignFirstResponder];
    
    [self.person addItemsObject:newItem];
    [self.context save:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ItemsViewController *viewController = segue.destinationViewController;
    viewController.person = self.person;
    viewController.context = self.context;
}


@end
