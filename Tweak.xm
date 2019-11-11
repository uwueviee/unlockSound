#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

#define kBundlePath @"/Library/MobileSubstrate/DynamicLibraries/gq.skye.unlocksound.bundle"
#define kSettingsPath [NSHomeDirectory() stringByAppendingPathComponent:@"/Library/Preferences/gq.skye.unlocksound.plist"]

@interface SBLockScreenViewControllerBase : UIViewController
@end

%group normal
	%hook SBLockScreenViewControllerBase
	    - (void)prepareForUIUnlock {
	        %orig;

			NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:kSettingsPath];

	        BOOL isEnabled = [[prefs objectForKey:@"enabled"] boolValue];

	        if (isEnabled) {
		        NSBundle *bundle = [[[NSBundle alloc] initWithPath:kBundlePath] autorelease];

		        NSString *soundFilePath = [bundle pathForResource:@"unlockSound" ofType:@"m4a"];
		        NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];

		        AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL error:nil];

		        player.numberOfLoops = 0;

		        [player play];
	        }

	        [prefs release];
	    }
	%end
%end

%ctor {
	float version = [[[UIDevice currentDevice] systemVersion] floatValue];
	if (version >= 10) {
		%init(normal);
	}
}
