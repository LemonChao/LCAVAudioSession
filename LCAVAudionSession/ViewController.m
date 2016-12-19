//
//  ViewController.m
//  LCAVAudionSession
//
//  Created by Lemon on 16/11/4.
//  Copyright © 2016年 LemonChao. All rights reserved.
//

#import "ViewController.h"
#import "LCAVAudioPlayer.h"

@interface ViewController ()

@property (nonatomic, strong) LCAVAudioPlayer *player;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    LCAVAudioPlayer *player = [[LCAVAudioPlayer alloc] initAudioPlayer];
//    
//    self.player = player;
   
    LCAVAudioPlayer *player = [LCAVAudioPlayer shareAudioPlayer];
    self.player = player;
    

}
- (IBAction)playOrPause:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (sender.selected) {//
        [[LCAVAudioPlayer shareAudioPlayer] stop];
        [sender setTitle:@"play" forState:UIControlStateNormal];
    }else {
        [[LCAVAudioPlayer shareAudioPlayer] play];
        [sender setTitle:@"pause" forState:UIControlStateNormal];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
