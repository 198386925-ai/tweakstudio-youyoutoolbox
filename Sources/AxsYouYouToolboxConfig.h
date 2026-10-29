#pragma once

#import <Foundation/Foundation.h>

@interface AxsYouYouToolboxConfig : NSObject
+ (instancetype)axs_youyoutoolbox_shared;
- (BOOL)axs_youyoutoolbox_isEnabled;
- (id)axs_youyoutoolbox_valueForKey:(NSString *)key defaultValue:(id)defaultValue;
- (void)axs_youyoutoolbox_reload;
@end
