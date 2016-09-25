//
//  ViewController2.m
//  screenTransition
//
//  Created by ishikura keisuke on 2016/06/20.
//  Copyright © 2016年 ishikura keisuke. All rights reserved.
//

#import "ViewController2.h"
#import "ViewController1.h"
#import "ViewController3.h"

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"str2:::%@",self.str2);
}




-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"backToPage1"]) {
        ViewController1 *viewControllew1 = [segue destinationViewController];
        viewControllew1.str1= @"２から１に渡す値";
   //     NSLog(@"Page1に遷移する直前");
    } else if([[segue identifier] isEqualToString:@"toPage3"]){
        ViewController3 *viewControllew3 = [segue destinationViewController];
        viewControllew3.str3= @"２から３に渡す値";
        //     NSLog(@"Page3に遷移する直前");
    }
}


- (IBAction)secondViewReActionForSegue:(UIStoryboardSegue *)segue{
    if([segue.identifier isEqualToString:@"backToPage2"]){
       // NSLog(@"Second view return action invoked.");
    }
}
@end
