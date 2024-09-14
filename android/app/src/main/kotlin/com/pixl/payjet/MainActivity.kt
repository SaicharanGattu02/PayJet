package com.pixl.payjet

import android.os.Bundle
import android.provider.Settings
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterFragmentActivity() {
    private val CHANNEL = "com.pixl.payjet/security"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->
                if (call.method == "isUsbDebuggingEnabled") {
                    val isUsbDebuggingEnabled = isUsbDebuggingEnabled()
                    result.success(isUsbDebuggingEnabled)
                } else {
                    result.notImplemented()
                }
            }
    }

    private fun isUsbDebuggingEnabled(): Boolean {
        return Settings.Secure.getInt(
            contentResolver,
            Settings.Secure.ADB_ENABLED, 0
        ) != 0
    }
}
