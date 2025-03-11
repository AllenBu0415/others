import 'package:flutter/material.dart';

class NavigationPage extends StatefulWidget{
  const NavigationPage({super.key});

  final String title = '打工崽工具箱';

  @override
  State<NavigationPage> createState()=> _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(
            widget.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                      onTap: ()=>{
                        Navigator.pushNamed(context, '/StencilAreaPage')
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            width: 64,
                            child: Image.asset("assets/images/nav_stencilArea_icon.jpg"),
                          ),
                          const Padding(
                              padding: EdgeInsets.all(8),
                              child: Text("模板用量计算器")
                          )
                        ],
                      )
                  )
                ],
              )
            ],
          ),
        )
    );
  }
}