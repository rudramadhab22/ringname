package com.ringname.ringname

import android.content.Context
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.util.Log

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.ringname.app/caller"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "syncName") {
                val name = call.argument<String>("name")
                
                if (name != null) {
                    // Save it to Android's native SharedPreferences so the background 
                    // CallScreeningService can access it even when the Flutter app is closed.
                    val sharedPref = getSharedPreferences("RingNamePrefs", Context.MODE_PRIVATE)
                    with (sharedPref.edit()) {
                        putString("global_caller_name", name)
                        apply()
                    }
                    
                    Log.d("RingNameNative", "Successfully saved global name: $name")
                    result.success("Name synced to native preferences successfully")
                } else {
                    result.error("UNAVAILABLE", "Name cannot be null", null)
                }
            } else {
                result.notImplemented()
            }
        }
    }
}
