//
//  ViewController.m
//  screenTransition3
//
//  Created by ishikura keisuke on 2016/06/22.
//  Copyright © 2016年 ishikura keisuke. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.dataSource1 = @[@"あ",@"い",@"う",@"え",@"お",@"あ2",@"い2",@"う2",@"え2",@"お2"];
    self.dataSource2 = @[@"か",@"き",@"く",@"け",@"こ"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger dataCount;
    switch (section) {
        case 0:
            dataCount = self.dataSource1.count;
            break;
        case 1:
            dataCount = self.dataSource2.count;
            break;
        default:
            break;
    }
    return  dataCount;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdenTifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdenTifier];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdenTifier];
    }
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text = self.dataSource1[indexPath.row];
            break;
        case 1:
            cell.textLabel.text = self.dataSource2[indexPath.row];
            break;
        default:
            break;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath: (NSIndexPath*) indexPath{
    // toVc
    [self performSegueWithIdentifier:@"toVc" sender:self];
}

- (IBAction)firstViewReActionForSegue:(UIStoryboardSegue *)segue
{

}


@end
