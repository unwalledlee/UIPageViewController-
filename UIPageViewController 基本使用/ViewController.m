//
//  ViewController.m
//  UIPageViewController 基本使用
//
//  Created by 李瑜 on 16/9/9.
//  Copyright © 2016年 李瑜. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPageViewControllerDataSource,UIPageViewControllerDelegate>

@property (strong,nonatomic)UIPageViewController *pageVC;
@property (strong,nonatomic)NSMutableArray *pageArr;
@property (assign,nonatomic)NSInteger pageIndex;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupPageViewController];
    
    [self setupPageChildControllers];
    
    
}


- (void)setupPageViewController{
    
    self.pageVC = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    
    [self addChildViewController:self.pageVC];
    
    [self.view addSubview:self.pageVC.view];
    
    self.pageVC.view.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64);
    
    self.pageVC.dataSource = self;
    self.pageVC.delegate = self;
    
    
}


- (void)setupPageChildControllers{

    UIViewController * page1 = [[UIViewController alloc]init];
    page1.view.backgroundColor = [UIColor redColor];
    page1.title = @"page1";
    
    UIViewController * page2 = [[UIViewController alloc]init];
    page2.view.backgroundColor = [UIColor orangeColor];
    page2.title = @"page2";
    
    UIViewController * page3 = [[UIViewController alloc]init];
    page3.view.backgroundColor = [UIColor yellowColor];
    page3.title = @"page3";
    
    UIViewController * page4 = [[UIViewController alloc]init];
    page4.view.backgroundColor = [UIColor greenColor];
    page4.title = @"page4";
    
    UIViewController * page5 = [[UIViewController alloc]init];
    page5.view.backgroundColor = [UIColor cyanColor];
    page5.title = @"page5";
    
    self.pageArr  = [NSMutableArray arrayWithArray:@[page1,page2,page3,page4,page5]];
    
    [self.pageVC setViewControllers:[NSArray arrayWithObject:self.pageArr[0]]  direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:^(BOOL finished) {
        
    }];
    
}

#pragma mark - UIPageViewController代理
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    
    NSInteger index = [self.pageArr indexOfObject:viewController];
    index --;
    if ((index < 0) || (index == NSNotFound)) {
        //如果是0 就禁止移动
        return nil;
    }
    return self.pageArr[index];
    

}
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    
    NSInteger index = [self.pageArr indexOfObject:viewController];
    index ++;
    if (index == self.pageArr.count) {
        //如果是最后一张也禁止移动
        return nil;
    }
    return self.pageArr[index];

}


- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray<UIViewController *> *)pendingViewControllers{

//    NSLog(@"%@",pendingViewControllers[0].title);
}


- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed{

    if (completed) {
    
        NSLog(@"%@",previousViewControllers[0].title);
        
    }
}

@end
