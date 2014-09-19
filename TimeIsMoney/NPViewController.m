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

@implementation NPViewController
{
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
//    //とりあえず仮に代入
//    jikyu = 2000;
//    housyu = 50000;
//    projectName = @"第一回アプリ開発（仮）";
    
    //もしjikyuの中身が空でなければテキストフィールドにjikyuの中身を表示
    if (_jikyu != 0) {
        [self.jikyuhyouji setText: [NSString stringWithFormat:@"%ld",(long)_jikyu]];
    }
}

//ソフトウェアキーボードを消すためのメソッド
- (void)closeSoftKeyboard {
    [self.view endEditing: YES];
}

//////月給を入力した時の動作
//- (IBAction)monthlySalaryText:(UITextField *)sender {
//    NSString *text = sender.text;
//    gekkyu = text.integerValue;
//}

//プロジェクト名を入力した時の動作
- (IBAction)pjNameLabel:(UITextField *)sender {
    NSString *text = sender.text;
    projectName = text;
}

//時給を入力した時の動作
- (IBAction)jikyuLabel:(UITextField *)sender {
//    月給から計算した時給をいれこみたいけど難しい。
    NSString *text = sender.text;
    _jikyu = text.integerValue;
}

//報酬額を入力した時の動作
- (IBAction)housyuLabel:(UITextField *)sender {
    NSString *text = sender.text;
    housyu = text.integerValue;
}


//必要な変数をCDに渡す
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //Segueの特定
    if ( [[segue identifier] isEqualToString:@"NPtoCD"] ) {
        CDViewController *cdvc = [segue destinationViewController];
        //ここで遷移先ビューのクラスの変数vcntlに値を渡している
        cdvc.jikyu = _jikyu;
        cdvc.housyu = housyu;
        cdvc.projectName = projectName;
    }
}


@end
