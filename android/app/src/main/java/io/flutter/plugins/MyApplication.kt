package io.flutter.plugins

import android.content.Context
import android.support.multidex.MultiDex
import io.flutter.app.FlutterApplication

class MyApplication : FlutterApplication() {

    override fun attachBaseContext(base: Context) {
        super.attachBaseContext(base)
        MultiDex.install(this)
    }
}