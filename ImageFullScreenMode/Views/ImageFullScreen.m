//
//  ImageFullScreen.m
//  ImageFullScreenMode
//
//  Created by chenlei on 12-2-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ImageFullScreen.h"
#import "Animation.h"

#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

@implementation ImageFullScreen

@synthesize FSImage = _FSImage, imageview = _imageview, delegate = _delegate;

- (void)detectOrientation:(NSNotification *)notification{
    CGSize screensize = [[UIScreen mainScreen] bounds].size;
    CGSize imagesize = [_imageview.image size];
    
    if (([[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeLeft) || 
        ([[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeRight)) {
        screensize = CGSizeMake(screensize.height, screensize.width);
        
    } else if ([[UIDevice currentDevice] orientation] == UIDeviceOrientationPortrait ||
               [[UIDevice currentDevice] orientation] == UIDeviceOrientationPortraitUpsideDown) {
        screensize = CGSizeMake(screensize.width, screensize.height);
    }
    CGFloat scale = screensize.width / imagesize.width > screensize.height / imagesize.height ?
                    screensize.height / imagesize.height :
                    screensize.width / imagesize.width;
    
    
    [_imageview setFrame:CGRectMake((screensize.width - imagesize.width * scale) / 2, (screensize.height - imagesize.height * scale) / 2, imagesize.width * scale, imagesize.height * scale)];
    
    [self.view setFrame:CGRectMake(0, 0, screensize.width, screensize.height)];
}

- (id)init{
    if (self == [super init]){
        [self.view setUserInteractionEnabled:YES];
        _imageview = [[UIImageView alloc] init];
        

    }
    return self;
}


- (void)dealloc{
    [super dealloc];
}

- (void)removeFromSuperview{
    [_delegate FullScreenDidDisappear];
    [autohide RemoveAnimation];
    [imageview removeFromSuperview];
    imageview = nil;
    [imageview release];
    FSImage = nil;
    [FSImage release];
    [self release];
    [super.view removeFromSuperview];
}

- (void)close{
    [Animation ShowOrHideView:self.view to:0 During:.5 Action:@selector(removeFromSuperview) Target:self];
}
- (void)AddCloseBtn{
    UIButton *close = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [close setTitle:@"close" forState:UIControlStateNormal];
    [close setFrame:CGRectMake(0, 20, 50, 50)];
    [close addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:close];
    
    if (!autohide){
        autohide = [[AutoHide alloc] initAutoHideViews:[NSArray arrayWithObjects:close, StatusBar,  nil] WithHideTime:3 FromNowOn:YES];
    }
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
}

- (void)ToFullScreenFrom:(CGRect)frame Target:(id)target{
    orientation = [[UIDevice currentDevice] orientation];
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(detectOrientation:) name:@"UIDeviceOrientationDidChangeNotification" object:nil];
    [self.view setBackgroundColor:RGBA(0, 0, 0, 1)];
    UIImage *bimg = [_FSImage.thimage getImage];
    [_imageview setImage:bimg];
    [_imageview setFrame:frame];
    [self.view setAlpha:0];
    [self.view addSubview:_imageview];
    [self detectOrientation:nil];
    [Animation ShowOrHideView:self.view to:1 During:.5 Action:@selector(AddCloseBtn) Target:self];
    [_delegate FullScreenDidAppear];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [autohide ShowHideView];
}

@end
