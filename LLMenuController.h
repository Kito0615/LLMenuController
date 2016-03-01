//
//  LLMenuController.h
//  LLMenuController
//
//  Created by AnarL on 16/3/1.
//  Copyright © 2016年 AnarL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LLMenuController : UIViewController

@property (nonatomic, retain) UIColor * menuSelecteColor;
@property (nonatomic, retain) UIColor * menuTitleColor;
@property (nonatomic, retain) UIColor * menuBackgroundColor;

- (instancetype)initWithControllers:(NSArray *)controllers titles:(NSArray *)titles;

@end
