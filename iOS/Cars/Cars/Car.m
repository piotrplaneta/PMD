//
//  Car.m
//  Cars
//
//  Created by Piotr Płaneta on 06.12.2012.
//  Copyright (c) 2012 Piotr Płaneta. All rights reserved.
//

#import "Car.h"

@implementation Car

- (NSDictionary *) encodedCar
{
    return [[NSDictionary alloc] initWithObjectsAndKeys:
            self.producer, @"producer",
            self.model, @"model",
            self.imageFileName, @"imageFileName", nil];
}

+ (Car *) decodeCarFromDictionary:(NSDictionary *)carDictionary
{
    Car *car = [[Car alloc] init];
    car.producer = carDictionary[@"producer"];
    car.model = carDictionary[@"model"];
    car.imageFileName = carDictionary[@"imageFileName"];
    return car;
}

+ (void) saveCars:(NSMutableArray *)cars
{
    NSMutableArray *carsPList = [[NSMutableArray alloc] init];
    for (Car *car in cars) {
        [carsPList addObject:car.encodedCar];
    }
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *fullPath = [documentsDirectory stringByAppendingPathComponent: @"cars.data"];
    
    [carsPList writeToFile:fullPath atomically:YES];
    
}

+ (NSMutableArray *) readCars
{
    
    NSMutableArray *cars = [[NSMutableArray alloc] init];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *fullPath = [documentsDirectory stringByAppendingPathComponent: @"cars.data"];
    
    NSMutableArray *carsPList = [[NSMutableArray alloc] initWithContentsOfFile:fullPath];
    
    for (NSDictionary *carDictionary in carsPList) {
        Car *car = [Car decodeCarFromDictionary:carDictionary];
        [cars addObject:car];
    }
    
    return cars;
}

@end
