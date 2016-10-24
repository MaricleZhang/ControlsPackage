//
//  UIAlertController+Category.m
//  iOS常见控件的封装
//
//  Created by 张建 on 16/10/24.
//  Copyright © 2016年 张建. All rights reserved.
//

#import "UIAlertController+Category.h"

@implementation UIAlertController (Category)

+(void)showAlertCntrollerWithViewController:(UIViewController *)viewController alertControllerStyle:(UIAlertControllerStyle)alertControllerStyle title:(NSString *)title message:(NSString *)message CallBackBlock:(CallBackBlock)block cancelButtonTitle:(NSString *)cancelBtnTitle destructiveButtonTitle:(NSString *)destructiveBtnTitle otherButtonTitles:(NSString *)otherBtnTitles, ...
{
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:alertControllerStyle];
    
    //添加按钮
    if (cancelBtnTitle.length) {
        UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:cancelBtnTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            block(0);
        }];
        [alertController addAction:cancelAction];
    }
    if (destructiveBtnTitle.length) {
        UIAlertAction * destructiveAction = [UIAlertAction actionWithTitle:destructiveBtnTitle style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            block(1);
        }];
        [alertController addAction:destructiveAction];
    }
    if (otherBtnTitles.length) {
        UIAlertAction *otherActions = [UIAlertAction actionWithTitle:otherBtnTitles style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            (!cancelBtnTitle.length && !destructiveBtnTitle.length) ? block(0) : (((cancelBtnTitle.length && !destructiveBtnTitle.length) || (!cancelBtnTitle.length && destructiveBtnTitle.length)) ? block(1) : block(2));
        }];
        [alertController addAction:otherActions];
        /**
         *  va_list : （1）首先在函数里定义一具VA_LIST型的变量，这个变量是指向参数的指针；
         *            （2）然后用VA_START宏初始化变量刚定义的VA_LIST变量；
         *            （3）然后用VA_ARG返回可变的参数，VA_ARG的第二个参数是你要返回的参数的类型（如果函数有多个可变参数的，依次调用VA_ARG获取各个参数）；
         *            （4）最后用VA_END宏结束可变参数的获取。
         *   va_start :获取可变参数列表的第一个参数的地址;
         *   va_arg :获取当前参数，返回指定类型并将指针指向下一参数
         *   va_end :清空va_list可变参数列表：
         *
         *
         */
        
        va_list args;
        va_start(args, otherBtnTitles);
        if (otherBtnTitles.length) {
            NSString * otherString;
            int index = 2;
            (!cancelBtnTitle.length && !destructiveBtnTitle.length) ? (index = 0) : ((cancelBtnTitle.length && !destructiveBtnTitle.length) || (!cancelBtnTitle.length && destructiveBtnTitle.length) ? (index = 1) : (index = 2));
            while ((otherString = va_arg(args, NSString*))) {
                index ++ ;
                UIAlertAction * otherActions = [UIAlertAction actionWithTitle:otherString style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    block(index);
                }];
                [alertController addAction:otherActions];
            }
        }
        va_end(args);
    }
    [viewController presentViewController:alertController animated:YES completion:nil];
}

@end
