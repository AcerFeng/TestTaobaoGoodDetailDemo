//
//  ViewController.m
//  TestTaobaoGoodDetailDemo
//
//  Created by lanfeng on 17/2/17.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import "ViewController.h"
#import "TestTaobaoDetailViewController.h"
#import "TaobaoDetailViewController.h"


#define ScreenSize [UIScreen mainScreen].bounds.size

@interface ViewController ()<UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIScrollView *firstSubScrollView;
@property (nonatomic, strong) UIScrollView *secondSubScrollView;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self.view addSubview:self.scrollView];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.secondSubScrollView];
    [self setupSubViews];
}

- (void)setupSubViews {
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - event response

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row > 10) {
        [self.navigationController pushViewController:[[TaobaoDetailViewController alloc] init] animated:YES];
        return;
    }
    [self.navigationController pushViewController:[[TestTaobaoDetailViewController alloc] init] animated:YES];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"?%ld", indexPath.row];
    return cell;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    CGFloat offset = scrollView.contentOffset.y;
    if ([scrollView isKindOfClass:[UITableView class]]) {
        CGFloat valueNum = _tableView.contentSize.height - ScreenSize.height;
        if ((offset - valueNum) > 50) {
            [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionLayoutSubviews animations:^{
                self.secondSubScrollView.frame = CGRectMake(0, 0, ScreenSize.width, ScreenSize.height);
                self.tableView.frame = CGRectMake(0, -ScreenSize.height, ScreenSize.width, ScreenSize.height);
            } completion:^(BOOL finished) {
                
            }];
        }
    } else {
        if (offset < 0 && -offset > 50) {
            [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionLayoutSubviews animations:^{
                _tableView.frame = CGRectMake(0, 0, ScreenSize.width, ScreenSize.height);
                self.secondSubScrollView.frame = CGRectMake(0, ScreenSize.height, ScreenSize.width, ScreenSize.height);
                
            } completion:^(BOOL finished) {
                
            }];
        }
    }
    
}


#pragma mark - getters and setters
- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, ScreenSize.width, ScreenSize.height)];
        _scrollView.contentSize = CGSizeMake(ScreenSize.width, ScreenSize.height * 2);
        _scrollView.delegate = self;
        
    }
    return _scrollView;
}

- (UIScrollView *)firstSubScrollView {
    if (!_firstSubScrollView) {
        _firstSubScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenSize.width, ScreenSize.height)];
        _firstSubScrollView.backgroundColor = [UIColor blueColor];
        _firstSubScrollView.contentSize = CGSizeMake(ScreenSize.width, ScreenSize.height * 2);
    }
    return _firstSubScrollView;
}

- (UIScrollView *)secondSubScrollView {
    if (!_secondSubScrollView) {
        _secondSubScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, ScreenSize.height, ScreenSize.width, ScreenSize.height)];
        _secondSubScrollView.backgroundColor = [UIColor grayColor];
        _secondSubScrollView.contentSize = CGSizeMake(ScreenSize.width, ScreenSize.height * 1.5);
        _secondSubScrollView.delegate = self;
    }
    return _secondSubScrollView;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenSize.width, ScreenSize.height)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}



@end
