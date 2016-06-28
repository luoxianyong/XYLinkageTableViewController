//
//  DemoViewController.m
//  XYLinkageTableViewController
//
//  Created by 罗显勇 on 16/6/28.
//  Copyright © 2016年 JetLuo. All rights reserved.
//

#import "DemoViewController.h"
#import "XYLinkageTableView.h"

@interface DemoViewController ()
@property(nullable,nonatomic,strong) NSMutableDictionary *dictData;
@property(nullable,nonatomic,strong) NSMutableArray *keys;
@property(nonatomic) NSInteger indexOfMain;
@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"下拉刷新";
    [self loadingData];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"开启上拉" style:UIBarButtonItemStylePlain target:self action:@selector(openLoadingMore:)];
}
- (void)openLoadingMore:(UIBarButtonItem *)sender {
    self.linkageTableView.disableLoadingMore = !self.linkageTableView.disableLoadingMore;
    [sender setTitle:(!self.linkageTableView.disableLoadingMore ? @"关闭上拉" : @"开启上拉")];
}
- (void)loadingData {
    self.dictData = [[NSMutableDictionary alloc] initWithCapacity:6];
    self.keys = [[NSMutableArray alloc] initWithCapacity:6];
    for(int i=0;i<16;i++) {
        NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:30];
        for(int j=0;j<50;j++) {
            [array addObject:[NSString stringWithFormat:@"第%i模块_第%i行",i,j]];
        }
        [self.dictData setValue:array forKey:[NSString stringWithFormat:@"%i",i]];
        [self.keys addObject:[NSString stringWithFormat:@"%i",i]];
    }
    [self.linkageTableView.mainTableView reloadData];
}

#pragma mark - UITableViewDelegate,UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(self.linkageTableView.mainTableView == tableView) {
        return self.dictData.count;
    } else {
        NSArray *values = [self.dictData valueForKey:self.keys[self.indexOfMain]];
        return values.count;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(self.linkageTableView.mainTableView == tableView) {
        static NSString *identifierMain = @"CellMain";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierMain];
        if(cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierMain];
        }
        cell.textLabel.text = self.keys[indexPath.row];
        return cell;
    } else {
        static NSString *identifierInferior = @"CellInferior";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierInferior];
        if(cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierInferior];
        }
        NSArray *values = [self.dictData valueForKey:self.keys[self.indexOfMain]];
        cell.textLabel.text = [values objectAtIndex:indexPath.row];
        return cell;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if(tableView == self.linkageTableView.mainTableView) {
        if(self.indexOfMain != indexPath.row) {
            self.indexOfMain = indexPath.row;
            [self.linkageTableView.inferiorTableView setContentOffset:CGPointZero];
            [self.linkageTableView.inferiorTableView reloadData];
        }
    }
}

@end
