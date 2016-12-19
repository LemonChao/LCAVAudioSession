//
//  LCAVAudioPlayer.m
//  LCAVAudionSession
//
//  Created by Lemon on 16/11/4.
//  Copyright © 2016年 LemonChao. All rights reserved.
//

#import "LCAVAudioPlayer.h"

@interface LCAVAudioPlayer ()<AVAudioPlayerDelegate>

@property (nonatomic, strong) AVAudioPlayer *player;

@end

@implementation LCAVAudioPlayer
- (instancetype)initAudioPlayer
{
    if (self = [super init]) {
        
        NSError *error;
        NSString *mp3Path = [[NSBundle mainBundle] pathForResource:@"BIGBANG_IFYOU" ofType:@"mp3"];
        
        self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:mp3Path] error:&error];
        if (error) NSLog(@"play error:%@", [error localizedDescription]);
        
        //play music all the time
        self.player.numberOfLoops = -1;
        //prepare play
        [self.player prepareToPlay];
        [self.player play];
    }
    return self;
}


+ (instancetype)shareAudioPlayer {
    static LCAVAudioPlayer *lcPlayer = nil;
    static dispatch_once_t predicate;
    _dispatch_once(&predicate, ^{
        lcPlayer = [[self alloc] init];
    });
    
    return lcPlayer;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        
        NSError *error;
        NSString *mp3Path = [[NSBundle mainBundle] pathForResource:@"BIGBANG_IFYOU" ofType:@"mp3"];
        
        self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:mp3Path] error:&error];
        if (error) NSLog(@"play error:%@", [error localizedDescription]);
        
        //play music all the time
        self.player.numberOfLoops = 0;
        self.player.delegate = self;
        //prepare play
        [self.player prepareToPlay];
        [self.player play];
        
    }
    return self;
}


- (void)stop {
    if (!self.player.isPlaying) return;
    [self.player stop];
}

- (void)play {
    if (self.player.isPlaying) return;
    [self.player play];
}

#pragma mark -AVAudioPlayerDelegate

/** 播放结束，中断引起的停止不会触发此方法 */
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    NSError *error;
    NSLog(@"play to the end");
//    if (![[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback
//                                         withOptions:AVAudioSessionCategoryOptionMixWithOthers | AVAudioSessionCategoryOptionDuckOthers
//                                               error:&error]) { //前台播放，后台
//        NSLog(@"error:%@", [error localizedDescription]);        
//    }
    if (![[AVAudioSession sharedInstance] setActive:NO withOptions:AVAudioSessionSetActiveOptionNotifyOthersOnDeactivation error:&error]) {
        NSLog(@"errpr:%@", [error localizedDescription]);
    }

}

/** 解码过程发生错误 */
- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError * __nullable)error {
    
}
- (void)dealloc
{
    NSLog(@"dealloc  bad");
    
}

@end
