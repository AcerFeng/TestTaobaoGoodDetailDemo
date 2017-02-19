//
//  TestScrollVew.m
//  TestTaobaoGoodDetailDemo
//
//  Created by LanFeng on 2017/2/20.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import "TestScrollVew.h"
#import "Masonry.h"

@implementation TestScrollVew

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.containerView];
        
        [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
            make.width.equalTo(self);
        }];
    }
    return self;
}

- (UIView *)containerView {
    if (!_containerView) {
        _containerView = [[UIView alloc] init];
    }
    return _containerView;
}

@end
