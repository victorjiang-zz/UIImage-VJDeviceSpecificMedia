//
//  UIImage+VJDeviceSpecialMedia.m
//  VJUIImageDeviceSpecificMedia
//
//  Created by Victor Jiang on 3/3/15.
//  Copyright (c) 2015 Victor Jiang. All rights reserved.
//

#import "UIImage+VJDeviceSpecialMedia.h"

VJDeviceClass VJ_CurrentDeviceClass()
{
    CGFloat greaterPixelDimension = fmaxf([[UIScreen mainScreen] bounds].size.height, [[UIScreen mainScreen] bounds].size.width);
    switch ((NSInteger)greaterPixelDimension) {
        case 480:
            return ([[UIScreen mainScreen] scale] > 1.0) ? VJDeviceClass_iPhoneRetina : VJDeviceClass_iPhone;
            break;
        case 568:
            return VJDeviceClass_iPhone5;
            break;
        case 667:
            return VJDeviceClass_iPhone6;
            break;
        case 736:
            return VJDeviceClass_iPhone6plus;
            break;
        case 1024:
            return ([[UIScreen mainScreen] scale] > 1.0) ? VJDeviceClass_iPadRetina : VJDeviceClass_iPad;
            break;
        default:
            return VJDeviceClass_unKnown;
            break;
    }
}


@implementation UIImage (VJDeviceSpecialMedia)

+ (instancetype)imageForDeviceWithName:(NSString *)imageName
{
    return [UIImage imageForDeviceWithName:imageName type:@"png"];
}

+ (instancetype)imageForDeviceWithName:(NSString *)imageName type:(NSString *)type
{
    NSString *suffixString;
    switch (VJ_CurrentDeviceClass()) {
        case VJDeviceClass_iPhone:
            suffixString = @"";
            break;
        case VJDeviceClass_iPhoneRetina:
            suffixString = @"@2x";
            break;
        case VJDeviceClass_iPhone5:
            suffixString = @"-568h@2x";
            break;
        case VJDeviceClass_iPhone6:
            suffixString = @"-667h@2x";
            break;
        case VJDeviceClass_iPhone6plus:
            suffixString = @"-736h@3x";
            break;
        case VJDeviceClass_iPad:
            suffixString = @"~ipad";
            break;
        case VJDeviceClass_iPadRetina:
            suffixString = @"~ipad@2x";
            break;
        case VJDeviceClass_unKnown:
        default:
            suffixString = @"";
            break;
    }
    
    UIImage *image = nil;
    NSString *imageFullName = [imageName stringByAppendingString:suffixString];
    
    // if type is not png, imageFullName & imageName will append the suffix of type
    if (![[type lowercaseString] isEqualToString:@"png"]) {
        imageFullName = [[imageFullName stringByAppendingString:@"."] stringByAppendingString:type];
        imageName = [[imageName stringByAppendingString:@"."] stringByAppendingString:type];
    }
    
    image = [UIImage imageNamed:imageFullName];
    
    if (!image) {
        image = [UIImage imageNamed:imageName];
    }
    
    return image;
}



@end
