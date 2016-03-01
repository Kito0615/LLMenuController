//
//  ContentScroll.m
//  LLMenuController
//
//  Created by AnarL on 16/3/1.
//  Copyright © 2016年 AnarL. All rights reserved.
//

#import "ContentScroll.h"

@interface ContentScroll()
{
    NSArray * _controllers;
}

@end

@implementation ContentScroll

- (instancetype)initWithControllers:(NSArray<UIViewController *> *)controllers
{
    if (self = [super initWithFrame:CGRectMake(0, 40, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64 - 40)]) {
        _controllers = controllers;
        [self setupControllers];
        
    }
    return self;
}

- (void)setupControllers
{
    for (int i = 0; i < _controllers.count; i ++) {
        UIViewController * controller = _controllers[i];
        CGFloat W = [UIScreen mainScreen].bounds.size.width;
        CGFloat H = [UIScreen mainScreen].bounds.size.height - 64 - 40;
        CGFloat X = W * i;
        CGFloat Y = 0;
        
        [controller.view setFrame:CGRectMake(X, Y, W, H)];
        [self addSubview:controller.view];
        self.contentSize = CGSizeMake((i + 1) * W, H);
        self.pagingEnabled = YES;
    }
}
@end
