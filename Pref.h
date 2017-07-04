#if TARGET_OS_SIMULATOR
#define realPrefPath(domain) [NSString stringWithFormat:@"%@/Library/Preferences/%@.plist", NSHomeDirectory(), domain]
#else
#define realPrefPath(domain) [NSString stringWithFormat:@"/User/Library/Preferences/%@.plist"]
#endif
