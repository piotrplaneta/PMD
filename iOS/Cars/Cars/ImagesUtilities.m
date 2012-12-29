//
//  ImagesUtilities.m
//  Cars
//
//  Created by Piotr Płaneta on 13.12.2012.
//  Copyright (c) 2012 Piotr Płaneta. All rights reserved.
//

#import "ImagesUtilities.h"

@implementation ImagesUtilities

+ (void)saveImage:(UIImage*)image withName: (NSString*)imageName {
    
    NSData *imageData = UIImageJPEGRepresentation(image,1.0); //convert image into .jpg format.
    
    NSFileManager *fileManager = [NSFileManager defaultManager];//create instance of NSFileManager
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); //create an array and store result of our search for the documents directory in it
    
    NSString *documentsDirectory = [paths objectAtIndex:0]; //create NSString object, that holds our exact path to the documents directory
    
    NSString *fullPath = [documentsDirectory stringByAppendingPathComponent: imageName]; //add our image to the path
    
    if(![fileManager createFileAtPath:fullPath contents:imageData attributes:nil])
        //finally save the path (image)
    {
        NSLog(@"Image NOT saved");
    }
    
}

+ (UIImage *)loadImage:(NSString *)imageName {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *fullPath = [documentsDirectory stringByAppendingPathComponent:imageName];
    
    return [UIImage imageWithContentsOfFile:fullPath];
    
}


@end
