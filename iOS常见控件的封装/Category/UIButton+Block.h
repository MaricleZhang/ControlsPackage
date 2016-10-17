//
//  UIButton+Block.h
//  iOS常见控件的安装
//
//  Created by 张建 on 16/10/17.
//  Copyright © 2016年 张建. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^tapActionBlock)(UIButton *button);

@interface UIButton (Block)
@property(nonatomic,copy)tapActionBlock actionBlock;

/**
 通过block对button的点击事件封装
 
 @param frame       frame
 @param title       标题
 @param bgImageName 背景图片
 @param actionBlock 点击事件回调block
 
 @return button
 */
+ (UIButton *)createBtnFrame:(CGRect)frame title:(NSString *)title bgImageName:(NSString *)bgImageName action:(tapActionBlock)actionBlock;

@end
