//
//  GBKeyboardView.h
//  ewash
//
//  Created by mac on 16/4/7.
//  Copyright © 2016年 com.sc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GBKeyboardFile.h"

static CGFloat GBKeyboardViewHeight = 250;

typedef void(^GBKeyboardBlock)(GBKeyButtonType type, NSString *text);

@interface GBKeyboardView : UIView

- (instancetype)initKeyboardWithFrame:(CGRect)frame;
+ (instancetype)keyboardWithFrame:(CGRect)frame;

-(void)setKeyBoardBlock:(GBKeyboardBlock)block;

@end
