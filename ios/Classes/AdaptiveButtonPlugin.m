#import "AdaptiveButtonPlugin.h"
#if __has_include(<adaptive_button/adaptive_button-Swift.h>)
#import <adaptive_button/adaptive_button-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "adaptive_button-Swift.h"
#endif

@implementation AdaptiveButtonPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAdaptiveButtonPlugin registerWithRegistrar:registrar];
}
@end
