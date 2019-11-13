#import <Preferences/PSListController.h>

@interface unlockSoundListController: PSListController {
}
@end

@implementation unlockSoundListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"unlockSound" target:self] retain];
	}
	return _specifiers;
}
@end
