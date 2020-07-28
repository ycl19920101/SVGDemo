//
//  UIButton+SVGKit.h
//  ShanQi
//
//  Created by Chunlin Yao on 2020/7/24.
//  Copyright © 2020 Shanqi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN




@interface UIButton (SVGKit)

- (void)svgButtonWithName:(NSString *)name tintColor:(UIColor *)tintColor state:(UIControlState)state;

@end

NS_ASSUME_NONNULL_END
