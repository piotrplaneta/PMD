//
//  Item.h
//  People
//
//  Created by Piotr Płaneta on 20.12.2012.
//  Copyright (c) 2012 Piotr Płaneta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Person;

@interface Item : NSManagedObject

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) Person *owner;

@end
