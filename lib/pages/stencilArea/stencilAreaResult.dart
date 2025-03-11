import 'package:flutter/material.dart';
import 'package:others/modules/CalculationData.dart';

class StencilAreaResultPage extends StatefulWidget{
  const StencilAreaResultPage({super.key});

  final String title = '计算结果';

  @override
  State<StencilAreaResultPage> createState() => _StencilAreaResultPageState();
}

class _StencilAreaResultPageState extends State<StencilAreaResultPage>{
  @override
  Widget build(BuildContext context) {
    CalculationData? calculationDataObj = ModalRoute.of(context)!.settings.arguments as CalculationData?;

    print(calculationDataObj?.toJson());

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(
            widget.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Image.asset("assets/images/stencilArea_template.png"),
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("整板：",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,)),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("尺寸：${calculationDataObj?.getIntactSize()??'未知'}"),
                                          Text("数量：${calculationDataObj?.getIntactCount()??'未知'}"),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Visibility(
                                  visible: calculationDataObj!.isShowHorizontal(),
                                  child:  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text("横补板：",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,)),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("尺寸：${calculationDataObj?.getHorizontalSize()??'未知'}"),
                                            Text("数量：${calculationDataObj?.getHorizontalCount()??'未知'}"),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Visibility(
                                  visible: calculationDataObj!.isShowVertical(),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text("竖补板：",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,)),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("尺寸：${calculationDataObj?.getVerticalSize()??'未知'}"),
                                            Text("数量：${calculationDataObj?.getVerticalCount()??'未知'}"),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Visibility(
                                  visible: calculationDataObj!.isShowVertical() && calculationDataObj!.isShowHorizontal(),
                                  child:  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text("角板：",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("尺寸：${calculationDataObj?.getHornSize()??'未知'}"),
                                            const Text("数量：1块"),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                        ),
                      ],
                    ),
                  )
              )
            ],
          ),)
    );
  }


}