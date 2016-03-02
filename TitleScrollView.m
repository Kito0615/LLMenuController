//
//  TitleScrollView.m
//  LLMenuController
//
//  Created by AnarL on 16/3/1.
//  Copyright © 2016年 AnarL. All rights reserved.
//

#import "TitleScrollView.h"
#import "Common.h"
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
    if (self = [super initWithFrame:CGRectMake(LL_ZERO, LL_ZERO, [UIScreen mainScreen].bounds.size.width, CONTENT_SCROLL_HEIGHT)]) {
        _titles = titles;
        self.backgroundColor = [UIColor greenColor];
        self.currentIndex = LL_ZERO;
        [self setupTitles:titles];
    }
    return self;
}

- (void)setupTitles:(NSArray *)titles
{
    CGFloat lastTitleW = LL_ZERO;
    CGFloat lastTitleX = LL_ZERO;
    for (int i = LL_ZERO; i < titles.count; i ++) {
        NSString * title = titles[i];
        
        CGFloat titleW = [title boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, TITLE_HEIGHT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:TITLE_FONT_SIZE]} context:nil].size.width;
        CGFloat titleH = TITLE_HEIGHT;
        CGFloat titleX = lastTitleX + lastTitleW + TITLE_TOP_SPACE;
        CGFloat titleY = TITLE_TOP_SPACE;
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(titleX, titleY, titleW, titleH)];
        _titleLabel.tag = BASIC_TAG + i;
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.text = title;
        _titleLabel.font = [UIFont systemFontOfSize:TITLE_FONT_SIZE - 5];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.userInteractionEnabled = YES;
        
        UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapLabel:)];
        [_titleLabel addGestureRecognizer:tapGesture];
        
        [self addSubview:_titleLabel];
        lastTitleX = titleX;
        lastTitleW = titleW;
        self.contentSize = CGSizeMake(lastTitleX + lastTitleW + TITLE_TOP_SPACE, TITLE_SCROLL_HEIGHT);
        
        _backgroundView = [[UIView alloc] initWithFrame:CGRectMake(LL_ZERO, LL_ZERO, self.contentSize.width, TITLE_SCROLL_HEIGHT)];
        [self addSubview:_backgroundView];
        [self sendSubviewToBack:_backgroundView];
        
        if (i == _currentIndex) {
            _selectedView = [[UIView alloc] initWithFrame:_titleLabel.frame];
            _selectedView.layer.cornerRadius = SELECTED_TITLE_CORNER_RADIUS;
            _selectedView.layer.masksToBounds = YES;
            [_backgroundView addSubview:_selectedView];
        }
    }
}

- (void)setCurrentIndex:(NSInteger)currentIndex
{
    UILabel * currentLabel = (UILabel *)[self viewWithTag:BASIC_TAG + currentIndex];
    [UIView animateWithDuration:ANIMATION_DURATION animations:^{
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
    
    [self.tapDelegate tapFrom:_currentIndex to:tapLabel.tag - BASIC_TAG];
    
    self.currentIndex = tapLabel.tag - BASIC_TAG;
}

#pragma mark -Setters
- (void)setTitleColor:(UIColor *)titleColor
{
    for (int i = LL_ZERO; i < _titles.count; i ++) {
        UILabel * titleLabel = (UILabel *)[self viewWithTag:i + BASIC_TAG];
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
