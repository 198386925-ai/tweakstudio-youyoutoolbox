#import <Foundation/Foundation.h>

@interface PocketGreeting : NSObject
+ (NSString *)message;
@end

@implementation PocketGreeting
+ (NSString *)message {
    return @"Hello from iPhone";
}
@end
