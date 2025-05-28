import 'package:flutter/material.dart';
import 'package:others/pages/navigation.dart';
import 'package:others/pages/stencilArea/stencil_area.dart';
import 'package:others/pages/stencilArea/stencil_area_result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DaGoZai",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
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
