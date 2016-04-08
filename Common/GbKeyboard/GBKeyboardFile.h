//
//  GBKeyboardFile.h
//  ewash
//
//  Created by mac on 16/4/7.
//  Copyright © 2016年 com.sc. All rights reserved.
//

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define UIColorFromRGBA(_red,_green,_blue,_alpha)         [UIColor colorWithRed:_red/255.0  green:_green/255.0 blue:_blue/255.0 alpha:_alpha]

typedef enum : NSUInteger {
    GBKeyButtonTypeDel,   // 按键类型：删除
    GBKeyButtonTypeDone,  // 按键类型：完成
    GBKeyButtonTypeOther  // 按键类型：其他
} GBKeyButtonType;
