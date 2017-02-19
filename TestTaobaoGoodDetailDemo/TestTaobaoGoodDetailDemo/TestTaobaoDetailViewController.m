//
//  TestTaobaoDetailViewController.m
//  TestTaobaoGoodDetailDemo
//
//  Created by LanFeng on 2017/2/19.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import "TestTaobaoDetailViewController.h"

@interface TestTaobaoDetailViewController ()
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIScrollView *firstSubScrollView;
@property (nonatomic, strong) UIScrollView *secondSubScrollView;
@property (nonatomic, strong) UIView *bottomView;
@end

@implementation TestTaobaoDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - getters and setters

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.backgroundColor = [UIColor grayColor];
        [_scrollView addSubview:self.firstSubScrollView];
        [_scrollView addSubview:self.secondSubScrollView];
        
        
    }
    return _scrollView;
}

- (UIScrollView *)firstSubScrollView {
    if (!_firstSubScrollView) {
        _firstSubScrollView = [[UIScrollView alloc] init];
        _firstSubScrollView.backgroundColor = [UIColor yellowColor];
    }
    return _firstSubScrollView;
}

- (UIScrollView *)secondSubScrollView {
    if (!_secondSubScrollView) {
        _secondSubScrollView = [[UIScrollView alloc] init];
        _secondSubScrollView.backgroundColor = [UIColor blueColor];
    }
    return _secondSubScrollView;
}

@end
