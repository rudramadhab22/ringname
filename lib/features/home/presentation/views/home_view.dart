import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize controller for this view
    final controller = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('RingName'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(
                Icons.contact_phone_rounded,
                size: 80,
                color: Colors.deepPurple,
              ),
              const SizedBox(height: 32),
              Obx(() => controller.hasAllPermissions.value
                  ? const SizedBox.shrink()
                  : Container(
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.only(bottom: 24),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade100,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.orange.shade300),
                      ),
                      child: Column(
                        children: [
                          const Row(
                            children: [
                              Icon(Icons.warning_amber_rounded, color: Colors.deepOrange),
                              SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  'Missing Permissions',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepOrange,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'RingName needs Phone, Contacts, and "Display over other apps" permissions to work.',
                            style: TextStyle(color: Colors.deepOrange),
                          ),
                          const SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: controller.openSettings,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              foregroundColor: Colors.white,
                              elevation: 0,
                            ),
                            child: const Text('Open Settings'),
                          )
                        ],
                      ),
                    )),
              const Text(
                'Set Global Caller Name',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                'This name will be displayed for ANY incoming call from a number that is not saved in your contacts.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              TextField(
                controller: controller.nameController,
                decoration: InputDecoration(
                  labelText: 'Global Name',
                  hintText: 'e.g. Unknown Caller',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.person_outline),
                ),
                textCapitalization: TextCapitalization.words,
              ),
              const SizedBox(height: 32),
              Obx(() => ElevatedButton(
                onPressed: controller.isSaving.value
                    ? null
                    : controller.saveGlobalName,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                ),
                child: controller.isSaving.value
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Text(
                        'Save Name',
                        style: TextStyle(fontSize: 18),
                      ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
