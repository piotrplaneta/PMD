//
//  PeopleTableViewController.h
//  People
//
//  Created by Piotr Płaneta on 20.12.2012.
//  Copyright (c) 2012 Piotr Płaneta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PeopleTableViewController : UITableViewController

@property (strong, nonatomic) NSMutableArray* people;
@property (strong, nonatomic) NSManagedObjectContext* context;

@end
