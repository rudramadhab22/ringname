import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/routing/app_pages.dart';
import 'core/routing/app_routes.dart';

void main() {
  runApp(const RingNameApp());
}

class RingNameApp extends StatelessWidget {
  const RingNameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'RingName',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.home,
      getPages: AppPages.pages,
    );
  }
}
