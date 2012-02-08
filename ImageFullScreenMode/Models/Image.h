//
//  Image.h
//  ImageFullScreenMode
//
//  Created by chenlei on 12-2-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Image : NSObject {
    NSString *imagename;
    NSString *imageid;
    NSData *imgdata;
    NSString *catname;
    NSString *catid;
    NSString *imgurl;
}
@property (nonatomic, retain)  NSString *imagename;
@property (nonatomic, retain)  NSString *imageid;
@property (nonatomic, retain)  NSData *imgdata;
@property (nonatomic, retain)  NSString *catname;
@property (nonatomic, retain)  NSString *catid;
@property (nonatomic, retain)  NSString *imgurl;


- (UIImage *)cutImage;
- (UIImage *)getImage;



@end
