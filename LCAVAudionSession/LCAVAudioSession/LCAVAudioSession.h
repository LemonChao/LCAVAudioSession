//
//  LCAVAudioSession.h
//  LCAVAudionSession
//
//  Created by Lemon on 16/11/4.
//  Copyright © 2016年 LemonChao. All rights reserved.
//

#import <Foundation/Foundation.h>

/* route change notification  */
FOUNDATION_EXPORT NSString *const LCAudioSessionRouteChangeNotification;
/* a NSNumber of SInt32
 enum {
 kAudioSessionRouteChangeReason_Unknown = 0,
 kAudioSessionRouteChangeReason_NewDeviceAvailable = 1,
 kAudioSessionRouteChangeReason_OldDeviceUnavailable = 2,
 kAudioSessionRouteChangeReason_CategoryChange = 3,
 kAudioSessionRouteChangeReason_Override = 4,
 kAudioSessionRouteChangeReason_WakeFromSleep = 6,
 kAudioSessionRouteChangeReason_NoSuitableRouteForCategory = 7,
 kAudioSessionRouteChangeReason_RouteConfigurationChange = 8
 };
 */
FOUNDATION_EXPORT NSString *const LCAudioSessionRouteChangeReason;

/* interrupt notification */
FOUNDATION_EXPORT NSString *const LCAudioSessionInterruptionNotification;
/* a NSNumber of kAudioSessionBeginInterruption or kAudioSessionEndInterruption */
FOUNDATION_EXPORT NSString *const LCAudioSessionInterruptionStateKey;
/* Only present for kAudioSessionEndInterruption. a NSNumber of AudioSessionInterruptionType.*/
FOUNDATION_EXPORT NSString *const LCAudioSessionInterruptionTypeKey;


@interface LCAVAudioSession : NSObject

/** only one avaudion session manager */
+ (id)sharedInstance;

- (BOOL)setActive:(BOOL)active error:(NSError **)outError;

@end
