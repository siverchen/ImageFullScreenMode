//
//  Image.m
//  ImageFullScreenMode
//
//  Created by chenlei on 12-2-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Image.h"
#import "UIImage+SizeControl.h"

@implementation Image

@synthesize imageid, imagename, imgdata, catid, catname, imgurl;

- (UIImage *)cutImage{
    UIImage *tmpimg = [UIImage imageWithData:self.imgdata];
    CGSize imgsize = [tmpimg size];
    CGFloat length;
    imgsize.width > imgsize.height ? (length = imgsize.height) : (length = imgsize.width);
    
    return [tmpimg cutImageWithFrame:CGRectMake(-(imgsize.width - length) / 2, -(imgsize.height - length) / 2, length, length)];
}
- (UIImage *)getImage{
    if (self.imgdata)
        return [UIImage imageWithData:self.imgdata];
    else
        return nil;
}


@end
