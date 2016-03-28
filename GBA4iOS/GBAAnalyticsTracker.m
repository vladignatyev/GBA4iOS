//
//  GBAAnalyticsTracker.m
//  GBA4iOS
//
//  Created by Vladimir Ignatev on 28.03.16.
//  Copyright © 2016 Riley Testut. All rights reserved.
//

#import "GBAAnalyticsTracker.h"

#import "Google/Analytics.h"

@implementation GBAAnalyticsTracker

+ (void)configureTracker
{
    // Configure tracker from GoogleService-Info.plist.
    NSError *configureError;
    [[GGLContext sharedInstance] configureWithError:&configureError];
    NSAssert(!configureError, @"Error configuring Google services: %@", configureError);
    
    // Optional: configure GAI options.
    GAI *gai = [GAI sharedInstance];
    gai.trackUncaughtExceptions = YES;  // report uncaught exceptions
#if !(RELEASE)
    gai.logger.logLevel = kGAILogLevelVerbose;  // remove before app release
#endif
}

+ (void)trackScreenWithName: (NSString*) name
{
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:name];
    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
}

+ (void)trackEventWithCategory: (NSString*) category
                        action: (NSString*) action
                         label: (NSString*) label
{
    [self.class trackEventWithCategory:category action:action label:label value:@1];
}

+ (void)trackEventWithCategory: (NSString*) category
                         action: (NSString*) action
                          label: (NSString*) label
                          value: (NSNumber*) value
{
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:category
                                                          action:action
                                                           label:label
                                                           value:value] build]];

}
@end
