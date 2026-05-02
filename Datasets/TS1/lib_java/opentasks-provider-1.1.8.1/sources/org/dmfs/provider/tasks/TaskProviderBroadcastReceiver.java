package org.dmfs.provider.tasks;

import android.annotation.SuppressLint;
import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import java.util.TimeZone;
import org.dmfs.rfc5545.DateTime;

/* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/TaskProviderBroadcastReceiver.class */
public class TaskProviderBroadcastReceiver extends BroadcastReceiver {
    private static final int REQUEST_CODE_ALARM = 1337;
    private static final String ACTION_NOTIFICATION_ALARM = "org.dmfs.tasks.provider.NOTIFICATION_ALARM";

    @SuppressLint({"NewApi"})
    static void planNotificationUpdate(Context context, DateTime dateTime) {
        AlarmManager alarmManager = (AlarmManager) context.getSystemService("alarm");
        Intent intent = new Intent(context, (Class<?>) TaskProviderBroadcastReceiver.class);
        intent.setAction(ACTION_NOTIFICATION_ALARM);
        PendingIntent broadcast = PendingIntent.getBroadcast(context, REQUEST_CODE_ALARM, intent, 134217728);
        alarmManager.cancel(broadcast);
        if (dateTime.isFloating()) {
            dateTime = new DateTime(TimeZone.getDefault(), dateTime.getYear(), dateTime.getMonth(), dateTime.getDayOfMonth(), dateTime.getHours(), dateTime.getMinutes(), dateTime.getSeconds());
        }
        if (Build.VERSION.SDK_INT > 18) {
            alarmManager.setExact(0, dateTime.getTimestamp(), broadcast);
        } else {
            alarmManager.set(0, dateTime.getTimestamp(), broadcast);
        }
    }

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        switch (intent.getAction()) {
            case "android.intent.action.TIMEZONE_CHANGED":
                ContentOperation.UPDATE_TIMEZONE.fire(context, null);
            case "org.dmfs.tasks.provider.NOTIFICATION_ALARM":
                ContentOperation.POST_NOTIFICATIONS.fire(context, null);
                break;
        }
        ContentOperation.UPDATE_NOTIFICATION_ALARM.fire(context, null);
    }
}
