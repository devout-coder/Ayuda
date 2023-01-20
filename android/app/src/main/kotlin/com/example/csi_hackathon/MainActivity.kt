package com.example.csi_hackathon

import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.content.Intent
import android.net.Uri
import android.provider.ContactsContract
import android.util.Log
import androidx.annotation.NonNull
import androidx.core.app.NotificationCompat
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import java.lang.String

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        GeneratedPluginRegistrant.registerWith(flutterEngine);
        var methodChannel: MethodChannel? = null
        val mChannel = NotificationChannel("alarms", "Alarms", NotificationManager.IMPORTANCE_HIGH)
        mChannel.description = "This pertains to all the alarms set by the user"
        val notificationManager = getSystemService(NOTIFICATION_SERVICE) as NotificationManager
        notificationManager.createNotificationChannel(mChannel)

        val b: NotificationCompat.Builder = NotificationCompat.Builder(context, "alarms")
        val intent = Intent(Intent.ACTION_VIEW)
        val uri: Uri =
            Uri.withAppendedPath(ContactsContract.Contacts.CONTENT_URI, String.valueOf(7057252707))
        intent.setData(uri)

        b.setSmallIcon(R.drawable.launch_background)
            .setContentTitle("Tap me for any help during an emergency situation")
//            .setStyle(
//                NotificationCompat.BigTextStyle().bigText(notifString)
//            )
            .setPriority(NotificationCompat.PRIORITY_MAX)
            .setFullScreenIntent(
                PendingIntent.getActivity(
                    context,
                    0,
                    intent,
                    PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
                ), true
            )
            .setAutoCancel(true)

        methodChannel = MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            "alarms"
        )
        methodChannel.setMethodCallHandler { call: MethodCall?, result: MethodChannel.Result? ->
            if (call!!.method == "call") {
                Log.d("debugging", "thish is called")
                val inn = Intent(Intent.ACTION_VIEW)
                val ur: Uri =
                    Uri.withAppendedPath(
                        ContactsContract.Contacts.CONTENT_URI,
                        String.valueOf(7057252707)
                    )
                intent.setData(ur)
                startActivity(inn)
            }
//            handleMethodCalls(context, call, result)
//            handleNudgerCall(this, context, call, result)
        }
    }
}
