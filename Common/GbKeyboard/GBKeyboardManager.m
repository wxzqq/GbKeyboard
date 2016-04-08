//
//  GBKeyboardManager.m
//  ewash
//
//  Created by mac on 16/4/7.
//  Copyright © 2016年 com.sc. All rights reserved.
//

#import "GBKeyboardManager.h"
#import <objc/runtime.h>
#import "GBNumberKeyboardView.h"
#import "UITextField+extension.h"

@implementation GBKeyboardManager

+ (void)addRegisterKeyboard:(GBKeyboardView *)keyBoardView{
    [self keyBoardObject].keyBoardView=keyBoardView;
    [self addObservers];
}
+ (void)removeRegisterKeyboard{
    objc_removeAssociatedObjects(self);
    [self removeObservers];
}

+ (void)addObservers{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

+ (void)removeObservers{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

+(void)keyboardWillShow:(NSNotification *)notification{
    //目的是每次键盘弹出更改显示的数字
    if([[self keyBoardObject].keyBoardView isKindOfClass:[GBNumberKeyboardView class]]){
        GBNumberKeyboardView *numberView=[self keyBoardObject].keyBoardView;
        [numberView changeKeyBoardNumber];
    }
}

+ (void)keyboardWillHide:(NSNotification *)notification{
    
}


+(GBKeyboardObject *)keyBoardObject{
    if (!objc_getAssociatedObject(self, _cmd)) {
        objc_setAssociatedObject(self, _cmd, [GBKeyboardObject new], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return objc_getAssociatedObject(self, _cmd);
}

/*******************为设置的view添加键盘 start*******************/
+ (void)addRegisterKeyboardForView:(UIView *)view{
    if([view respondsToSelector:@selector(setInputView:)]){
        CGFloat keyBoardWidth=[UIScreen mainScreen].bounds.size.width;
        CGFloat keyBoardHeight=[UIScreen mainScreen].bounds.size.height*0.4;
        GBNumberKeyboardView *keyBoardView=[GBNumberKeyboardView keyboardWithFrame:CGRectMake(0, 0, keyBoardWidth, keyBoardHeight)];
        [view performSelectorOnMainThread:@selector(setInputView:) withObject:keyBoardView waitUntilDone:NO];
        [GBKeyboardManager addRegisterKeyboard:keyBoardView];
        
        WS(weakSelf);
        [keyBoardView setKeyBoardBlock:^(GBKeyButtonType type, NSString *text) {
            [[[weakSelf alloc] init] changeTextField:type Text:text Object:view];
            //[weakSelf alloc] init
        }];
        
    }else{
        NSLog(@"该view不支持");
    }
}

- (void)changeTextField:(GBKeyButtonType)type Text:(NSString *)text Object:(UIView *)rspView{
    if([rspView isKindOfClass:[UITextField class]]){
        UITextField *myTextField=(UITextField *)rspView;
        switch (type) {
            case GBKeyButtonTypeDel: {
                [myTextField changetext:text];
            }
                break;
                
            case GBKeyButtonTypeDone: {
                [myTextField resignFirstResponder];
            }
                break;
                
            case GBKeyButtonTypeOther: {
                [myTextField changetext:text];
            }
                break;
        }
    }
}
/*******************为设置的view添加键盘 end*******************/
@end
