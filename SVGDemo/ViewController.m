//
//  ViewController.m
//  SVGDemo
//
//  Created by Chunlin Yao on 2020/7/22.
//  Copyright © 2020 Chunlin Yao. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+SVGKit.h"
#import <WebKit/WebKit.h>
#import <SVGKit.h>
#import "UIButton+SVGKit.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //MARK:webview加载svg
    NSString *svgName = @"icon_sad.svg";
    NSData *svgData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:svgName ofType:nil]];
    NSString *reasourcePath = [[NSBundle mainBundle] resourcePath];
    NSURL *baseUrl = [[NSURL alloc] initFileURLWithPath:reasourcePath isDirectory:true];
    WKWebView *webView = [[WKWebView alloc] init];
    webView.frame = CGRectMake(0, 50, 100, 100);
    [webView loadData:svgData MIMEType:@"image/svg+xml" characterEncodingName:@"UTF-8" baseURL:baseUrl];
    [self.view addSubview:webView];
    
    //MARK:imageView加载svg
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(webView.frame), 100 , 100)];
    imageView.image = [UIImage svgImageWithName:@"icon_sad" imgV:imageView hexColor:@"#234567"];
    [self.view addSubview:imageView];
    
    //MARK:button加载svg
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(imageView.frame), 100, 100)];
    [btn svgButtonWithName:@"icon_sad" tintColor:[UIColor redColor] state:UIControlStateNormal];
    [self.view addSubview:btn];
    
    //MARK:SVGKFastImageView加载svg
    SVGKImage *svgImage = [SVGKImage imageNamed:@"success.svg"];
    SVGKFastImageView *fastImageView = [[SVGKFastImageView alloc] initWithSVGKImage:svgImage];
    fastImageView.frame = CGRectMake(0, CGRectGetMaxY(btn.frame), 100, 100);
    [self.view addSubview:fastImageView];
    
    //MARK:Label加载svg
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(0, CGRectGetMaxY(fastImageView.frame), 100, 100);
    label.font = [UIFont fontWithName:@"iconfont" size:100];
    label.text = @"\U0000e611";
    label.textColor = [UIColor cyanColor];
    [self.view addSubview:label];
    
}



@end
