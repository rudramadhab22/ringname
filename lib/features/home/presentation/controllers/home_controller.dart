import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../data/local/providers/preferences_helper.dart';
import '../../../../core/utils/native_bridge.dart';

class HomeController extends GetxController {
  final nameController = TextEditingController();
  final isSaving = false.obs;

  @override
  void onInit() {
    super.onInit();
    _loadCurrentGlobalName();
    _requestPermissions();
  }

  Future<void> _requestPermissions() async {
    // Request standard permissions
    await [
      Permission.phone,
      Permission.contacts,
    ].request();

    // System Alert Window often requires a separate intent prompt
    if (await Permission.systemAlertWindow.isDenied) {
      await Permission.systemAlertWindow.request();
    }
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
    
    // Save to SharedPreferences (Flutter side)
    await PreferencesHelper.setDefaultCallerName(newName);
    
    // Sync to Native Android OS so background services can read it
    await NativeBridge.syncGlobalName(newName);
    
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
