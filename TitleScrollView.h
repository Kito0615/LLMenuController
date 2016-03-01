//
//  TitleScrollView.h
//  LLMenuController
//
//  Created by AnarL on 16/3/1.
//  Copyright © 2016年 AnarL. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TapTitleProtocol <NSObject>

- (void)tapFrom:(NSInteger)from to:(NSInteger)to;

@end

@interface TitleScrollView : UIScrollView

@property (nonatomic, retain) UIColor * titleColor;
@property (nonatomic, retain) UIColor * backgroundColor;
@property (nonatomic, retain) UIColor * selectedColor;


@property (nonatomic, assign) NSInteger currentIndex;
@property (nonatomic, retain) id <TapTitleProtocol> tapDelegate;

- (instancetype)initWithTitles:(NSArray <NSString *> *)titles;

@end
