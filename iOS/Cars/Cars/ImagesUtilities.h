//
//  ImagesUtilities.h
//  Cars
//
//  Created by Piotr Płaneta on 13.12.2012.
//  Copyright (c) 2012 Piotr Płaneta. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImagesUtilities : NSObject

+ (void)saveImage:(UIImage*)image withName: (NSString*)imageName;
+ (UIImage *)loadImage:(NSString *)imageName;

@end
