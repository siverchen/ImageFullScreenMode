//
//  UIImage+SizeControl.h
//  MusicBox
//
//  Created by ruby siver on 12-1-10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SizeControl)

- (UIImage *)cutImageWithFrame:(CGRect)frame;
- (UIImage *)scaledToSize:(CGSize)newSize;
- (UIImage *)InsertNewImageWithSize:(CGSize)size Image:(UIImage *)img Frame:(CGRect)frame;
@end
