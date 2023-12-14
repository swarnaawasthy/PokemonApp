import 'package:flutter/material.dart';
import 'package:pokemon/presentation_layer/home_screen.dart';
import 'package:get/get.dart';

import 'application_layer/home_binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pokemon App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const HomeScreen(),
      initialBinding: HomeBinding(),
    );
  }
}

