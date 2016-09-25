//
//  ViewController.h
//  WKWebView1
//
//  Created by ishikura keisuke on 2016/06/24.
//  Copyright © 2016年 ishikura keisuke. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import <WebKit/WebKit.h>
@import WebKit;

@interface ViewController : UIViewController

@property (strong, nonatomic) WKWebView *webView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *forwardButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *reloadButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *stopButton;

@end

