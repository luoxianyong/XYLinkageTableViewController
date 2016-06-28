//
//  XYLinkageTableView.m
//  XYLinkageTableViewController
//
//  Created by 罗显勇 on 16/6/28.
//  Copyright © 2016年 JetLuo. All rights reserved.
//

#import "XYLinkageTableView.h"
#import "Masonry.h"

@interface XYLinkageTableView ()<UIScrollViewDelegate>
@property (nonnull,nonatomic,strong) UIView *contentView;
@end

@implementation XYLinkageTableView

- (instancetype)init {
    if(self = [super init]) {
        self.delegate = self;
        self.backgroundColor = [UIColor whiteColor];
        self.disableLoadingMore = YES;
        _contentView = [[UIView alloc] init];
        self.contentView.backgroundColor = [UIColor whiteColor];
        _mainTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _inferiorTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        [self addSubview:_contentView];
        [_contentView addSubview:self.mainTableView];
        [_contentView addSubview:self.inferiorTableView];
        
        __weak typeof(self) weakself = self;
        [self.mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(0);
            make.width.mas_equalTo(120);
            make.height.equalTo(weakself.mas_height);
        }];
        [self.inferiorTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.height.equalTo(weakself.mas_height);
            make.left.equalTo(weakself.mainTableView.mas_right);
            make.right.equalTo(weakself.contentView.mas_right);
        }];
        [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(weakself);
            make.width.equalTo(weakself);
        }];
        [self settingWidthForMainTableView:120];
        [self.contentView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(weakself.mainTableView.mas_bottom);
        }];
        
        self.mainTableView.bounces = NO;
        self.mainTableView.showsVerticalScrollIndicator = NO;
        self.mainTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        self.inferiorTableView.bounces = NO;
        self.inferiorTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        
    }
    return self;
}

- (void)settingWidthForMainTableView:(CGFloat)width {
    [self.mainTableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(width);
    }];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if(self.disableLoadingMore && scrollView.contentOffset.y > 0) {
        scrollView.bounces = NO;
    }
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self scrollViewStopDragging:scrollView];
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if(!decelerate){
        [self scrollViewStopDragging:scrollView];
    }
}
- (void)scrollViewStopDragging:(UIScrollView *)scrollView {
    scrollView.bounces = YES;
}

@end




























