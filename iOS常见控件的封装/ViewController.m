//
//  ViewController.m
//  iOS常见控件的封装
//
//  Created by 张建 on 16/10/17.
//  Copyright © 2016年 张建. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+Block.h"

#define RGB(R,G,B) [UIColor colorWithRed:R green:G blue:B alpha:1.0];
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton createBtnFrame:CGRectMake(0, 0, 100, 50) title:@"button" bgImageName:nil action:^(UIButton *button) {
        float r = random()%255/255.0;
        float g = random()%255/255.0;
        float b = random()%255/255.0;
        
        self.view.backgroundColor = RGB(r, g, b);
    }];
    button.center = self.view.center;
    [self.view addSubview:button];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
