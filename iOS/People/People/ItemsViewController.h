//
//  ItemsViewController.h
//  People
//
//  Created by Piotr Płaneta on 20.12.2012.
//  Copyright (c) 2012 Piotr Płaneta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@interface ItemsViewController : UITableViewController

@property (nonatomic, strong) Person* person;
@property (nonatomic, strong) NSManagedObjectContext *context;

@end
