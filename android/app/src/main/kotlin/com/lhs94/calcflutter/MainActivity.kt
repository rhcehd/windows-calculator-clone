package com.lhs94.calcflutter

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import org.mosdev.stringcalculator.StringCalculator

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.lhs94.calcflutter/calculate"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        GeneratedPluginRegistrant.registerWith(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            call, result ->
            if(call.method == "calculate") {
                val res = calculate(call.argument<String>("calc"))
                result.success(res)
            }
        }
    }

    private fun calculate(s:String?) : String {
        val calculator = StringCalculator()
        var result = calculator.calculate(s)
        if (result.endsWith(".0")) {
            result = result.substring(0, result.length - 2)
        }

        return result
    }

}
