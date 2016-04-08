//
//  GBKeyboardManager.h
//  ewash
//
//  Created by mac on 16/4/7.
//  Copyright © 2016年 com.sc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GBKeyboardView.h"
#import "GBKeyboardObject.h"
/**
 *  采用外观模式，使更易用
 */
@interface GBKeyboardManager : NSObject

+ (GBKeyboardObject *)keyBoardObject;
/**
 *  为相应的View添加自定义的键盘
 *  @param view ：需要添加键盘的View
 */
+ (void)addRegisterKeyboardForView:(UIView *)view;
/**
 *  移除相应的键盘事件及监听，一般在dealloc方法中使用
 */
+ (void)removeRegisterKeyboard;

@end
