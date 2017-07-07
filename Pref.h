#if TARGET_OS_SIMULATOR
#define realPrefPath(domain) [NSString stringWithFormat:@"%@/Library/Preferences/%@.plist", @(getenv("SIMULATOR_SHARED_RESOURCES_DIRECTORY")), domain]
#else
#define realPrefPath(domain) [NSString stringWithFormat:@"/User/Library/Preferences/%@.plist"]
#endif
