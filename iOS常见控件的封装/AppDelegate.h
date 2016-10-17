//
//  AppDelegate.h
//  iOS常见控件的封装
//
//  Created by 张建 on 16/10/17.
//  Copyright © 2016年 张建. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

