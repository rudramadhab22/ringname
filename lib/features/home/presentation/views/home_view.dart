import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/routing/app_routes.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RingName - Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Get.toNamed(AppRoutes.settings),
          )
        ],
      ),
      body: const Center(
        child: Text('Saved Contacts Will Appear Here'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(AppRoutes.addCaller),
        child: const Icon(Icons.add),
      ),
    );
  }
}
