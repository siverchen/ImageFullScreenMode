//
//  Animation.h
//  //  MusicBox V1.0.0
//
//  Created by ruby siver on 11-11-17.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Animation : NSObject


+(void)MoveView:(UIView *)view To:(CGRect)frame During:(float)time Hide:(BOOL)hide Action:(SEL)action Target:(id)target;

+ (void)ShowOrHideView:(UIView *)view to:(CGFloat)alpha During:(CGFloat)time Action:(SEL)action Target:(id)target;

@end
