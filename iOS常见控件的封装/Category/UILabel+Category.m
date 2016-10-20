//
//  UILabel+Category.m
//  iOS常见控件的封装
//
//  Created by 张建 on 16/10/18.
//  Copyright © 2016年 张建. All rights reserved.
//

#import "UILabel+Category.h"

@implementation UILabel (Category)

+ (instancetype)createLabelWithFrame:(CGRect)frame text:(NSString *)text titleColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment font:(UIFont *)font
{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.text = text;
    label.textColor = textColor;
    label.textAlignment = textAlignment;
    label.font = font;
    
    return label;
}

- (CGFloat)getLabelHeightWithMaxWidth:(CGFloat)maxWidth 
{
    self.numberOfLines = 0;
    self.width = maxWidth;
    CGRect rect = [self.text boundingRectWithSize:CGSizeMake(maxWidth, MAXFLOAT)  options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:self.font,} context:nil];
    
    return rect.size.height;
}

-(CGFloat)getAttributeLabelHeightWithText:(NSString *)text maxWidth:(CGFloat)maxWidth lineSpacing:(CGFloat)lineSpacing
{
    self.numberOfLines = 0;
    self.width = maxWidth;
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    
    [style setLineSpacing:lineSpacing];

    CGRect rect = [text boundingRectWithSize:CGSizeMake(maxWidth, MAXFLOAT)  options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:self.font,NSParagraphStyleAttributeName:style} context:nil];
    
    return rect.size.height;
    
}

@end
