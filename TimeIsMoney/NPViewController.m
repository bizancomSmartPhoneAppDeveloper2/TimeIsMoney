//
//  NPViewController.m
//  TimeIsMoney
//
//  Created by ビザンコムマック　13 on 2014/09/19.
//  Copyright (c) 2014年 mycompany. All rights reserved.
//

#import "NPViewController.h"

@interface NPViewController ()

@end

@implementation NPViewController{
    float mokuhyouJikyu;
    float housyu;
    NSString *projectName;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //背景クリックでソフトウェアキーボードを消す
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeSoftKeyboard)];
    [self.view addGestureRecognizer:gestureRecognizer];
    // Do any additional setup after loading the view.
    projectName = @"第一回アプリ開発（仮）";
    mokuhyouJikyu = 2000;
    housyu = 10000;
}

//ソフトウェアキーボードを消すためのメソッド
- (void)closeSoftKeyboard {
    [self.view endEditing: YES];
}
@end
