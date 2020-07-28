//
//  UIImage+SVGKit.m
//  SVGDemo
//
//  Created by Chunlin Yao on 2020/7/23.
//  Copyright © 2020 Chunlin Yao. All rights reserved.
//

#import "UIImage+SVGKit.h"
#import <SVGKit.h>

#define kSkinLayer @"skinLayer"

@implementation UIImage (SVGKit)

+(UIImage *)svgImageWithName:(NSString *)name imgV:(UIImageView *)imgV {
    
    return [self name:name imgV:imgV].UIImage;
}


+(UIImage *)svgImageWithName:(NSString *)name imgV:(UIImageView *)imgV hexColor:(NSString *)hexColor {
    
    UIColor *color = [self colorWithHexString:hexColor];
    
    return [self name:name imgV:imgV tintColor:color];
}

+ (UIImage *)svgImageWithName:(NSString *)name imgV:(UIImageView *)imgV color:(UIColor *)color {
    
    return [self name:name imgV:imgV tintColor:color];
}


+(SVGKImage *)name:(NSString *)name imgV:(UIImageView *)imgV {
    
    SVGKImage *svgImage = [SVGKImage imageNamed:[NSString stringWithFormat:@"%@.svg",name]];
    if (imgV.bounds.size.width != 0 && imgV.bounds.size.height != 0) {svgImage.size = imgV.bounds.size;}
    
    //
//    svgImage.size = CGSizeMake(20, 20);
    
    
    return svgImage;
}

+(UIImage *)name:(NSString *)name imgV:(UIImageView *)imgV tintColor:(UIColor *)tintColor {
    
    SVGKImage *svgImage = [self name:name imgV:imgV];
    
    CALayer * layer = [svgImage layerWithIdentifier:kSkinLayer];
    
    if ([layer isKindOfClass:[CALayerWithChildHitTest class]]) {

        CALayerWithChildHitTest *childLayer = (CALayerWithChildHitTest *)layer;

        for (CALayer *layer in  childLayer.sublayers) {

            if ([layer isKindOfClass:[CAShapeLayerWithHitTest class]]) {

                CAShapeLayerWithHitTest *shapeLayer = (CAShapeLayerWithHitTest *)layer;

                shapeLayer.fillColor = tintColor.CGColor;
            }
        }
    }
    
    else if ([layer isKindOfClass:[CAShapeLayerWithHitTest class]]) {
        
        CAShapeLayerWithHitTest *shapeLayer = (CAShapeLayerWithHitTest *)layer;
        
        shapeLayer.fillColor = tintColor.CGColor;
    }
    
    SVGKLayeredImageView * icon = [[SVGKLayeredImageView alloc] initWithSVGKImage:svgImage];
    return icon.image.UIImage;
    
}

#pragma mark - 16进制色值转化
+(UIColor *)colorWithHexString:(NSString *)color {
    
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    
// String should be 6 or 8 characters

    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
// 判断前缀

    if ([cString hasPrefix:@"0X"])
    cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
    cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
    return [UIColor clearColor];
    
// 从六位数值中找到RGB对应的位数并转换

    NSRange range;
    range.location = 0;
    range.length = 2;
    
//R、G、B

    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
// Scan values

    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
    
}


@end
