//
//  LLMenuController.m
//  LLMenuController
//
//  Created by AnarL on 16/3/1.
//  Copyright © 2016年 AnarL. All rights reserved.
//

#import "LLMenuController.h"
#import "TitleScrollView.h"
#import "ContentScroll.h"
@interface LLMenuController() <UIScrollViewDelegate, TapTitleProtocol>
{
    NSArray * _controllers;
    NSArray * _titles;
    
    TitleScrollView * _titleScroll;
    ContentScroll * _controllerScroll;
}
@end

@implementation LLMenuController

- (void)viewDidLoad
{
    [super viewDidLoad];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
}

- (instancetype)initWithControllers:(NSArray *)controllers titles:(NSArray *)titles
{
    if (self = [super init]) {
        _controllers = controllers;
        _titles = titles;
        
        [self setupTitles];
        [self setupControllers];
        
        _controllerScroll.delegate = self;
        _titleScroll.delegate = self;
        _titleScroll.tapDelegate = self;
    }
    
    return self;
}

- (void)setupTitles
{
    _titleScroll = [[TitleScrollView alloc] initWithTitles:_titles];
    _titleScroll.bounces = NO;
    [_titleScroll setShowsHorizontalScrollIndicator:NO];
    [_titleScroll setShowsVerticalScrollIndicator:NO];
    
    [self.view addSubview:_titleScroll];
}

- (void)setupControllers
{
    _controllerScroll = [[ContentScroll alloc] initWithControllers:_controllers];
    _controllerScroll.bounces = NO;
    _controllerScroll.showsVerticalScrollIndicator = NO;
    _controllerScroll.showsHorizontalScrollIndicator = NO;
    
    [self.view addSubview:_controllerScroll];
}

#pragma mark -UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView == _controllerScroll) {
        
        NSInteger index = scrollView.contentOffset.x / [UIScreen mainScreen].bounds.size.width;
        
        _titleScroll.currentIndex = index;
        
    }
}

#pragma mark -Setters
- (void)setMenuTitleColor:(UIColor *)menuTitleColor
{
    _titleScroll.titleColor = menuTitleColor;
}

- (void)setMenuSelecteColor:(UIColor *)menuSelecteColor
{
    _titleScroll.selectedColor = menuSelecteColor;
}

- (void)setMenuBackgroundColor:(UIColor *)menuBackgroundColor
{
    _titleScroll.backgroundColor = menuBackgroundColor;
}

#pragma mark -TapTitleProtocol
- (void)tapFrom:(NSInteger)from to:(NSInteger)to
{
    [_controllerScroll setContentOffset:CGPointMake(to * [UIScreen mainScreen].bounds.size.width, 0) animated:YES];
}


@end
