//
//  GBKeyboardButton.h
//  ewash
//
//  Created by mac on 16/4/7.
//  Copyright © 2016年 com.sc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GBKeyboardFile.h"

typedef void(^BtnClickBlock)(GBKeyButtonType buttonType, NSString *text);
@interface GBKeyboardButton : UIButton

@property(nonatomic) GBKeyButtonType btnType;

+ (instancetype)keyButtonWithFrame:(CGRect)frame;
- (instancetype)initKeyButtonWithFrame:(CGRect)frame;

- (void)setBtnClickBlock:(BtnClickBlock)block;

@end
