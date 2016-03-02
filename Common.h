//
//  Common.h
//  LLMenuController
//
//  Created by AnarL on 16/3/2.
//  Copyright © 2016年 AnarL. All rights reserved.
//

#ifndef Common_h
#define Common_h

#define BASIC_TAG 100
#define LL_ZERO 0
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define NAVIGATION_BAR_HEIGHT 64

#define iOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define TITLE_SCROLL_HEIGHT 40
#define TITLE_HEIGHT 30
#define TITLE_FONT_SIZE 25
#define TITLE_TOP_SPACE 5
#define SELECTED_TITLE_CORNER_RADIUS 13
#define ANIMATION_DURATION 0.3f

#define CONTENT_SCROLL_HEIGHT (SCREEN_HEIGHT - NAVIGATION_BAR_HEIGHT - TITLE_SCROLL_HEIGHT)

#endif /* Common_h */
