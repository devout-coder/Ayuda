package com.example.csi_hackathon

import android.app.NotificationManager
import android.app.PendingIntent
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.util.Log
import androidx.core.app.NotificationCompat
import io.flutter.embedding.android.FlutterActivity


class AlarmReceiver : BroadcastReceiver() {

    private fun buildPendingIntent(
        context: Context,
    ): PendingIntent? {
        Log.d("debugging", "building app to be opened")
        return PendingIntent.getActivity(
            context,
            0,
            FlutterActivity
                .withNewEngine()
                .initialRoute("/")
                .build(context),
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )
    }

    private fun buildNotification(
        context: Context,
    ): NotificationCompat.Builder {
        val b: NotificationCompat.Builder = NotificationCompat.Builder(context, "alarms")
        b.setSmallIcon(R.drawable.launch_background)
            .setContentTitle("Time to focus on your task")
            .setPriority(NotificationCompat.PRIORITY_MAX)
            .setFullScreenIntent(
                buildPendingIntent(
                    context,
                ), true
            )
            .setAutoCancel(true)

        return (b)
    }

    override fun onReceive(context: Context?, intent: Intent?) {
        Log.d("debugging", "received nudger alarm")
        Log.d("debugging", "navigating back home")


        val startMain = Intent(Intent.ACTION_MAIN)
        startMain.addCategory(Intent.CATEGORY_HOME)
        startMain.flags = Intent.FLAG_ACTIVITY_NEW_TASK
        context!!.startActivity(startMain)

        val notificationManager: NotificationManager =
            context!!.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
        notificationManager.notify(
            69,
            buildNotification(context).build()
        )
    }
}
