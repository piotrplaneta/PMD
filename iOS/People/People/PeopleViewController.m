//
//  PeopleViewController.m
//  People
//
//  Created by Piotr Płaneta on 20.12.2012.
//  Copyright (c) 2012 Piotr Płaneta. All rights reserved.
//

#import "PeopleViewController.h"
#import "PeopleAppDelegate.h"
#import "Person.h"
#import "PeopleTableViewController.h"

@interface PeopleViewController ()

@end

@implementation PeopleViewController

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
	PeopleAppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    self.context = appDelegate.managedObjectContext;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Prepare for Segue

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    PeopleTableViewController *viewController = segue.destinationViewController;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Person"];
    
    if ([segue.identifier isEqualToString:@"ShowFiltered"]) {
        NSString *filter = self.filterField.text;
        if (![filter isEqualToString:@""]) {
            NSPredicate *predicate = [NSPredicate predicateWithFormat:@"lastName like %@", filter];
            [fetchRequest setPredicate:predicate];
        }
    }
    
    viewController.people = [[self.context executeFetchRequest:fetchRequest error:nil] mutableCopy];
    viewController.context = self.context;
    
}

#pragma mark Target Actions

- (IBAction)savePerson:(id)sender
{
    NSString *firstName = self.firstNameField.text;
    NSString *lastName = self.lastNameField.text;
    self.firstNameField.text = @"";
    self.lastNameField.text = @"";
    [self.firstNameField resignFirstResponder];
    [self.lastNameField resignFirstResponder];
    
    Person *newPerson = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:self.context];
    newPerson.firstName = firstName;
    newPerson.lastName = lastName;
    
    NSError *error;
    [self.context save:&error];
    if (error) {
        NSLog(@"%@", error.localizedDescription);
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Person"];
    
    NSInteger count = [self.context countForFetchRequest:fetchRequest error:nil];
    NSLog(@"Liczba obiektów Person w bazie: %d", count);
}

#pragma mark Keyboard

- (IBAction)backgroundTouched:(id)sender
{
    [self.firstNameField resignFirstResponder];
    [self.lastNameField resignFirstResponder];
    [self.filterField resignFirstResponder];
}


@end
