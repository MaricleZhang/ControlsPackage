//
//  UILabel+Category.h
//  iOS常见控件的封装
//
//  Created by 张建 on 16/10/18.
//  Copyright © 2016年 张建. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Category)

/**
 创建普通文本

 @param frame         frame
 @param text          文字
 @param textColor     字体颜色
 @param textAlignment 字体位置
 @param font          字体大小

 @return label
 */
+ (instancetype)createLabelWithFrame:(CGRect)frame text:(NSString *)text titleColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment font:(UIFont *)font;


/**
 获取普通文本的高度  (影响普通文本高度的两个因素：1.最大宽度 2.字体大小）

 @param maxWidth    最大宽度限制

 @return label的高度
 */
- (CGFloat)getLabelHeightWithMaxWidth:(CGFloat)maxWidth;


/**
 获取富文本高度  (影响富文本高度的4个因素：1.最大宽度 2.字体大小 3.行间距  4.字间距  字间距一般不变，这里没有封装）

 @param text       text
 @param maxWidth   最大宽度限制
 @param lineSpacing 行间距

 @return label的高度
 */
- (CGFloat)getAttributeLabelHeightWithText:(NSString*)text maxWidth:(CGFloat)maxWidth lineSpacing:(CGFloat)lineSpacing;

@end
