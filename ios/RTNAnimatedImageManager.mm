#import <React/RCTLog.h>
#import <React/RCTUIManager.h>
#import <React/RCTViewManager.h>

@interface RTNAnimagedImageManager : RCTViewManager
@end

@implementation RTNAnimagedImageManager

RCT_EXPORT_MODULE(RTNAnimagedImage)

RCT_EXPORT_VIEW_PROPERTY(url, NSString)

@end