class CalculationData {
  double stencilWidth;
  double stencilHeight;
  double areaWidth;
  double areaHeight;
  bool isReverse = false;

  // 普通构造函数
  CalculationData({
    required this.stencilWidth,
    required this.stencilHeight,
    required this.areaWidth,
    required this.areaHeight,
  });

  // 工厂构造函数，用于从JSON数据创建CalculationData实例
  factory CalculationData.fromJson(Map<String, dynamic> json) {
    return CalculationData(
      stencilWidth: json['stencilWidth'] as double,
      stencilHeight: json['stencilHeight'] as double,
      areaWidth: json['areaWidth'] as double,
      areaHeight: json['areaHeight'] as double,
    );
  }

  // 将对象转换为JSON映射的方法
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['stencilWidth'] = stencilWidth;
    data['stencilHeight'] = stencilHeight;
    data['areaWidth'] = areaWidth;
    data['areaHeight'] = areaHeight;
    return data;
  }

  // 获取当前有效的 stencilWidth（如果 isReverse 为 true，则返回 stencilHeight）
  double get effectiveStencilWidth => isReverse ? stencilHeight : stencilWidth;

  // 获取当前有效的 stencilHeight（如果 isReverse 为 true，则返回 stencilWidth）
  double get effectiveStencilHeight => isReverse ? stencilWidth : stencilHeight;

  // 获取整板尺寸
  String getIntactSize() {
    return "${effectiveStencilWidth}mm X ${effectiveStencilHeight}mm";
  }

  // 获取整板数量
  int getIntactCount() {
    double widthSum = areaWidth / effectiveStencilWidth;
    double heightSum = areaHeight / effectiveStencilHeight;

    return (widthSum.toInt() * heightSum.toInt());
  }

  // 是否显示横补板
  bool isShowHorizontal() {
    double extraWidth = areaWidth % effectiveStencilWidth;
    return extraWidth > 0;
  }

  // 获取横补板尺寸
  String getHorizontalSize() {
    double extraWidth = areaWidth % effectiveStencilWidth;
    return "${extraWidth}mm X ${effectiveStencilHeight}mm";
  }

  // 获取横补板数量
  int getHorizontalCount() {
    double heightSum = areaHeight / effectiveStencilHeight;
    return heightSum.toInt();
  }

  // 是否显示竖补板
  bool isShowVertical() {
    double extraHeight = areaHeight % effectiveStencilHeight;
    return extraHeight > 0;
  }

  // 获取竖补板尺寸
  String getVerticalSize() {
    double extraHeight = areaHeight % effectiveStencilHeight;
    return "${effectiveStencilWidth}mm X ${extraHeight}mm";
  }

  // 获取竖补板数量
  int getVerticalCount() {
    double widthSum = areaWidth / effectiveStencilWidth;
    return widthSum.toInt();
  }

  // 获取角板尺寸
  String getHornSize() {
    double extraWidth = areaWidth % effectiveStencilWidth;
    double extraHeight = areaHeight % effectiveStencilHeight;
    return "${extraWidth}mm X ${extraHeight}mm";
  }
}