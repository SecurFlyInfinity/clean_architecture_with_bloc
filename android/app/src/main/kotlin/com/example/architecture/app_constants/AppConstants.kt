package com.example.architecture.app_constants

class AppConstants {
    object Keys {
        init {
            System.loadLibrary("native-lib")
        }

        external fun getApiKey(): String
    }
}