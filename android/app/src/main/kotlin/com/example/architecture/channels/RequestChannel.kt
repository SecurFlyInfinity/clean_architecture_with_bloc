package com.example.architecture.channels

import android.content.Intent
import com.example.architecture.app_constants.AppConstants
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class RequestChannel : FlutterActivity() {

    companion object {
        const val CHANNEL_ID = "channels/main"
        const val API_KEY = "apiKey"
    }

    fun platformConfig(flutterEngine: FlutterEngine){
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL_ID).setMethodCallHandler { call, result ->

            when (call.method) {
                API_KEY -> {
                    result.success(AppConstants.Keys.getApiKey())
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }
}