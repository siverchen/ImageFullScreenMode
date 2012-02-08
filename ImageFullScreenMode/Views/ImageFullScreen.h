//
//  ImageFullScreen.h
//  ImageFullScreenMode
//
//  Created by chenlei on 12-2-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Thumbnails.h"
#import "AutoHide.h"

@protocol ImageFullScreenDelegate;

@interface ImageFullScreen : UIViewController <UIApplicationDelegate>{
    Thumbnails *FSImage;
    UIImageView *imageview; 
    UIDeviceOrientation orientation;
    id <ImageFullScreenDelegate> delegate;
    AutoHide *autohide;
}
@property (nonatomic, retain) Thumbnails *FSImage;
@property (nonatomic, retain) UIImageView *imageview;
@property (nonatomic, assign) id <ImageFullScreenDelegate> delegate;

- (void)ToFullScreenFrom:(CGRect)frame Target:(id)target;


@end

@protocol ImageFullScreenDelegate

@optional

- (void)FullScreenDidAppear;

- (void)FullScreenDidDisappear;

@end