//
//  FNViewController.m
//  TimeIsMoney
//
//  Created by ビザンコムマック　13 on 2014/09/19.
//  Copyright (c) 2014年 mycompany. All rights reserved.
//

#import "FNViewController.h"

@interface FNViewController ()

@end

@implementation FNViewController
{
    //新しく追加する変数
    NSInteger resultTime;
    NSInteger resultCost;
    NSInteger resultJikyu;

    //カウントダウン画面から引き継いでくる予定の変数
    NSInteger hours;
    NSInteger minutes;
    NSInteger seconds;
    BOOL isOver;//設定時間を過ぎたかどうかの判定
    float mokuhyouJikan;
    NSInteger mokuhyouJikanKirisute;
    
    //初期画面で記入される予定の変数
    float jikyu;
    float housyu;
    NSString *projectName;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //最終的には引き継ぐようになるが、仮作成時は直接変数に値を代入する
    hours=2;
    minutes=26;
    seconds=36;
    isOver=NO;
    jikyu=2000;//目標とする時給
    housyu=10000;//もらえる報酬
    projectName = @"第一回アプリ開発（仮）";
    mokuhyouJikan = housyu/jikyu*60;
    mokuhyouJikanKirisute = mokuhyouJikan;
    NSLog(@"目標時間は%d分",mokuhyouJikanKirisute);
    // Do any additional setup after loading the view.
    
    //pjNameResultLabelにプロジェクト名を記入
    self.pjNameLabel.text = [NSString stringWithFormat:@"%@",projectName];
    
    //resultTimeLabelにプロジェクト終了までにかかった時間の合計を記入
    if (isOver) {
        //マイナスに陥っていた場合の計算
        resultTime = (hours*60)+minutes+mokuhyouJikanKirisute;
    }else{
        //プラス収支だった場合の計算
        resultTime = mokuhyouJikanKirisute-((hours*60)+minutes);
        seconds = 60-seconds;
        if (seconds==60) {
            seconds=0;
        }
    }
    hours=resultTime/60;
    minutes=resultTime%60;
    self.resultTimeLabel.text = [NSString stringWithFormat:@"%02ld:%02ld:%02ld",(long)hours,(long)minutes,(long)seconds];

    //resultCostLabelに総コストから報酬額を引いた金額を記入
    resultCost = (hours*jikyu)+((minutes*jikyu)/60);
    resultCost = housyu - resultCost;
    self.resultCostLabel.text = [NSString stringWithFormat:@"¥%ld",(long)resultCost];
    
    //resultJikyuLabelに報酬額をかかった時間で割った「時給」を記入
    resultJikyu = (housyu/((hours*3600)+(minutes*60)+seconds))*3600;
    self.resultJikyuLabel.text = [NSString stringWithFormat:@"¥%ld",(long)resultJikyu];
    
    //時間コストの収支がマイナスだった場合背景を赤くする
    if (resultCost < 0) {
        self.view.backgroundColor = [UIColor redColor];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
