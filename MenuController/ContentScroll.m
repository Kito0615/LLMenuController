//
//  ContentScroll.m
//  LLMenuController
//
//  Created by AnarL on 16/3/1.
//  Copyright © 2016年 AnarL. All rights reserved.
//

#import "ContentScroll.h"
#import "Common.h"

@interface ContentScroll()
{
    NSArray * _controllers;
}

@end

@implementation ContentScroll

- (instancetype)initWithControllers:(NSArray<UIViewController *> *)controllers
{
    if (self = [super initWithFrame:CGRectMake(LL_ZERO, TITLE_SCROLL_HEIGHT, SCREEN_WIDTH, CONTENT_SCROLL_HEIGHT)]) {
        _controllers = controllers;
        [self setupControllers];
        
    }
    return self;
}

- (void)setupControllers
{
    for (int i = LL_ZERO; i < _controllers.count; i ++) {
        UIViewController * controller = _controllers[i];
        CGFloat W = SCREEN_WIDTH;
        CGFloat H = CONTENT_SCROLL_HEIGHT;
        CGFloat X = W * i;
        CGFloat Y = LL_ZERO;
        
        [controller.view setFrame:CGRectMake(X, Y, W, H)];
        [self addSubview:controller.view];
        self.contentSize = CGSizeMake((i + 1) * W, H);
        self.pagingEnabled = YES;
    }
}
@end
