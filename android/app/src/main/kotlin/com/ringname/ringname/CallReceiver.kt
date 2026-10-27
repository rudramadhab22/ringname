package com.ringname.ringname

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.database.Cursor
import android.net.Uri
import android.provider.ContactsContract
import android.telephony.TelephonyManager
import android.util.Log

class CallReceiver : BroadcastReceiver() {

    override fun onReceive(context: Context, intent: Intent) {
        if (intent.action == TelephonyManager.ACTION_PHONE_STATE_CHANGED) {
            val state = intent.getStringExtra(TelephonyManager.EXTRA_STATE)
            
            // Only trigger when the phone is actively ringing
            if (state == TelephonyManager.EXTRA_STATE_RINGING) {
                val incomingNumber = intent.getStringExtra(TelephonyManager.EXTRA_INCOMING_NUMBER)
                
                if (incomingNumber != null) {
                    Log.d("RingNameNative", "Incoming call detected: $incomingNumber")
                    
                    if (!isContact(context, incomingNumber)) {
                        Log.d("RingNameNative", "Number is NOT in contacts. Launching overlay.")
                        
                        // Launch the overlay service
                        val serviceIntent = Intent(context, OverlayService::class.java)
                        context.startService(serviceIntent)
                    } else {
                        Log.d("RingNameNative", "Number is saved in contacts. Ignoring.")
                    }
                }
            } else if (state == TelephonyManager.EXTRA_STATE_IDLE || state == TelephonyManager.EXTRA_STATE_OFFHOOK) {
                // When call is answered or rejected/ends, stop the overlay service
                Log.d("RingNameNative", "Call ended or answered. Stopping overlay.")
                val serviceIntent = Intent(context, OverlayService::class.java)
                context.stopService(serviceIntent)
            }
        }
    }

    // Helper method to check if a phone number exists in native Android contacts
    private fun isContact(context: Context, phoneNumber: String): Boolean {
        var isContact = false
        val uri = Uri.withAppendedPath(
            ContactsContract.PhoneLookup.CONTENT_FILTER_URI,
            Uri.encode(phoneNumber)
        )
        val projection = arrayOf(ContactsContract.PhoneLookup.DISPLAY_NAME)
        
        var cursor: Cursor? = null
        try {
            cursor = context.contentResolver.query(uri, projection, null, null, null)
            if (cursor != null && cursor.moveToFirst()) {
                isContact = true
            }
        } catch (e: SecurityException) {
            Log.e("RingNameNative", "READ_CONTACTS permission denied.", e)
        } finally {
            cursor?.close()
        }
        
        return isContact
    }
}
