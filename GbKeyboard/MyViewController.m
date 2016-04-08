//
//  MyViewController.m
//  GbKeyboard
//
//  Created by mac on 16/4/8.
//  Copyright © 2016年 com.gb. All rights reserved.
//

#import "MyViewController.h"
#import "GBKeyboardManager.h"

@interface MyViewController ()

@property UITextField *rechargeAmount;

@end
@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self initView];
}

-(void)initView{
    _rechargeAmount=[[UITextField alloc] initWithFrame:CGRectMake(0, 100, 200, 40)];
    _rechargeAmount.borderStyle=UITextBorderStyleRoundedRect;
    _rechargeAmount.placeholder=@"请输入数字";
    _rechargeAmount.textAlignment=NSTextAlignmentLeft;
    _rechargeAmount.clearButtonMode=UITextFieldViewModeWhileEditing;
    _rechargeAmount.returnKeyType=UIReturnKeyNext;
    _rechargeAmount.keyboardType=UIKeyboardTypeDecimalPad;
    [self.view addSubview:_rechargeAmount];
    
    //键盘
    [GBKeyboardManager addRegisterKeyboardForView:_rechargeAmount];
}

-(void)dealloc{
    [GBKeyboardManager removeRegisterKeyboard];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
