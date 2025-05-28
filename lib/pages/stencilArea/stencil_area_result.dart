import 'package:flutter/material.dart';
import 'package:others/modules/calculation_data.dart';

class StencilAreaResultPage extends StatefulWidget{
  const StencilAreaResultPage({super.key});

  final String title = '计算结果';

  @override
  State<StencilAreaResultPage> createState() => _StencilAreaResultPageState();
}

class _StencilAreaResultPageState extends State<StencilAreaResultPage>{
  bool isReverse = false;

  @override
  Widget build(BuildContext context) {
    CalculationData? calculationDataObj = ModalRoute.of(context)!.settings.arguments as CalculationData?;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset("assets/images/stencilArea_template.png"),
                  Positioned(
                      top: 28.0,
                      left: 24.0,
                      child:  Container(
                        width: isReverse? 40: 80,
                        height: isReverse? 80 : 40,
                        color: Theme.of(context).colorScheme.primary,
                      )
                  )
                ],
              ),
              SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding:const EdgeInsets.symmetric(vertical: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding:const EdgeInsets.symmetric(vertical: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // 整板
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("排版方式：",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,)),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(isReverse?"竖向":"横向"),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("整板：",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,)),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("尺寸：${calculationDataObj?.getIntactSize()}"),
                                          Text("数量：${calculationDataObj?.getIntactCount()}"),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                // 第一种尺寸
                                Visibility(
                                  visible:calculationDataObj!.isShowHorizontal(),
                                  child:  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text("横补板：",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,)),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("尺寸：${calculationDataObj.getHorizontalSize()}"),
                                            Text("数量：${calculationDataObj.getHorizontalCount()}"),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                // 第二种尺寸
                                Visibility(
                                  visible: calculationDataObj.isShowVertical(),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text("竖补板：",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,)),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("尺寸：${calculationDataObj.getVerticalSize()}"),
                                            Text("数量：${calculationDataObj.getVerticalCount()}"),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                // 第三种尺寸
                                Visibility(
                                  visible:  calculationDataObj.isShowHorizontal() && calculationDataObj.isShowVertical(),
                                  child:  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text("角板：",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("尺寸：${calculationDataObj.getHornSize()}"),
                                            const Text("数量：1"),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
                        ),
                      ],
                    ),
                  )
              ),
              const Spacer(),
              SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding:const EdgeInsets.only(bottom: 24.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:WidgetStateProperty.all(Theme.of(context).colorScheme.primary),
                      ),
                      onPressed: () {
                        calculationDataObj.isReverse = !isReverse;
                        setState(() {
                          isReverse = !isReverse;
                        });
                      },
                      child: const Text('切换排版方式', style: TextStyle(color: Colors.white)),
                    ),
                  )
              ),
            ],
          ),)
    );
  }
}