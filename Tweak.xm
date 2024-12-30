#import <CoreFoundation/CoreFoundation.h>
#import <Foundation/Foundation.h>
#import <HBLog.h>
#import "Pref.h"

NSString *const domain = @"com.PS.simpreftweak";
NSString *const notification = @"com.PS.simpreftweak/ReloadPrefs";
int numberVal;
BOOL switchVal;

static void callback() {
    NSString *prefPath = realPrefPath(domain);
    HBLogDebug(@"Preference path: %@", prefPath);
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:prefPath];
    id r = dict[@"number"];
    numberVal = r ? [r intValue] : 0;
    r = dict[@"switch"];
    switchVal = r ? [r boolValue] : NO;
    HBLogDebug(@"Callback: number: %d, switch: %d", numberVal, switchVal);
}

%ctor {
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)callback, (CFStringRef)notification, NULL, CFNotificationSuspensionBehaviorCoalesce);
    callback();
}
