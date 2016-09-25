//
//  ViewController2.m
//  screenTransition2
//
//  Created by ishikura keisuke on 2016/06/22.
//  Copyright © 2016年 ishikura keisuke. All rights reserved.
//

#import "ViewController2.h"
#import "ViewController3.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"v2:::%@",self.v2);
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)back:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)go:(UIButton *)sender {
    ViewController3 *viewController3 = [self.storyboard instantiateViewControllerWithIdentifier:@"viewController3"];
    [self.navigationController pushViewController:viewController3 animated:YES];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
