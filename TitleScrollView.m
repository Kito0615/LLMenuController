//
//  TitleScrollView.m
//  LLMenuController
//
//  Created by AnarL on 16/3/1.
//  Copyright © 2016年 AnarL. All rights reserved.
//

#import "TitleScrollView.h"
@interface TitleScrollView()
{
    NSArray * _titles;
    UILabel * _titleLabel;
    UIView * _backgroundView;
    UIView * _selectedView;
}
@end

@implementation TitleScrollView

- (instancetype)initWithTitles:(NSArray *)titles
{
    if (self = [super initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 40)]) {
        _titles = titles;
        self.backgroundColor = [UIColor greenColor];
        self.currentIndex = 0;
        [self setupTitles:titles];
    }
    return self;
}

- (void)setupTitles:(NSArray *)titles
{
    CGFloat lastTitleW = 0;
    CGFloat lastTitleX = 0;
    for (int i = 0; i < titles.count; i ++) {
        NSString * title = titles[i];
        
        CGFloat titleW = [title boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, 40) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:45]} context:nil].size.width;
        CGFloat titleH = 40;
        CGFloat titleX = lastTitleX + lastTitleW;
        CGFloat titleY = 0;
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(titleX, titleY, titleW, titleH)];
        _titleLabel.tag = 100 + i;
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.text = title;
        _titleLabel.font = [UIFont systemFontOfSize:25];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
//        _titleLabel.textColor = [UIColor redColor];
        _titleLabel.userInteractionEnabled = YES;
        
        UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapLabel:)];
        [_titleLabel addGestureRecognizer:tapGesture];
        
        [self addSubview:_titleLabel];
        lastTitleX = titleX;
        lastTitleW = titleW;
        self.contentSize = CGSizeMake(lastTitleX + lastTitleW, 40);
        
        _backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.contentSize.width, 40)];
//        _backgroundView.backgroundColor = [UIColor blueColor];
        [self addSubview:_backgroundView];
        [self sendSubviewToBack:_backgroundView];
        
        if (i == _currentIndex) {
            _selectedView = [[UIView alloc] initWithFrame:_titleLabel.frame];
//            _selectedView.backgroundColor = [UIColor grayColor];
            [_backgroundView addSubview:_selectedView];
        }
    }
}

- (void)setCurrentIndex:(NSInteger)currentIndex
{
    UILabel * currentLabel = (UILabel *)[self viewWithTag:100 + currentIndex];
    [UIView animateWithDuration:0.3 animations:^{
        _selectedView.frame = currentLabel.frame;
        if ((currentLabel.frame.origin.x + currentLabel.frame.size.width > [UIScreen mainScreen].bounds.size.width) || (currentLabel.frame.origin.x < self.contentOffset.x)) {
            [self scrollRectToVisible:_selectedView.frame animated:YES];
        }
    }];
    
    _currentIndex = currentIndex;
    
}

- (void)tapLabel:(UITapGestureRecognizer *)tap
{
    UILabel * tapLabel = (UILabel *)tap.view;
    
    [self.tapDelegate tapFrom:_currentIndex to:tapLabel.tag - 100];
    
    self.currentIndex = tapLabel.tag - 100;
}

#pragma mark -Setters
- (void)setTitleColor:(UIColor *)titleColor
{
    for (int i = 0; i < _titles.count; i ++) {
        UILabel * titleLabel = (UILabel *)[self viewWithTag:i + 100];
        titleLabel.textColor = titleColor;
    }
}

- (void)setSelectedColor:(UIColor *)selectedColor
{
    _selectedView.backgroundColor = selectedColor;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
    _backgroundView.backgroundColor = backgroundColor;
}

@end
