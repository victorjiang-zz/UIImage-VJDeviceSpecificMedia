//
//  UIImage+VJDeviceSpecialMedia.h
//  VJUIImageDeviceSpecificMedia
//
//  Created by Victor Jiang on 3/3/15.
//  Copyright (c) 2015 Victor Jiang. All rights reserved.
//

#import <UIKit/UIKit.h>

// VJDeviceClass enum
typedef NS_ENUM(NSInteger, VJDeviceClass) {
    // iPhone
    VJDeviceClass_iPhone,
    VJDeviceClass_iPhoneRetina,
    VJDeviceClass_iPhone5,
    VJDeviceClass_iPhone6,
    VJDeviceClass_iPhone6plus,
    
    // iPad
    VJDeviceClass_iPad,
    VJDeviceClass_iPadRetina,
    
    // unKnown
    VJDeviceClass_unKnown
};

// get the current device class
VJDeviceClass VJ_CurrentDeviceClass();

@interface UIImage (VJDeviceSpecialMedia)

// imageName without suffix, image's type default is PNG
+ (instancetype)vj_imageForDeviceWithName:(NSString *)imageName;
// specify the image's type
+ (instancetype)vj_imageForDeviceWithName:(NSString *)imageName type:(NSString *)type;

@end
