//
//  ViewController.h
//  ImageFullScreenMode
//
//  Created by chenlei on 12-2-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Thumbnails.h"
#import "ImageFullScreen.h"

@interface ViewController : UIViewController <ThumbnailsDelegate, ImageFullScreenDelegate>{
    ImageFullScreen *imageScreen;
    BOOL imageScreenShow;
}



@end
