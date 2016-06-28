//
//  XYLinkageTableView.h
//  XYLinkageTableViewController
//
//  Created by 罗显勇 on 16/6/28.
//  Copyright © 2016年 JetLuo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYLinkageTableView : UIScrollView

@property(nonnull,nonatomic,strong,readonly) UITableView *mainTableView;
@property(nonnull,nonatomic,strong,readonly) UITableView *inferiorTableView;
@property(nonatomic) BOOL disableLoadingMore;//默认禁用上拉

- (void)settingWidthForMainTableView:(CGFloat)width;

@end
