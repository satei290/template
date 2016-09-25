//
//  ViewController.h
//  screenTransition3
//
//  Created by ishikura keisuke on 2016/06/22.
//  Copyright © 2016年 ishikura keisuke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *dataSource1;
@property (nonatomic, strong) NSArray *dataSource2;

@end

