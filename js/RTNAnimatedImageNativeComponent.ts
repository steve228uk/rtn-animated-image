import type { ViewProps } from 'ViewPropTypes';
import type { HostComponent } from 'react-native';
import codegenNativeComponent from 'react-native/Libraries/Utilities/codegenNativeComponent';

export interface NativeProps extends ViewProps {
  url?: string;
}

export default codegenNativeComponent<NativeProps>(
  'RTNAnimatedImage',
) as HostComponent<NativeProps>;