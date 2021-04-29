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

// MediaQuery不能在App中获取，只能在Page中获取
// final width = MediaQuery.of(context).size.width;
// final height = MediaQuery.of(context).size.height;
// print("屏幕宽高：$width * $height");
// final statusHeight = MediaQuery.of(context).padding.top;
// final bottomNavigationBarHeight = MediaQuery.of(context).padding.bottom;
// print("状态栏高度：$statusHeight");
// print("底部导航栏高度：$bottomNavigationBarHeight");
}
