//
//  CarsTableViewController.m
//  Cars
//
//  Created by Piotr Płaneta on 06.12.2012.
//  Copyright (c) 2012 Piotr Płaneta. All rights reserved.
//

#import "CarsTableViewController.h"
#import "Car.h"
#import "CarsTableViewCell.h"
#import "CarsDetailViewController.h"
#import "AddCarViewController.h"
#import "ImagesUtilities.h"

@interface CarsTableViewController ()

@end

@implementation CarsTableViewController

- (NSMutableArray *)cars
{
    if (!_cars) {
        _cars = [[NSMutableArray alloc] init];
    }
    return _cars;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self addBarButtons];
    [self propagateCars];
   
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowCarDetails"]) {
    
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow; 
        
        CarsDetailViewController *dVC = (CarsDetailViewController *) segue.destinationViewController;
        dVC.car = @{@"imagePath" : [self.cars[indexPath.row] imageFileName],
                    @"producer"  : [self.cars[indexPath.row] producer],
                    @"model"     : [self.cars[indexPath.row] model]};
    }
    
}

- (void)addBarButtons
{
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addCar)];
}

- (void)addCar
{
    AddCarViewController * aCVC = [self.storyboard instantiateViewControllerWithIdentifier:@"AddCarViewController"];
    aCVC.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:aCVC animated:YES completion:nil];
}

- (IBAction)returnFromAddCarWithSave:(UIStoryboardSegue *)segue
{
    AddCarViewController * aCVC = segue.sourceViewController;
    Car* car = [[Car alloc] init];
    car.producer = aCVC.producer;
    car.model = aCVC.model;
    car.imageFileName = aCVC.imageFileName;
    [self.cars addObject:car];
    [self.tableView reloadData];
    [Car saveCars:self.cars];
}

- (IBAction)returnFromAddCarWithCancel:(UIStoryboardSegue *)segue
{
    
}

- (void)propagateCars
{
    self.cars = [Car readCars];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.cars.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CarsTableViewCell";
    CarsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.imageView.image = [ImagesUtilities loadImage:[self.cars[indexPath.row] imageFileName]];
    
    cell.producerLabel.text = [self.cars[indexPath.row] producer];
    cell.modelLabel.text = [self.cars[indexPath.row] model];
    
    
    
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.cars removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [Car saveCars:self.cars];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}



- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    Car *temp = self.cars[fromIndexPath.row];
    [self.cars removeObjectAtIndex:fromIndexPath.row];
    [self.cars insertObject:temp atIndex:toIndexPath.row];
}



- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
