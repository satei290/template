//
//  ViewController1.m
//  screenTransition
//
//  Created by ishikura keisuke on 2016/06/20.
//  Copyright © 2016年 ishikura keisuke. All rights reserved.
//

#import "ViewController1.h"
#import "ViewController2.h"

@implementation ViewController1

//- (IBAction)button1:(UIButton *)sender {
//    //[self performSegueWithIdentifier:@"toPage2" sender:self];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"str1:::%@",self.str1);
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"toPage2"]) {
        ViewController2 *viewController2 = [segue destinationViewController];
        viewController2.str2=@"１から２に渡す値";
        //NSLog(@"Page2に遷移する直前");
    }
}

- (IBAction)firstViewReActionForSegue:(UIStoryboardSegue *)segue
{
    if([segue.identifier isEqualToString:@"backToPage1"]){
        NSLog(@"str1:::%@",self.str1);
    }
}

@end
