//
//  CDViewController.h
//  TimeIsMoney
//
//  Created by ビザンコムマック　13 on 2014/09/19.
//  Copyright (c) 2014年 mycompany. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CDViewController : UIViewController

//プロジェクト名を表示するラベル
@property (weak, nonatomic) IBOutlet UILabel *pjNameLabel;
//プロジェクトが赤字かどうかを表示するラベル
@property (weak, nonatomic) IBOutlet UILabel *pjStatusLabel;
//時間を表示するラベル
@property (weak, nonatomic) IBOutlet UILabel *pjTimeLabel;
//時間コストを表示するラベル
@property (weak, nonatomic) IBOutlet UILabel *TimeCostLabel;

//カウンターの開始、停止を行うボタンのプロパティ???なぜ必要なの???
//@property (weak, nonatomic) IBOutlet UIButton *startStopButton;

@end
