#import "RTNAnimatedImage.h"

#import <react/renderer/components/RTNAnimatedImageSpecs/ComponentDescriptors.h>
#import <react/renderer/components/RTNAnimatedImageSpecs/EventEmitters.h>
#import <react/renderer/components/RTNAnimatedImageSpecs/Props.h>
#import <react/renderer/components/RTNAnimatedImageSpecs/RCTComponentViewHelpers.h>

#import "RCTFabricComponentsPlugins.h"

#import "FLAnimatedImage.h"

using namespace facebook::react;

@interface RTNAnimatedImage () <RCTRTNAnimatedImageViewProtocol>
@end

@implementation RTNAnimatedImage {
  FLAnimatedImageView *_view;
  FLAnimatedImage *_image;
}

+ (ComponentDescriptorProvider)componentDescriptorProvider
{
  return concreteComponentDescriptorProvider<RTNAnimatedImageComponentDescriptor>();
}

- (instancetype)initWithFrame:(CGRect)frame
{
  if (self = [super initWithFrame:frame]) {
    static const auto defaultProps = std::make_shared<const RTNAnimatedImageProps>();
    _props = defaultProps;
    _view = [[FLAnimatedImageView alloc] init];
    self.contentView = _view;
  }

  return self;
}

- (void)updateProps:(Props::Shared const &)props oldProps:(Props::Shared const &)oldProps
{
  const auto &oldViewProps = *std::static_pointer_cast<RTNAnimatedImageProps const>(_props);
  const auto &newViewProps = *std::static_pointer_cast<RTNAnimatedImageProps const>(props);

  if (oldViewProps.url != newViewProps.url) {
    _image = [FLAnimatedImage animatedImageWithGIFData:[NSData dataWithContentsOfURL:[NSURL URLWithString:newViewProps.url]]];
    _view.image = _image;
  }

  [super updateProps:props oldProps:oldProps];
}

@end

Class<RCTComponentViewProtocol> RTNAnimatedImageCls(void)
{
  return RTNAnimatedImage.class;
}