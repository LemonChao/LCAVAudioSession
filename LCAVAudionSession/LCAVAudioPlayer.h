//
//  LCAVAudioPlayer.h
//  LCAVAudionSession
//
//  Created by Lemon on 16/11/4.
//  Copyright © 2016年 LemonChao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCAVAudioPlayer : NSObject

+ (instancetype)shareAudioPlayer;

- (instancetype)initAudioPlayer;

- (void)play;

- (void)stop;


@end
