//
//  Car.h
//  Cars
//
//  Created by Piotr Płaneta on 06.12.2012.
//  Copyright (c) 2012 Piotr Płaneta. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject

@property (nonatomic, strong) NSString *producer;
@property (nonatomic, strong) NSString *model;
@property (nonatomic, strong) NSString *imageFileName;

- (NSDictionary *) encodedCar;

+ (Car *) decodeCarFromDictionary:(NSDictionary *) carDictionary;
+ (void) saveCars:(NSMutableArray *)cars;
+ (NSMutableArray *) readCars;

@end
