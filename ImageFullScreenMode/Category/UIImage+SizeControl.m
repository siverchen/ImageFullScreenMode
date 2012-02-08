//
//  UIImage+SizeControl.m
//  MusicBox
//
//  Created by ruby siver on 12-1-10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "UIImage+SizeControl.h"

@implementation UIImage (SizeControl)


- (UIImage *)cutImageWithFrame:(CGRect)frame{
    UIGraphicsBeginImageContext(frame.size);
    [self drawInRect:CGRectMake(frame.origin.x, frame.origin.y, self.size.width, frame.size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext(); 
    UIGraphicsEndImageContext();
    return newImage;
}
- (UIImage *)scaledToSize:(CGSize)newSize {
    UIGraphicsBeginImageContext(newSize);
    [self drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();    
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage *)InsertNewImageWithSize:(CGSize)size Image:(UIImage *)img Frame:(CGRect)frame{
    UIGraphicsBeginImageContext(size);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    [img drawInRect:frame];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();    
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage *)scaledWithScale:(CGFloat)scale{
    CGSize newSize = CGSizeMake(self.size.width / scale, self.size.height / scale);
    UIGraphicsBeginImageContext(newSize);
    [self drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();    
    UIGraphicsEndImageContext();
    return newImage;
}


@end
