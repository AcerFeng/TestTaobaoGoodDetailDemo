//
//  TaobaoDetailViewController.m
//  TestTaobaoGoodDetailDemo
//
//  Created by LanFeng on 2017/2/20.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import "TaobaoDetailViewController.h"
#import "Masonry.h"

#define ScreenSize [UIScreen mainScreen].bounds.size

@interface TaobaoDetailViewController ()
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIScrollView *firstSubScrollView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *containerView;
@end

@implementation TaobaoDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.containerView];
    [self setupSubView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - private method
- (void)setupSubView {
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(64);
        make.left.right.bottom.equalTo(self.view);
    }];
    
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView);
        make.width.equalTo(self.scrollView);
    }];
}

#pragma mark - getters and setters

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.backgroundColor = [UIColor grayColor];
    }
    return _scrollView;
}

- (UIScrollView *)firstSubScrollView {
    if (!_firstSubScrollView) {
        _firstSubScrollView = [[UIScrollView alloc] init];
        _firstSubScrollView.backgroundColor = [UIColor yellowColor];
        
        UIView *testView1 = [[UIView alloc] init];
        testView1.backgroundColor = [UIColor whiteColor];
        [_firstSubScrollView addSubview:testView1];
        
        [testView1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_firstSubScrollView).offset(3);
            make.top.equalTo(_firstSubScrollView).offset(10);
            make.width.equalTo(@100);
            make.right.equalTo(_firstSubScrollView.mas_right).offset(-20);
            make.height.equalTo(@200);
            
        }];
        
        UIView *testView2 = [[UIView alloc] init];
        testView2.backgroundColor = [UIColor orangeColor];
        [_firstSubScrollView addSubview:testView2];
        
        [testView2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_firstSubScrollView);
            make.top.equalTo(testView1.mas_bottom).offset(400);
            make.width.equalTo(@300);
            make.height.equalTo(@200);
            make.bottom.equalTo(_firstSubScrollView);
        }];
    }
    return _firstSubScrollView;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
    }
    return _tableView;
}

- (UIView *)containerView {
    if (!_containerView) {
        _containerView = [[UIView alloc] init];
        UIView *testView1 = [[UIView alloc] init];
        testView1.backgroundColor = [UIColor whiteColor];
        [_containerView addSubview:testView1];
        
        [testView1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_containerView).offset(3);
            make.top.equalTo(_containerView).offset(10);
            make.width.equalTo(@100);
//            make.right.equalTo(_containerView.mas_right).offset(-20);
            make.height.equalTo(@200);
            
        }];
        
        UIView *testView2 = [[UIView alloc] init];
        testView2.backgroundColor = [UIColor orangeColor];
        [_containerView addSubview:testView2];
        
        [testView2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_containerView);
            make.top.equalTo(testView1.mas_bottom).offset(400);
            make.width.equalTo(@300);
            make.height.equalTo(@200);
            make.bottom.equalTo(_containerView);
        }];
    }
    return _containerView;
}

@end
