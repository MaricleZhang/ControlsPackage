//
//  ViewController.m
//  iOS常见控件的封装
//
//  Created by 张建 on 16/10/17.
//  Copyright © 2016年 张建. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+Block.h"
#import "UILabel+Category.h"
#import "UIViewExt.h"
#import "UIAlertController+Category.h"

#define RGB(R,G,B) [UIColor colorWithRed:R green:G blue:B alpha:1.0]
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define FontSize(_size_) [UIFont systemFontOfSize:_size_]

@interface ViewController ()
@property(nonatomic,copy)NSString *str;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //按钮
    UIButton *button = [UIButton createBtnFrame:CGRectMake(100, 100,SCREEN_WIDTH - 2*100, 50) title:@"button" bgImageName:nil action:^(UIButton *button) {
        _str = @"";
        float r = random()%255/255.0;
        float g = random()%255/255.0;
        float b = random()%255/255.0;
        
        self.view.backgroundColor = RGB(r, g, b);
        [UIAlertController showAlertCntrollerWithViewController:self alertControllerStyle:UIAlertControllerStyleAlert title:@"温馨提示" message:@"你确定要退出该账号吗？" CallBackBlock:^(NSInteger btnIndex) {
            NSLog(@"点击第%li个按钮",btnIndex);

            
        } cancelButtonTitle:nil destructiveButtonTitle:@"在考虑" otherButtonTitles:@"确定", nil];
    }];
    [self.view addSubview:button];
    
    //普通文本
    NSString *text = @"我是普通文本我是普通文本我是普通文本我是普通文本我是普通文本";
    CGFloat maxWidth = 200.0f;
    
    UILabel *label = [UILabel createLabelWithFrame:CGRectMake((SCREEN_WIDTH - maxWidth)/2,button.bottom + 50, 0,0) text:text titleColor:nil textAlignment:NSTextAlignmentLeft font: FontSize(15.0f)];
    label.height = [label getLabelHeightWithMaxWidth:maxWidth];
    label.backgroundColor = [UIColor redColor];
    [self.view addSubview:label];
    
    //富文本
//    NSMutableAttributedString *attText = [[NSMutableAttributedString alloc]initWithString:text];
//    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc]init];
//    style.lineSpacing = 20.0f;
//    [attText setAttributes:@{NSParagraphStyleAttributeName:style} range:NSMakeRange(0, text.length)];
//    label.attributedText = attText;
//    label.height = [label getAttributeLabelHeightWithText:text maxWidth:maxWidth lineSpacing:20.0f];
    NSLog(@"%f",label.height);
    
    //显示alertViewController
    UIButton *alertButton = [UIButton createBtnFrame:CGRectMake(100, label.bottom + 30,SCREEN_WIDTH - 2*100, 50) title:@"显示alerView" bgImageName:nil action:^(UIButton *button) {
        [UIAlertController showAlertCntrollerWithViewController:self alertControllerStyle:UIAlertControllerStyleAlert title:@"温馨提示" message:@"你确定要退出该账号吗？" CallBackBlock:^(NSInteger btnIndex) {
            NSLog(@"点击第%li个按钮",btnIndex);
            
            
        } cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"确定",nil];
    }];
    [self.view addSubview:alertButton];
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
