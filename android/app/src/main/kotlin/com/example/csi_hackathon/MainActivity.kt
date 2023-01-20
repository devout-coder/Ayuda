package com.example.csi_hackathon

import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import android.net.Uri
import android.provider.ContactsContract
import android.speech.tts.TextToSpeech
import android.util.Log
import androidx.annotation.NonNull
import androidx.core.app.NotificationCompat
import androidx.core.content.ContextCompat
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import java.lang.String
import java.util.*

class MainActivity : FlutterActivity(), TextToSpeech.OnInitListener {
    private var tts: TextToSpeech? = null


    override fun onInit(status: Int) {
        Log.d("debugging", "tts initialized")
        if (status == TextToSpeech.SUCCESS) {
            val result = tts!!.setLanguage(Locale.US)
            if (result == TextToSpeech.LANG_MISSING_DATA || result == TextToSpeech.LANG_NOT_SUPPORTED) {
                Log.d("debugging", "The Language not supported!")
            } else {
                Log.d("debugging", "The Language supported!")
            }
        } else {
            Log.d("debugging", "I am fucked")
        }
    }

    private fun speakOut(text: String) {
        tts!!.speak(text, TextToSpeech.QUEUE_FLUSH, null, "")
    }

    public override fun onDestroy() {
        // Shutdown TTS when
        // activity is destroyed
        if (tts != null) {
            tts!!.stop()
            tts!!.shutdown()
        }
        super.onDestroy()
    }


    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {

        super.configureFlutterEngine(flutterEngine)
        GeneratedPluginRegistrant.registerWith(flutterEngine);
        var methodChannel: MethodChannel? = null

        tts = TextToSpeech(this, this)

        methodChannel = MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            "alarms"
        )
        methodChannel.setMethodCallHandler { call: MethodCall?, result: MethodChannel.Result? ->
            if (call!!.method == "speak") {
                Log.d("debugging", "text should be spoken now")
                val text: String = call.argument<String>("text")!!
                speakOut(text)
            }
        }
    }
}
