//
//  Animation.m
//  //  MusicBox V1.0.0
//
//  Created by ruby siver on 11-11-17.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "Animation.h"

@implementation Animation

+(void)MoveView:(UIView *)view To:(CGRect)frame During:(float)time Hide:(BOOL)hide Action:(SEL)action Target:(id)target{
    // 动画开始
    [UIView beginAnimations:nil context:nil];
    // 动画时间曲线 EaseInOut效果
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut]; 
    // 动画时间
    [UIView setAnimationDuration:time];
    [UIView setAnimationDidStopSelector:action];
    [UIView setAnimationDelegate:target];
    view.frame = frame;
    // 动画结束（或者用提交也不错）
    [UIView commitAnimations];
}
+ (void)ShowOrHideView:(UIView *)view to:(CGFloat)alpha During:(CGFloat)time Action:(SEL)action Target:(id)target{
    // 动画开始
    [UIView beginAnimations:nil context:nil];
    // 动画时间曲线 EaseInOut效果
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut]; 
    // 动画时间
    [UIView setAnimationDuration:time];
    view.alpha = alpha;
    
    
    [UIView setAnimationDidStopSelector:action];
    [UIView setAnimationDelegate:target];
    
    
    // 动画结束（或者用提交也不错）
    [UIView commitAnimations];
}

@end
