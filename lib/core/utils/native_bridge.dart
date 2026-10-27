import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';

class NativeBridge {
  // The channel name must exactly match the one configured in MainActivity.kt
  static const platform = MethodChannel('com.ringname.app/caller');

  /// Sends the updated global caller name to the native Android OS so it can 
  /// be used by the CallScreeningService later.
  static Future<void> syncGlobalName(String name) async {
    try {
      await platform.invokeMethod('syncName', {'name': name});
      if (kDebugMode) {
        print('Successfully synced name to native side: $name');
      }
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print("Failed to sync name to native side: '${e.message}'.");
      }
    }
  }
}
