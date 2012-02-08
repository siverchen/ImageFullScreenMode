//
//  AutoHide.m
//  ImageFullScreenMode
//
//  Created by chenlei on 12-2-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AutoHide.h"


@implementation AutoHide

@synthesize status = _status, AutoHideViewQueue = _autohideviewqueue, delegate = _delegate, cancel = _cancel;




- (void)dealloc{
    [AutoHideViewQueue release];
    [super dealloc];
}

- (void)ReadyToHideView{
    if (ViewIsShowed == status){//如果是已经完全出现 准备消失
        status = ViewWillHide;
        [_delegate AutoHideViewWillHide];
        [self performSelector:@selector(ViewAlphaToHide) withObject:nil afterDelay:hidetime];
    }
}

- (void)RemoveAnimation{
    [NSRunLoop cancelPreviousPerformRequestsWithTarget:self];
}

- (id)initAutoHideViews:(NSArray *)views WithHideTime:(NSTimeInterval)htime FromNowOn:(BOOL)on{
    if (self = [super init]){
        if (!_autohideviewqueue){
           _autohideviewqueue = [[NSArray alloc] initWithArray: views];
        }
        hidetime = htime;
        if (on){
            [self ReadyToHideView];
        }
    }
    return self;
}


- (void)ViewAlphaToShow{
    status = ViewIsShowing;
    [_delegate AutoHideViewisHiding];
    static int i = 0;
    for (id view in _autohideviewqueue){
        if ([view isKindOfClass:[NSString class]]){
            if ([view isEqualToString:StatusBar]){
                [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
            }
            i++;
        }else{
            [UIView animateWithDuration:alphatime
                         animations:^{((UIView *)view).alpha = 1.0;}
                         completion:^(BOOL finished){ 
                             i++;
                             if (i % [_autohideviewqueue count] == 0 && i != 0){
                                 [_delegate AutoHideViewisShowed];
                                 status = ViewIsShowed;
                                 [self ReadyToHideView];
                                 i = 0;
                             }
                         }];               
        }
    }
}

- (void)ViewAlphaToHide{
    status = ViewIsHiding;
    [_delegate AutoHideViewisHiding];
    static int i = 0;
    for (id view in _autohideviewqueue){
        if ([view isKindOfClass:[NSString class]]){
            if ([view isEqualToString:StatusBar]){
                [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
            }i++;
        }else{
            [UIView animateWithDuration:alphatime
                             animations:^{((UIView *)view).alpha = 0.0;}
                             completion:^(BOOL finished){
                                 i++;
                                 if (i % [_autohideviewqueue count] == 0 && i != 0){
                                     status = ViewIsHidden;
                                     [_delegate AutoHideViewisHidden];
                                     i = 0;
                                 }
                             }];
        }
    }
}



- (void)ShowHideView{
    if (ViewWillHide == status){
        [NSRunLoop cancelPreviousPerformRequestsWithTarget:self];
    }
    [self performSelector:@selector(ViewAlphaToShow)];
}



@end
