import 'package:flutter/material.dart';
import 'package:others/modules/CalculationData.dart';

class StencilAreaPage extends StatefulWidget {
  const StencilAreaPage({super.key});

  final String title = '模板用量计算器';

  @override
  State<StencilAreaPage> createState() => _StencilAreaPageState();
}

class _StencilAreaPageState extends State<StencilAreaPage> {
  final _formKey = GlobalKey<FormState>();

  final stencilWidthController = TextEditingController();
  final stencilHeightController = TextEditingController();
  final areaWidthController = TextEditingController();
  final areaHeightController = TextEditingController();

  void _showSimpleDialog(BuildContext context) {
    CalculationData calculationDataObj =   CalculationData(
        stencilWidth: double.parse(stencilWidthController.text),
        stencilHeight: double.parse(stencilHeightController.text),
        areaWidth: double.parse(areaWidthController.text),
        areaHeight: double.parse(areaHeightController.text)
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('计算模式'),
          children: <Widget>[
            SimpleDialogOption(
              child: const Text('横式放置'),
              onPressed: () {
                calculationDataObj.isRevolve = false;

                Navigator.pushReplacementNamed(
                    context,
                    "/StencilAreaResultPage",
                    arguments: calculationDataObj
                );
              },
            ),
            SimpleDialogOption(
              child: const Text('竖式放置'),
              onPressed: () {
                calculationDataObj.isRevolve = true;

                Navigator.pushReplacementNamed(
                    context,
                    "/StencilAreaResultPage",
                    arguments: calculationDataObj
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    stencilWidthController.value = const TextEditingValue(text: '10');
    stencilHeightController.value = const TextEditingValue(text: '4');
    areaWidthController.value = const TextEditingValue(text: '124');
    areaHeightController.value = const TextEditingValue(text: '62');

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(
            widget.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body:  Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "所用模版",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          TextFormField(
                            decoration:const InputDecoration(
                                labelText: "板材宽（mm）",
                                hintText: "请输入板材宽度"
                            ),
                            controller: stencilWidthController,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '板材宽度是必填项';
                              }
                              final double? parsedValue = double.tryParse(value);
                              if (parsedValue == null) {
                                return '请输入一个有效的数值';
                              }
                              return null; // 没有错误
                            },
                          ),
                          TextFormField(
                            decoration:const InputDecoration(
                                labelText: "板材长（mm）",
                                hintText: "请输入板材长度"
                            ),
                            controller: stencilHeightController,
                            keyboardType:TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '板材长度是必填项';
                              }
                              final double? parsedValue = double.tryParse(value);
                              if (parsedValue == null) {
                                return '请输入一个有效的数值';
                              }
                              return null; // 没有错误
                            },
                          )
                        ],
                      ),
                    ),
                    const Text(
                      "铺设面积",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          TextFormField(
                            decoration:const InputDecoration(
                                labelText: "铺设面积宽（mm）",
                                hintText: "请输入铺设面积宽度"
                            ),
                            controller: areaWidthController,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '铺设面积宽度是必填项';
                              }
                              final double? parsedValue = double.tryParse(value);
                              if (parsedValue == null) {
                                return '请输入一个有效的数值';
                              }
                              return null; // 没有错误
                            },
                          ),
                          TextFormField(
                            decoration:const InputDecoration(
                                labelText: "铺设面积长（mm）",
                                hintText: "请输入铺设面积长度"
                            ),
                            controller: areaHeightController,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '铺设面积长度是必填项';
                              }
                              final double? parsedValue = double.tryParse(value);
                              if (parsedValue == null) {
                                return '请输入一个有效的数值';
                              }
                              return null; // 没有错误
                            },
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:WidgetStateProperty.all(Theme.of(context).colorScheme.primary),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _showSimpleDialog(context);
                          }
                        },
                        child: const Text('开始计算', style: TextStyle(color: Colors.white)),
                      ),
                    )
                  ],
                )
            )
        )
    );
  }

  @override
  void dispose() {
    // 清理控制器以避免内存泄漏
    stencilWidthController.dispose();
    stencilHeightController.dispose();
    areaWidthController.dispose();
    areaHeightController.dispose();
    super.dispose();
  }
}



