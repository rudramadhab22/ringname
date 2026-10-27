import 'package:flutter/material.dart';

class AddCallerView extends StatelessWidget {
  const AddCallerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Caller'),
      ),
      body: const Center(
        child: Text('Add Custom Caller Name Form'),
      ),
    );
  }
}
