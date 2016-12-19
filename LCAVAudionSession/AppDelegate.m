//
//  AppDelegate.m
//  LCAVAudionSession
//
//  Created by Lemon on 16/11/4.
//  Copyright © 2016年 LemonChao. All rights reserved.
//

#import "AppDelegate.h"
#import "LCAVAudioSession.h"
#import "LCAVAudioPlayer.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    AVAudioSession *session = [AVAudioSession sharedInstance];
    NSError *error;
    if (![session setCategory:AVAudioSessionCategoryPlayback error:&error]) {
        NSLog(@"Category Error: %@", [error localizedDescription]);
    }
//    if (![session setCategory:AVAudioSessionCategoryPlayback
//                  withOptions:AVAudioSessionCategoryOptionMixWithOthers | AVAudioSessionCategoryOptionDuckOthers
//                        error:&error]) {
//        NSLog(@"Category Error: %@", [error localizedDescription]);
//    }

    if (![session setActive:YES error:&error]) {
        NSLog(@"Active Error: %@", [error localizedDescription]);
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(interruptionNotificationReceived:) name:AVAudioSessionInterruptionNotification object:[AVAudioSession sharedInstance]];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(routeChangeNotificationReceived:) name:AVAudioSessionRouteChangeNotification object:[AVAudioSession sharedInstance]];
    
    return YES;//LCAudioSessionRouteChangeNotification
}

- (void)routeChangeNotificationReceived:(NSNotification *)notification
{
    NSDictionary *notiInfo = notification.userInfo;
    AVAudioSessionRouteChangeReason reson = [notiInfo[AVAudioSessionRouteChangeReasonKey] unsignedIntegerValue];
        
    if (reson == AVAudioSessionRouteChangeReasonOldDeviceUnavailable) {//连接设备断开，不可用
        NSLog(@"Headphones Be Unplugged");
        //stop play or other operation
        [[LCAVAudioPlayer shareAudioPlayer] stop];
    }
    
    if (reson == AVAudioSessionRouteChangeReasonNewDeviceAvailable) {//接入可用的新设备
        NSLog(@"New Device Plugged in");
        [[LCAVAudioPlayer shareAudioPlayer] play];
    }
    
}

- (void)interruptionNotificationReceived:(NSNotification *)notification
{
    NSLog(@"interruptInfo%@", notification.userInfo);
    NSInteger interruptState = [notification.userInfo[AVAudioSessionInterruptionTypeKey] integerValue];
    
    NSError *error;
    if (interruptState == AVAudioSessionInterruptionTypeBegan) {
        NSLog(@"AVAudioSessionInterruptionTypeBegan");
//        [[LCAVAudioPlayer shareAudioPlayer] stop];
        
    }else if (interruptState == AVAudioSessionInterruptionTypeEnded) {
        NSLog(@"AVAudioSessionInterruptionTypeEnded");
//        if ([[AVAudioSession sharedInstance] setActive:YES error:&error]) { //前台也不能播放
//            [[LCAVAudioPlayer shareAudioPlayer] play];
//        }
        if ([[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback
                                             withOptions:AVAudioSessionCategoryOptionMixWithOthers | AVAudioSessionCategoryOptionDuckOthers
                                                   error:&error]) { //前台播放，后台
            [[LCAVAudioPlayer shareAudioPlayer] play];
        }
    }
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
