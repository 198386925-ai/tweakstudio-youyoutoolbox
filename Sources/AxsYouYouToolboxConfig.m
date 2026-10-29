#import "AxsYouYouToolboxConfig.h"
#import "AxsYouYouToolboxPreferences.h"

@interface AxsYouYouToolboxConfig ()
@property (atomic, copy) NSDictionary *snapshot;
@property (nonatomic, strong) dispatch_queue_t reloadQueue;
@end

static void axs_youyoutoolbox_preferencesDidChange(CFNotificationCenterRef center, void *observer,
                                          CFStringRef name, const void *object, CFDictionaryRef info) {
    AxsYouYouToolboxConfig *config = (__bridge AxsYouYouToolboxConfig *)observer;
    dispatch_async(config.reloadQueue, ^{
        [config axs_youyoutoolbox_reload];
    });
}

@implementation AxsYouYouToolboxConfig

+ (instancetype)axs_youyoutoolbox_shared {
    static AxsYouYouToolboxConfig *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _reloadQueue = dispatch_queue_create("com.axs.youyoutoolbox.preferences", DISPATCH_QUEUE_SERIAL);
        [self axs_youyoutoolbox_reload];
        CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),
            (__bridge const void *)self, axs_youyoutoolbox_preferencesDidChange,
            (__bridge CFStringRef)AxsYouYouToolboxPreferencesChanged, NULL,
            CFNotificationSuspensionBehaviorDeliverImmediately);
        // Close the window between the first read and observer registration.
        dispatch_async(_reloadQueue, ^{ [self axs_youyoutoolbox_reload]; });
    }
    return self;
}

- (void)axs_youyoutoolbox_reload {
    self.snapshot = axs_youyoutoolbox_readPreferences();
    dispatch_async(dispatch_get_main_queue(), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:AxsYouYouToolboxPreferencesChanged object:self];
    });
}

- (id)axs_youyoutoolbox_valueForKey:(NSString *)key defaultValue:(id)defaultValue {
    return self.snapshot[key] ?: defaultValue;
}

- (BOOL)axs_youyoutoolbox_isEnabled {
    id value = [self axs_youyoutoolbox_valueForKey:@"enabled" defaultValue:@(NO)];
    return [value isKindOfClass:[NSNumber class]] ? [value boolValue] : NO;
}

- (void)dealloc {
    CFNotificationCenterRemoveEveryObserver(CFNotificationCenterGetDarwinNotifyCenter(),
                                            (__bridge const void *)self);
}

@end
