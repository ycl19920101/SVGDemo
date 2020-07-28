//
//  UIButton+SVGKit.m
//  ShanQi
//
//  Created by Chunlin Yao on 2020/7/24.
//  Copyright © 2020 Shanqi. All rights reserved.
//

#import "UIButton+SVGKit.h"
#import "UIImage+SVGKit.h"

@implementation UIButton (SVGKit)

- (void)svgButtonWithName:(NSString *)name tintColor:(UIColor *)tintColor state:(UIControlState)state{
    
    [self setImage:[UIImage svgImageWithName:name imgV:self.imageView color:tintColor] forState:state];
}

@end
