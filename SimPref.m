#import <Preferences/PSListController.h>
#import <Preferences/PSSpecifier.h>

@interface SimPrefController : PSListController
@end

@implementation SimPrefController

- (id)specifiers {
    if (_specifiers == nil) {
        _specifiers = [[self loadSpecifiersFromPlistName:@"SimPref" target:self] retain];
    }
    return _specifiers;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *rightButton = [[[UIBarButtonItem alloc] initWithTitle:@"Button" style:UIBarButtonItemStylePlain target:self action:@selector(rightButtonPressed)] autorelease];
    self.navigationItem.rightBarButtonItem = rightButton;
}

- (void)rightButtonPressed {
    HBLogDebug(@"Right button pressed");
}

@end
