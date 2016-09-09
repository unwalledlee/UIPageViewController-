//
//  EditController.m
//  UIPageViewController 基本使用
//
//  Created by 李瑜 on 16/9/9.
//  Copyright © 2016年 李瑜. All rights reserved.
//

#import "EditController.h"
#import "TableViewCell.h"

@interface EditController ()

@property (nonatomic,strong)NSMutableArray * moreVC;

@end

@implementation EditController

- (NSMutableArray *)moreVC
{
    if (_moreVC == nil) {
        _moreVC = [NSMutableArray array];
    }
    
    return _moreVC;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (UIViewController * vc in self.totalVC) {
        
        if(! [self.currentVC containsObject:vc])  {
            
            [self.moreVC addObject:vc];
            
        }
    }
    
    [self.tableView reloadData];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)editButtonClick:(UIButton *)sender{

    if ([sender.currentTitle isEqualToString:@"添加"]) {
        
        UIViewController * vc = self.moreVC[sender.tag];
        
        [self.currentVC addObject: vc];
        [self.moreVC removeObjectAtIndex:sender.tag];
        
        //重新绑定tag，使tag的值与cell的行数保持一致
        sender.tag = [self.currentVC indexOfObject:vc];

    }else{
    
        UIViewController * vc = self.currentVC[sender.tag];
        
        [self.moreVC addObject: vc];
        [self.currentVC removeObjectAtIndex:sender.tag];
        
        //重新绑定tag，使tag的值与cell的行数保持一致
        sender.tag = [self.moreVC indexOfObject:vc];
        
        
    }
    
    [self.tableView reloadData];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section == 0) {
        
        if (self.currentVC.count == 0) {
            return 1;
        }
        
        return self.currentVC.count;
        
    }else
        
        return self.moreVC.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 
    NSString * ID = @"cell";
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        
        cell = [[TableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    if (indexPath.section == 0) {
        
        if (self.currentVC.count == 0) {
            
            
            cell.titleLabel.text = @"点击下方添加模块";
            
            cell.editButton.hidden = YES;
            
            return cell;
            
        }
        
        [cell.editButton setTitle:@"移除" forState:UIControlStateNormal];
        
        cell.editButton.hidden = NO;

        UIViewController * vc = self.currentVC[indexPath.row];
        
        cell.titleLabel.text = vc.title;
        
        
    }else{
        
        UIViewController * vc = self.moreVC[indexPath.row];
        
        cell.titleLabel.text = vc.title;
        
        [cell.editButton setTitle:@"添加" forState:UIControlStateNormal];
        
    }
    
    cell.editButton.tag = indexPath.row;
    
    [cell.editButton addTarget:self action:@selector(editButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    return cell;
}


- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{

    if (section == 0) {
        
        return @"我的模块";
        
    }else
        return @"更多模块";
}





- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    if (self.block) {
        
        self.block(self.currentVC,self.moreVC);
    }
    
    
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
