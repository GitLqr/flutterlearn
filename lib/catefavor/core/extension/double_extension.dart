import 'package:flutterlearn/catefavor/ui/shared/size_fit.dart';

extension DoubleFit on double {
  // double px() {
  //   return SizeFit.setPx(this);
  // }
  //
  // double rpx() {
  //   return SizeFit.setRpx(this);
  // }

  double get px {
    return SizeFit.setPx(this);
  }

  double get rpx {
    return SizeFit.setRpx(this);
  }
}
