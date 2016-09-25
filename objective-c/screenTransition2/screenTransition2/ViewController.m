//
//  ViewController.m
//  screenTransition2
//
//  Created by ishikura keisuke on 2016/06/22.
//  Copyright © 2016年 ishikura keisuke. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)go:(UIButton *)sender {
    ViewController2 *viewController2 = [self.storyboard instantiateViewControllerWithIdentifier:@"viewController2"];
    viewController2.v2 = @"from 1 to 2";
    [self.navigationController pushViewController:viewController2 animated:YES];
}

@end
