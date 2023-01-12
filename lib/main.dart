import 'package:flutter/material.dart';


import 'core/service/service_locator.dart';
import 'feature/home_page/presentation/pages/home_page.dart';


void main() {
  ServiceLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Social Media',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home:  HomePage(),
    );
  }
}


