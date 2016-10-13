#import "ARRefineOptionsModule.h"

#import <React/RCTBridge.h>
#import <React/RCTUIManager.h>
#import <React/UIView+React.h>
#import <React/RCTRootView.h>

@implementation ARRefineOptionsModule

@synthesize bridge = _bridge;

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(triggerRefinePanel:(nonnull NSNumber *)reactTag metadata:(nonnull NSDictionary *)info resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)
{
  dispatch_async(dispatch_get_main_queue(), ^{
    UIView *rootView = [self.bridge.uiManager viewForReactTag:reactTag];
    while (rootView.superview && ![rootView isKindOfClass:RCTRootView.class]) {
      rootView = rootView.superview;
    }
    
    self.triggerRefine(info, rootView.reactViewController, resolve, reject);
  });
}

@end
