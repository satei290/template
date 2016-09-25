//
//  ViewController.m
//  tableView
//
//  Created by ishikura keisuke on 2016/09/11.
//  Copyright © 2016年 ishikura keisuke. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>{

    NSArray *_dataArray;
    NSTimer *_tmDel;
    NSTimer *_tmIns;
    NSInteger _numberOfRows;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    _dataArray = @[@"a",@"b",@"c",@"d",@"e"];
    _numberOfRows = [_dataArray count];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    _tmDel = [NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(doDeleteCell:) userInfo:nil repeats:NO];

    _tmIns = [NSTimer scheduledTimerWithTimeInterval:4.0f target:self selector:@selector(doInsertCell:) userInfo:nil repeats:NO];

}


- (void)doDeleteCell:(NSTimer *)timer{
    _numberOfRows = _numberOfRows - 1;
    NSArray *deleteIndexPaths = [NSArray arrayWithObjects:
                                 [NSIndexPath indexPathForRow:2 inSection:0],
                                 nil];
    [_tableView deleteRowsAtIndexPaths:deleteIndexPaths
                          withRowAnimation:UITableViewRowAnimationFade];
    [_tmDel invalidate];
}

- (void)doInsertCell:(NSTimer *)timer{
    _numberOfRows = _numberOfRows + 1;
    NSArray *insertIndexPaths = [NSArray arrayWithObjects:
                                 [NSIndexPath indexPathForRow:2 inSection:0],
                                 nil];
    [_tableView insertRowsAtIndexPaths:insertIndexPaths
                      withRowAnimation:UITableViewRowAnimationFade];
    [_tmIns invalidate];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _numberOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifer = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifer forIndexPath:indexPath];
    cell.textLabel.text = _dataArray[indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
