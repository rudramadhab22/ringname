package com.ringname.ringname

import android.app.Service
import android.content.Context
import android.content.Intent
import android.graphics.PixelFormat
import android.os.Build
import android.os.IBinder
import android.view.Gravity
import android.view.LayoutInflater
import android.view.View
import android.view.WindowManager
import android.widget.Button
import android.widget.TextView

class OverlayService : Service() {

    private lateinit var windowManager: WindowManager
    private lateinit var overlayView: View

    override fun onBind(intent: Intent?): IBinder? {
        return null
    }

    override fun onCreate() {
        super.onCreate()
        
        windowManager = getSystemService(Context.WINDOW_SERVICE) as WindowManager
        
        // Inflate the custom layout
        overlayView = LayoutInflater.from(this).inflate(R.layout.caller_overlay, null)
        
        // Get the saved global name from SharedPreferences
        val sharedPref = getSharedPreferences("RingNamePrefs", Context.MODE_PRIVATE)
        val globalName = sharedPref.getString("global_caller_name", "RingName User")
        
        // Set the name in the TextView
        val nameTextView = overlayView.findViewById<TextView>(R.id.caller_name_text)
        nameTextView.text = globalName

        // Setup Dismiss button
        val closeButton = overlayView.findViewById<Button>(R.id.btn_close)
        closeButton.setOnClickListener {
            stopSelf()
        }

        // Configure Window Layout Params
        val layoutFlag = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY
        } else {
            @Suppress("DEPRECATION")
            WindowManager.LayoutParams.TYPE_PHONE
        }

        val params = WindowManager.LayoutParams(
            WindowManager.LayoutParams.MATCH_PARENT,
            WindowManager.LayoutParams.WRAP_CONTENT,
            layoutFlag,
            WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE or
            WindowManager.LayoutParams.FLAG_NOT_TOUCH_MODAL or
            WindowManager.LayoutParams.FLAG_SHOW_WHEN_LOCKED or
            WindowManager.LayoutParams.FLAG_TURN_SCREEN_ON,
            PixelFormat.TRANSLUCENT
        )

        // Show the overlay at the top of the screen
        params.gravity = Gravity.TOP or Gravity.CENTER_HORIZONTAL
        params.y = 100 // Slight margin from top

        windowManager.addView(overlayView, params)
    }

    override fun onDestroy() {
        super.onDestroy()
        if (::overlayView.isInitialized && overlayView.windowToken != null) {
            windowManager.removeView(overlayView)
        }
    }
}
