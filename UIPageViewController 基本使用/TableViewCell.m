//
//  TableViewCell.m
//  UIPageViewController 基本使用
//
//  Created by 李瑜 on 16/9/9.
//  Copyright © 2016年 李瑜. All rights reserved.
//

#import "TableViewCell.h"

@interface TableViewCell ()


@end

@implementation TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self = [[[NSBundle mainBundle]loadNibNamed:@"TableViewCell" owner:nil options:nil]firstObject];
    }
    
    return self;
}




- (void)awakeFromNib {
    
    
    self.editButton.layer.borderWidth = 1;
    
    self.editButton.layer.cornerRadius = 3;
    
    self.editButton.layer.borderColor = [UIColor blackColor].CGColor;
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
