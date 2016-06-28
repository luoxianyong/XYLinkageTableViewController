//
//  XYLinkageTableViewController.m
//  XYLinkageTableViewController
//
//  Created by 罗显勇 on 16/6/27.
//  Copyright © 2016年 JetLuo. All rights reserved.
//

#import "XYLinkageTableViewController.h"
#import "XYLinkageTableView.h"
#import "Masonry.h"

@interface XYLinkageTableViewController()
@end

@implementation XYLinkageTableViewController

- (void)loadView {
    [super loadView];
    _linkageTableView = [[XYLinkageTableView alloc] init];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.linkageTableView];
    __weak typeof(self) weakself = self;
    [self.linkageTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakself.view);
    }];
    self.linkageTableView.mainTableView.delegate   = self;
    self.linkageTableView.mainTableView.dataSource = self;
    self.linkageTableView.inferiorTableView.delegate = self;
    self.linkageTableView.inferiorTableView.dataSource = self;
}
#pragma mark - UITableViewDelegate,UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 0;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end





