//
//  AutoHide.h
//  ImageFullScreenMode
//
//  Created by chenlei on 12-2-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define alphatime .3
#define StatusBar @"AutoHideStatusBar"

typedef enum {
    ViewIsShowed    ,
    ViewWillHide    ,
    ViewIsHiding    ,
    ViewIsHidden    ,
    ViewWillShow    ,
    ViewIsShowing   ,
} AutoHideViewStatus;

typedef enum {
    Normal  ,
    CancelShow  ,
    CancelHide  
} CancelType;






@protocol AutoHideDelegate;

@interface AutoHide : NSObject {

@private
    AutoHideViewStatus status;
    CancelType cancel;
    NSArray *AutoHideViewQueue;
    NSTimeInterval showtime;
    NSTimeInterval hidetime;
    id <AutoHideDelegate> delegate;
}
@property (readonly , nonatomic) AutoHideViewStatus status;
@property (readonly , nonatomic) CancelType cancel;
@property (nonatomic, retain) NSArray *AutoHideViewQueue;;
@property (nonatomic, assign) id <AutoHideDelegate> delegate;

- (id)initAutoHideViews:(NSArray *)views WithHideTime:(NSTimeInterval)htime FromNowOn:(BOOL)on;
- (void)ShowHideView;
- (void)RemoveAnimation;
- (void)ViewAlphaToHide;

@end

@protocol AutoHideDelegate

@optional

- (void)AutoHideViewWillHide;
- (void)AutoHideViewisHiding;
- (void)AutoHideViewisHidden;
- (void)AutoHideViewWillShow;
- (void)AutoHideViewisShowing;
- (void)AutoHideViewisShowed;

@end