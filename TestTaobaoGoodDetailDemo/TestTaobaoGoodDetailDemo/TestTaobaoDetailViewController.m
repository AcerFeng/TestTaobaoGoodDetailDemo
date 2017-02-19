//
//  TestTaobaoDetailViewController.m
//  TestTaobaoGoodDetailDemo
//
//  Created by LanFeng on 2017/2/19.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import "TestTaobaoDetailViewController.h"
#import "TestScrollVew.h"
#import "Masonry.h"

#define ScreenSize [UIScreen mainScreen].bounds.size

@interface TestTaobaoDetailViewController ()
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIScrollView *firstSubScrollView;
@property (nonatomic, strong) UIScrollView *secondSubScrollView;
@property (nonatomic, strong) UIView *bottomView;

@property (nonatomic, strong) TestScrollVew *mainScrollView;
@property (nonatomic, strong) TestScrollVew *firstScrollView;
@property (nonatomic, strong) TestScrollVew *secondScrollView;

@end

@implementation TestTaobaoDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self.view addSubview:self.scrollView];
//    [self.view addSubview:self.bottomView];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.mainScrollView];
    [self.mainScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(64);
        make.left.right.bottom.equalTo(self.view);
    }];
//    [self setupSubView];
    
//    [self.view addSubview:self.firstSubScrollView];
//    
//    [self.firstSubScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view);
//    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - private method
- (void)setupSubView {
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.top.equalTo(self.view);
//        make.width.equalTo(@(ScreenSize.width));
        make.right.equalTo(self.view);

    }];
    
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.top.equalTo(self.scrollView.mas_bottom);
        make.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
        make.height.equalTo(@60);
    }];
}

#pragma mark - getters and setters

- (TestScrollVew *)mainScrollView {
    if (!_mainScrollView) {
        _mainScrollView = [[TestScrollVew alloc] init];
        _mainScrollView.backgroundColor = [UIColor grayColor];
        
        UIView *testView1 = [[UIView alloc] init];
        testView1.backgroundColor = [UIColor whiteColor];
        [_mainScrollView.containerView addSubview:testView1];
        
        [testView1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_mainScrollView.containerView).offset(3);
            make.top.equalTo(_mainScrollView.containerView).offset(10);
            make.width.equalTo(@100);
            //            make.right.equalTo(_firstScrollView.containerView.mas_right).offset(-20);
            make.height.equalTo(@200);
            
        }];
        
        UIView *testView2 = [[UIView alloc] init];
        testView2.backgroundColor = [UIColor orangeColor];
        [_mainScrollView.containerView addSubview:testView2];
        
        [testView2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_mainScrollView.containerView);
            make.top.equalTo(testView1.mas_bottom).offset(400);
            make.width.equalTo(@300);
            make.height.equalTo(@200);
            make.bottom.equalTo(_mainScrollView.containerView);
        }];
        
//        [_mainScrollView.containerView addSubview:self.firstScrollView];
        
//        [self.firstScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(_mainScrollView.containerView);
//            make.top.equalTo(_mainScrollView.containerView);
//        }];
    }
    return _mainScrollView;
}

- (TestScrollVew *)firstScrollView {
    if (!_firstScrollView) {
        _firstScrollView = [[TestScrollVew alloc] init];
        _firstScrollView.backgroundColor = [UIColor yellowColor];
        
        UIView *testView1 = [[UIView alloc] init];
        testView1.backgroundColor = [UIColor whiteColor];
        [_firstScrollView.containerView addSubview:testView1];
        
        [testView1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_firstScrollView.containerView).offset(3);
            make.top.equalTo(_firstScrollView.containerView).offset(10);
            make.width.equalTo(@10);
//            make.right.equalTo(_firstScrollView.containerView.mas_right).offset(-20);
            make.height.equalTo(@200);
            
        }];
        
        UIView *testView2 = [[UIView alloc] init];
        testView2.backgroundColor = [UIColor orangeColor];
        [_firstScrollView.containerView addSubview:testView2];
        
        [testView2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_firstScrollView.containerView);
            make.top.equalTo(testView1.mas_bottom).offset(400);
            make.width.equalTo(@300);
            make.height.equalTo(@200);
            make.bottom.equalTo(_firstScrollView.containerView);
        }];
    }
    return _firstScrollView;
}

- (TestScrollVew *)secondScrollView {
    if (!_secondScrollView) {
        _secondScrollView = [[TestScrollVew alloc] init];
    }
    return _secondScrollView;
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.backgroundColor = [UIColor grayColor];
        [_scrollView addSubview:self.firstSubScrollView];
//        [_scrollView addSubview:self.secondSubScrollView];
        
        [self.firstSubScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_scrollView);
            make.top.equalTo(_scrollView);
            make.width.equalTo(@(ScreenSize.width));
            make.right.equalTo(_scrollView);
            make.bottom.equalTo(_scrollView);
        }];
        
//        [self.secondSubScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(_scrollView);
//            make.top.equalTo(self.firstSubScrollView.mas_bottom);
//            make.bottom.equalTo(_scrollView);
//        }];
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

- (UIScrollView *)secondSubScrollView {
    if (!_secondSubScrollView) {
        _secondSubScrollView = [[UIScrollView alloc] init];
        _secondSubScrollView.backgroundColor = [UIColor blueColor];
        
        UIView *testView1 = [[UIView alloc] init];
        testView1.backgroundColor = [UIColor whiteColor];
        [_secondSubScrollView addSubview:testView1];
        
        [testView1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_secondSubScrollView).offset(3);
            make.top.equalTo(_secondSubScrollView).offset(10);
            make.width.equalTo(@100);
//            make.right.equalTo(_firstSubScrollView.mas_right).offset(-20);
            make.height.equalTo(@200);
            
        }];
        
        UIView *testView2 = [[UIView alloc] init];
        testView2.backgroundColor = [UIColor orangeColor];
        [_secondSubScrollView addSubview:testView2];
        
        [testView2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_secondSubScrollView);
            make.top.equalTo(testView1.mas_bottom).offset(400);
            make.width.equalTo(@300);
            make.height.equalTo(@200);
            make.bottom.equalTo(_secondSubScrollView);
        }];
    }
    return _secondSubScrollView;
}

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[UIView alloc] init];
        _bottomView.backgroundColor = [UIColor whiteColor];
    }
    return _bottomView;
}

@end
