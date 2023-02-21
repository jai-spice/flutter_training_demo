package com.example.demo

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.widget.Toast
import androidx.annotation.NonNull


class MainActivity: FlutterActivity() {

    private val CHANNEL = "com.example.demo/test"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine){
        super.configureFlutterEngine(flutterEngine);

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            call, result ->
            if(call.method == "showToast"){
                val displayString: String = call.arguments as String
                Toast.makeText(context,displayString , Toast.LENGTH_SHORT).show()
                result.success(null)
            }
            else {
                result.notImplemented()
            }
        }
    }
}
