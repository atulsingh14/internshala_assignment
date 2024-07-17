import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/filter_controller.dart';
import 'controller/internship_controller.dart';
import 'views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Internshala Search',
      initialBinding: BindingsBuilder(() {
        Get.put(InternshipController());
        Get.put(FilterController());
      }),
      home: const SplashScreen(),
      theme: ThemeData(scaffoldBackgroundColor: Colors.white24),
    );
  }
}
