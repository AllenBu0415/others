import 'package:flutter/material.dart';
import 'package:others/pages/navigation.dart';
import 'package:others/pages/stencilArea/stencilArea.dart';
import 'package:others/pages/stencilArea/stencilAreaResult.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "打工崽工具箱",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      routes: {
        '/': (context)=> const NavigationPage(),
        '/StencilAreaPage': (context) => const StencilAreaPage(),
        '/StencilAreaResultPage': (context) => const StencilAreaResultPage(),
      },
    );
  }
}
