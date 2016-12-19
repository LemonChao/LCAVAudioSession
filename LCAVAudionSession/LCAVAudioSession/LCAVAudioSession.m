//
//  LCAVAudioSession.m
//  LCAVAudionSession
//
//  Created by Lemon on 16/11/4.
//  Copyright © 2016年 LemonChao. All rights reserved.
//

#import "LCAVAudioSession.h"
#import <AVFoundation/AVFoundation.h>

NSString *const LCAudioSessionRouteChangeNotification = @"LCAudioSessionRouteChangeNotification";
NSString *const LCAudioSessionRouteChangeReason = @"LCAudioSessionRouteChangeReason";
NSString *const LCAudioSessionInterruptionNotification = @"LCAudioSessionInterruptionNotification";
NSString *const LCAudioSessionInterruptionStateKey = @"LCAudioSessionInterruptionStateKey";
NSString *const LCAudioSessionInterruptionTypeKey = @"LCAudioSessionInterruptionTypeKey";


@implementation LCAVAudioSession

/** only one avaudion session manager */
+ (id)sharedInstance {
    
    static dispatch_once_t once;
    static LCAVAudioSession *sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;

}

//- (id)init
//{
//    self = [super init];
//    if (self)
//    {
//        [self _initializeAudioSession];
//    }
//    return self;
//}
//
//- (void)_initializeAudioSession
//{
//    AudioSessionInitialize(NULL, NULL, MCAudioSessionInterruptionListener, (__bridge void *)self);
//    AudioSessionAddPropertyListener(kAudioSessionProperty_AudioRouteChange, MCAudioSessionRouteChangeListener, (__bridge void *)self);
//    
//    AVAudioSession
//    
//}
//
//
//- (BOOL)setActive:(BOOL)active error:(NSError **)outError {
//    
//}
//

@end
