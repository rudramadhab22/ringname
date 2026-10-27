import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/local/providers/preferences_helper.dart';

class HomeController extends GetxController {
  final nameController = TextEditingController();
  final isSaving = false.obs;

  @override
  void onInit() {
    super.onInit();
    _loadCurrentGlobalName();
  }

  Future<void> _loadCurrentGlobalName() async {
    final currentName = await PreferencesHelper.getDefaultCallerName();
    nameController.text = currentName;
  }

  Future<void> saveGlobalName() async {
    final newName = nameController.text.trim();
    if (newName.isEmpty) {
      Get.snackbar(
        'Error',
        'Name cannot be empty',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
      );
      return;
    }

    isSaving.value = true;
    
    // Save to SharedPreferences
    await PreferencesHelper.setDefaultCallerName(newName);
    
    isSaving.value = false;
    
    Get.snackbar(
      'Success',
      'Global Caller Name updated successfully!',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.withOpacity(0.8),
      colorText: Colors.white,
    );
  }

  @override
  void onClose() {
    nameController.dispose();
    super.onClose();
  }
}
