//
//  GBKeyboardView.m
//  ewash
//
//  Created by mac on 16/4/7.
//  Copyright © 2016年 com.sc. All rights reserved.
//

#import "GBKeyboardView.h"

@interface GBKeyboardView ()

@property (copy, nonatomic) GBKeyboardBlock block;

@end

@implementation GBKeyboardView

-(instancetype)initKeyboardWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if(self){
        
    }
    return self;
}

+(instancetype)keyboardWithFrame:(CGRect)frame{
    return  [[self alloc] initKeyboardWithFrame:frame];
}

-(void)setKeyBoardBlock:(GBKeyboardBlock)block{
    self.block=block;
}

@end
