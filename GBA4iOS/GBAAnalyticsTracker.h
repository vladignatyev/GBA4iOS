//
//  GBAAnalyticsTracker.h
//  GBA4iOS
//
//  Created by Vladimir Ignatev on 28.03.16.
//  Copyright © 2016 Riley Testut. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GBAAnalyticsTracker : NSObject

+ (void)configureTracker;
+ (void)trackScreenWithName: (NSString*) name;

+ (void)trackEventWithCategory: (NSString*) category
                        action: (NSString*) action
                         label: (NSString*) label;

+ (void)trackEventWithCategory: (NSString*) category
                        action: (NSString*) action
                         label: (NSString*) label
                         value: (NSNumber*) value;

@end
