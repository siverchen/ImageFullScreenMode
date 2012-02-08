//
//  Thumbnails.h
//  ImageFullScreenMode
//
//  Created by chenlei on 12-2-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Image.h"

@protocol ThumbnailsDelegate;
@interface Thumbnails : UIImageView{
    Image *thimage;
    id <ThumbnailsDelegate> delegate;
}
@property (nonatomic, retain) Image *thimage;
@property (nonatomic, assign) id <ThumbnailsDelegate> delegate;
- (id)initWithTHImage:(Image *)image;

@end


@protocol ThumbnailsDelegate

- (void)TouchBegan:(Thumbnails *)thumbnail;

@end