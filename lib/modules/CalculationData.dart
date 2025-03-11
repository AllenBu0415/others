class CalculationData {
  double stencilWidth;
  double stencilHeight;
  double areaWidth;
  double areaHeight;
  bool isRevolve = false;

  // 普通构造函数
  CalculationData({
    required this.stencilWidth,
    required this.stencilHeight,
    required this.areaWidth,
    required this.areaHeight
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
    data['isRevolve'] = isRevolve;
    return data;
  }

  // 模板框高切换
  void conversion(){
    isRevolve = !isRevolve;
  }

  // 获取整板尺寸
  String getIntactSize(){
    return isRevolve? "${stencilHeight}mm * ${stencilWidth}mm" : "${stencilWidth}mm * ${stencilHeight}mm";
  }

  // 获取整板数量
  String getIntactCount(){
    double row = 0;
    double column = 0;
    if(isRevolve){
      row =areaWidth / stencilHeight;
      column = areaHeight / stencilWidth;
      return "${row.floor() * column.floor()}块";
    }else{
      row =areaWidth / stencilWidth;
      column = areaHeight / stencilHeight;
      return "${row.floor() * column.floor()}块";
    }
  }

  // 是否显示横补板
  bool isShowHorizontal(){
    int rowArea = 0;

    if(isRevolve){
      rowArea =((areaWidth / stencilHeight).floor() * stencilHeight.floor());
    }else{
      rowArea =((areaWidth / stencilWidth).floor() * stencilWidth.floor());
    }

    return (areaWidth - rowArea) > 0;
  }

  // 获取横补板尺寸
  String getHorizontalSize(){
    if(isRevolve){
      int rowArea =((areaWidth / stencilHeight).floor() * stencilHeight.floor());
      return "${stencilWidth}mm * ${areaWidth - rowArea}mm";
    }else{
      int rowArea =((areaWidth / stencilWidth).floor() * stencilWidth.floor());
      return "${stencilHeight}mm * ${areaWidth - rowArea}mm";
    }
  }

  // 获取横补板数量
  String getHorizontalCount(){
    double row = 0;
    if(isRevolve){
      row =areaWidth / stencilHeight;
      return "${row.floor()}块";
    }else{
      row =areaWidth / stencilWidth;
      return "${row.floor()}块";
    }
  }

  // 是否显示竖补板
  bool isShowVertical(){
    int columnArea = 0;

    if(isRevolve){
      columnArea =((areaHeight / stencilWidth).floor() * stencilWidth.floor());
    }else{
      columnArea =((areaHeight / stencilHeight).floor() * stencilHeight.floor());
    }

    return (areaHeight - columnArea) >0;
  }

  // 获取竖补板尺寸
  String getVerticalSize(){
    if(isRevolve){
      int columnArea =((areaHeight / stencilWidth).floor() * stencilWidth.floor());
      return "${stencilHeight}mm * ${areaHeight - columnArea}mm";
    }else{
      int columnArea =((areaHeight / stencilHeight).floor() * stencilHeight.floor());
      return "${stencilWidth}mm * ${areaHeight - columnArea}mm";
    }
  }

  // 获取竖补板数量
  String getVerticalCount(){
    double row = 0;
    if(isRevolve){
      row =areaHeight / stencilWidth;
      return "${row.floor()}块";
    }else{
      row =areaHeight / stencilHeight ;
      return "${row.floor()}块";
    }
  }

  // 获取角板尺寸
  String getHornSize(){
    int rowArea = 0;
    int columnArea = 0;

    if(isRevolve){
       rowArea =((areaWidth / stencilHeight).floor() * stencilHeight.floor());
       columnArea =((areaHeight / stencilWidth).floor() * stencilWidth.floor());
    }else{
       rowArea =((areaWidth / stencilWidth).floor() * stencilWidth.floor());
       columnArea =((areaHeight / stencilHeight).floor() * stencilHeight.floor());
    }

    return "${areaWidth - rowArea}mm * ${areaHeight - columnArea}mm";
  }
}