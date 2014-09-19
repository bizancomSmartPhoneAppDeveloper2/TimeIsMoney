//
//  ViewController.m
//  TimeIsMoney
//
//  Created by ビザンコムマック　13 on 2014/09/19.
//  Copyright (c) 2014年 mycompany. All rights reserved.
//

#import "ViewController.h"
//音源用のフレームワーク2つインポート
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface ViewController ()
//音源用のプロパティを宣言
@property AVAudioPlayer *coin;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //音源用の何かを読み込む、ここでファイル名を変更
    NSString *path = [[NSBundle mainBundle]pathForResource:@"coin"ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:path];
    self.coin = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:NULL];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startBtn:(UIButton *)sender {
    //音がなるメソッド
   [self.coin play];
}

@end
