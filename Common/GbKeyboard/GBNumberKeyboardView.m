//
//  GBNumberKeyboardView.m
//  ewash
//
//  Created by mac on 16/4/7.
//  Copyright © 2016年 com.sc. All rights reserved.
//

#import "GBNumberKeyboardView.h"
#import "GBKeyboardButton.h"

static NSInteger const NUMBER_KEYS=12;
static NSInteger const TYPE_DELETE_KEY=9;//删除键的位置
static NSInteger const TYPE_DONE_KEY=11;//完成键的位置
@interface GBNumberKeyboardView()

@property NSArray *btnArray;
@property (copy, nonatomic) GBKeyboardBlock block;

@end

@implementation GBNumberKeyboardView

-(void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    int row = 4;
    int column = 3;
    CGFloat keyWidth = frame.size.width / column;
    CGFloat keyHeight = frame.size.height / row;
    CGFloat startX=0;
    CGFloat startY=0;
    NSArray *array = [self getBtnTitles];
    NSMutableArray *tempBtnArray=[NSMutableArray array];
    for (int i=0; i<NUMBER_KEYS; i++) {
        GBKeyboardButton *button = [[GBKeyboardButton alloc] initKeyButtonWithFrame:CGRectMake(startX, startY, keyWidth, keyHeight)];
        [self addSubview:button];
        [button setTitle:array[i] forState:UIControlStateNormal];
        WS(weakSelf);
        [button setBtnClickBlock:^(GBKeyButtonType buttonType, NSString *text) {
            weakSelf.block(buttonType, text);
        }];
        
        if (i == TYPE_DELETE_KEY) {
            button.btnType = GBKeyButtonTypeDel;
            //[button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        } else if (i == TYPE_DONE_KEY) {
            button.btnType = GBKeyButtonTypeDone;
        } else {
            button.btnType = GBKeyButtonTypeOther;
        }
        
        [tempBtnArray addObject:button];
        //计算startX、startY
        startX+=keyWidth;
        if((i+1)%column==0){
            startX=0;
            startY+=keyHeight;
        }
    }
    self.btnArray=[NSArray arrayWithArray:tempBtnArray];
    
    //设置分割线
    for(int j=0;j<column;j++){
        UIView *lineView=[[UIView alloc] initWithFrame:CGRectMake(j*keyWidth, 0, 0.5, frame.size.height)];
        lineView.backgroundColor = UIColorFromRGB(0xdfdfdf);
        [self addSubview:lineView];
    }
    for(int k=0;k<row;k++){
        UIView *lineView=[[UIView alloc] initWithFrame:CGRectMake(0, k*keyHeight, frame.size.width, 0.5)];
        lineView.backgroundColor = UIColorFromRGB(0xdfdfdf);
        [self addSubview:lineView];
    }
}
/**
 *  获取数字按钮显示的title值
 *
 *  @return 返回数字按键的title数组
 */
-(NSArray *)getBtnTitles{
    NSMutableArray *btnTitlesArray=[[NSMutableArray alloc] init];
    
    NSMutableArray *indexArray=[NSMutableArray arrayWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9", nil];
    
    for(int i=0;i<NUMBER_KEYS;i++){
        if(i==TYPE_DELETE_KEY){
            [btnTitlesArray addObject:@"删除"];
        }else if(i==TYPE_DONE_KEY){
            [btnTitlesArray addObject:@"完成"];
        }else{
            int index = arc4random() % indexArray.count;
            [btnTitlesArray addObject:indexArray[index]];
            [indexArray removeObjectAtIndex:index];
        }
    }
    return [NSArray arrayWithArray:btnTitlesArray];
}

-(void)changeKeyBoardNumber{
    NSArray *btnTitleArray=[self getBtnTitles];
    for(int i=0;i<NUMBER_KEYS;i++){
        UIButton *btn=self.btnArray[i];
        [btn setTitle:btnTitleArray[i] forState:UIControlStateNormal];
    }
}

@end
