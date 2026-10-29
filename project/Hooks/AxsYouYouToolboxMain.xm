#import <UIKit/UIKit.h>
#import "AxsYouYouToolboxConfig.h"
#import "AxsYouYouToolboxPrivate.h"

// This sample matches the default SpringBoard filter. Replace both together.
%hook SpringBoard

- (void)applicationDidFinishLaunching:(id)application {
    %orig;
    if (![[AxsYouYouToolboxConfig axs_youyoutoolbox_shared] axs_youyoutoolbox_isEnabled]) {
        return;
    }
    // Add the plugin's launch behavior here.
}

%end

%ctor {
    @autoreleasepool {
        // Readers load a snapshot; they never write default preferences.
        [AxsYouYouToolboxConfig axs_youyoutoolbox_shared];
    }
}
