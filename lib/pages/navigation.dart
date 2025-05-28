import 'package:flutter/material.dart';

class NavigationPage extends StatefulWidget{
  const NavigationPage({super.key});

  final String title = 'DaGonZai';

  @override
  State<NavigationPage> createState()=> _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              GestureDetector(
                  onTap: ()=>{
                    Navigator.pushNamed(context, '/StencilAreaPage')
                  },
                  child:Container(
                      width: double.infinity,
                      decoration:BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(16.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withValues(alpha: 0.5),
                            offset: const Offset(2, 2),
                            blurRadius: 16,
                          ),
                        ],
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 100,
                                child: Image.asset("assets/images/nav_stencilArea_icon.jpg"),
                              ),
                              const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child:SizedBox(
                                    width: 180,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "模板用量计算器",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Divider(color: Colors.transparent),
                                        Text(
                                          "根据建筑面子的宽高，根据不同的放置模式。计算出各种需要的板材数量",
                                          style: TextStyle(
                                            color: Colors.black54,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                              )
                            ],
                          )
                      )
                  )
              )
            ],
          ),
        )
    );
  }
}