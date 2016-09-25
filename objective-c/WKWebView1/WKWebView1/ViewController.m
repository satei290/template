//
//  ViewController.m
//  WKWebView1
//
//  Created by ishikura keisuke on 2016/06/24.
//  Copyright © 2016年 ishikura keisuke. All rights reserved.
//

#import "ViewController.h"
#import <SGNavigationProgress/UINavigationController+SGProgress.h>

@interface ViewController ()<WKNavigationDelegate>

@end

@implementation ViewController

static NSString *const InitialURL = @"https://www.amazon.co.jp/";

-(void)loadView{
    NSLog(@"loadView");
    [super loadView];
    self.webView = [[WKWebView alloc] init];
    self.webView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraints:@[
                                [NSLayoutConstraint constraintWithItem:self.webView
                                                             attribute:NSLayoutAttributeWidth
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:NSLayoutAttributeWidth
                                                            multiplier:1.0
                                                              constant:0],
                                [NSLayoutConstraint constraintWithItem:self.webView
                                                             attribute:NSLayoutAttributeHeight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:NSLayoutAttributeHeight
                                                                multiplier:1.0
                                                                  constant:0]
                                    ]];
    self.webView.navigationDelegate = self;
    self.webView.allowsBackForwardNavigationGestures = YES;
    [self.view insertSubview:self.webView atIndex:0];
}

- (void)viewDidLoad {
    NSLog(@"viewDidLoad");
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    [self.webView addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:nil];
    [self.webView addObserver:self forKeyPath:@"loading" options:NSKeyValueObservingOptionNew context:nil];
    [self.webView addObserver:self forKeyPath:@"canGoBack" options:NSKeyValueObservingOptionNew context:nil];
    [self.webView addObserver:self forKeyPath:@"canGoForword" options:NSKeyValueObservingOptionNew context:nil];

    NSURL *url = [NSURL URLWithString:InitialURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)webView:(WKWebView *)webView
didStartProvisionalNavigation:(WKNavigation *)navigation{
    NSLog(@"didStartProvisionalNavigation:::%@",navigation);
}

- (void)webView:(WKWebView *)webView
didCommitNavigation:(WKNavigation *)navigation{
    NSLog(@"didCommitNavigation:::%@",navigation);
}

- (void)webView:(WKWebView *)webView
didFinishNavigation:(WKNavigation *)navigation{
    NSLog(@"didFinishNavigation:::%@",navigation);
}

- (void)dealloc {
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
    [self.webView removeObserver:self forKeyPath:@"title"];
    [self.webView removeObserver:self forKeyPath:@"loading"];
    [self.webView removeObserver:self forKeyPath:@"canGoBack"];
    [self.webView removeObserver:self forKeyPath:@"canGoForword"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    NSLog(@"observeValueForKeyPath");
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        // estimatedProgressが変更されたら、プログレスバーを更新する
        [self.navigationController setSGProgressPercentage:self.webView.estimatedProgress * 100.0f];
    } else if ([keyPath isEqualToString:@"title"]) {
        // titleが変更されたら、ナビゲーションバーのタイトルを設定する
        self.title = self.webView.title;
    } else if ([keyPath isEqualToString:@"loading"]) {
        // loadingが変更されたら、ステータスバーのインジケーターの表示・非表示を切り替える
        [UIApplication sharedApplication].networkActivityIndicatorVisible = self.webView.loading;
        
        // リロードボタンと読み込み停止ボタンの有効・無効を切り替える
        self.reloadButton.enabled = !self.webView.loading;
        self.stopButton.enabled = self.webView.loading;
    } else if ([keyPath isEqualToString:@"canGoBack"]) {
        // canGoBackが変更されたら、「＜」ボタンの有効・無効を切り替える
        self.backButton.enabled = self.webView.canGoBack;
    } else if ([keyPath isEqualToString:@"canGoForward"]) {
        // canGoForwardが変更されたら、「＞」ボタンの有効・無効を切り替える
        self.forwardButton.enabled = self.webView.canGoForward;
    }
}
- (IBAction)doBack:(id)sender {
    [self.webView goBack];
}

- (IBAction)goFw:(id)sender {
    [self.webView goForward];
}

- (IBAction)doReload:(id)sender {
    [self.webView reload];
}

- (IBAction)doStop:(id)sender {
    [self.webView stopLoading];
}

@end
