//
//  GBKeyboardButton.m
//  ewash
//
//  Created by mac on 16/4/7.
//  Copyright © 2016年 com.sc. All rights reserved.
//

#import "GBKeyboardButton.h"
#import "UIImage+Extension.h"

@interface GBKeyboardButton ()

@property (copy, nonatomic) BtnClickBlock block;

@end

@implementation GBKeyboardButton

-(instancetype)initKeyButtonWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if(self) {
        //设置button属性
        self.backgroundColor = [UIColor whiteColor];
        self.titleLabel.font = [UIFont systemFontOfSize:15.0];
        [self setTintColor:UIColorFromRGB(0x333333)];
        [self setTitleColor:UIColorFromRGB(0x333333) forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage imageWithColor:UIColorFromRGB(0xdfdfdf)] forState:UIControlStateHighlighted];
        [self addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

+(instancetype)keyButtonWithFrame:(CGRect)frame{
    return [[self alloc] initKeyButtonWithFrame:frame];
}

-(void)setBtnClickBlock:(BtnClickBlock)block{
    self.block=block;
}

-(void)btnClicked:(GBKeyboardButton *)btn{
    NSString *text = @"";
    if (self.btnType == GBKeyButtonTypeOther) {
        text = btn.titleLabel.text;
    }
    self.block(self.btnType, text);
}

@end
