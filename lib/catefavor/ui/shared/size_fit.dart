import 'dart:ui';

class SizeFit {
  static double physicalWidth;
  static double physicalHeight;
  static double screenWidth;
  static double screenHeight;
  static double dpr;
  static double statusHeight;
  static double rpx;
  static double px;

  static void initialize({double standardSize = 750}) {
    // 1. 手机屏幕大小（物理分辨率）
    physicalWidth = window.physicalSize.width;
    physicalHeight = window.physicalSize.height;

    // 2. 获取dpr
    dpr = window.devicePixelRatio;

    // 3. 手机屏幕大小（逻辑分辨率）
    screenWidth = physicalWidth / dpr;
    screenHeight = physicalHeight / dpr;

    // 4. 状态栏高度（逻辑分辨率）
    statusHeight = window.padding.top / dpr;

    rpx = screenWidth / standardSize;
    px = screenWidth / standardSize * 2;
  }

  static double setRpx(double size) {
    return rpx * size;
  }

  static double setPx(double size) {
    return px * size;
  }

}
