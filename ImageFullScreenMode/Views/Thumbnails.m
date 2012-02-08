//
//  Thumbnails.m
//  ImageFullScreenMode
//
//  Created by chenlei on 12-2-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Thumbnails.h"

@implementation Thumbnails

@synthesize thimage, delegate = _delegate;

- (id)initWithTHImage:(Image *)image{
    if (self = [super init]){
        [self setThimage:image];
        [self setImage:[image cutImage]];
        [self setUserInteractionEnabled:YES];
    }
    return  self;
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [_delegate TouchBegan:self];
}

@end
