//
//  EditController.h
//  UIPageViewController 基本使用
//
//  Created by 李瑜 on 16/9/9.
//  Copyright © 2016年 李瑜. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditController : UITableViewController

@property (nonatomic,strong)NSMutableArray * currentVC;

@property (nonatomic,strong)NSMutableArray * totalVC;

@property (nonatomic,copy) void (^block)(NSArray * currentVC,NSArray * moreVC);

@end
