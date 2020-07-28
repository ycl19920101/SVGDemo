//
//  UIImage+SVGKit.h
//  SVGDemo
//
//  Created by Chunlin Yao on 2020/7/23.
//  Copyright © 2020 Chunlin Yao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (SVGKit)


//单纯加载svg图片
+(UIImage *)svgImageWithName:(NSString *)name imgV:(UIImageView *)imgV;

//加载svg图片 根据16进制色值改变颜色
+(UIImage *)svgImageWithName:(NSString *)name imgV:(UIImageView *)imgV hexColor:(NSString *)hexColor;

//加载svg图片 根据uicolor改变颜色
+(UIImage *)svgImageWithName:(NSString *)name imgV:(UIImageView *)imgV color:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
