//
//  UIAlertController+Category.h
//  iOS常见控件的封装
//
//  Created by 张建 on 16/10/24.
//  Copyright © 2016年 张建. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^CallBackBlock)(NSInteger btnIndex);

@interface UIAlertController (Category)

/**
 自定义封装的UIAlertController方法

 @param viewController       显示的vc
 @param alertControllerStyle UIAlertControllerStyle 样式
 @param title                标题
 @param message              提示信息
 @param block                回调block
 @param cancelBtnTitle       取消button标题
 @param destructiveBtnTitle  红色的按钮
 @param otherBtnTitles       其他button标题
 */
+ (void)showAlertCntrollerWithViewController:(UIViewController*)viewController alertControllerStyle:(UIAlertControllerStyle)alertControllerStyle title:(NSString*)title message:(NSString*)message CallBackBlock:(CallBackBlock)block cancelButtonTitle:(NSString *)cancelBtnTitle
                    destructiveButtonTitle:(NSString *)destructiveBtnTitle
                         otherButtonTitles:(NSString *)otherBtnTitles,...NS_REQUIRES_NIL_TERMINATION;

@end
