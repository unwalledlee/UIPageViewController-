//
//  TableViewCell.h
//  UIPageViewController 基本使用
//
//  Created by 李瑜 on 16/9/9.
//  Copyright © 2016年 李瑜. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *editButton;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
