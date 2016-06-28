//
//  XYLinkageTableViewController.h
//  XYLinkageTableViewController
//
//  Created by 罗显勇 on 16/6/27.
//  Copyright © 2016年 JetLuo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XYLinkageTableView;
@interface XYLinkageTableViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong,nonnull,readonly) XYLinkageTableView *linkageTableView;
@end
