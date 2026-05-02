package android.support.v4.app;

import android.app.NotificationManager;

/* loaded from: internal_impl-24.0.0.jar:android/support/v4/app/NotificationManagerCompatApi24.class */
class NotificationManagerCompatApi24 {
    NotificationManagerCompatApi24() {
    }

    public static boolean areNotificationsEnabled(NotificationManager notificationManager) {
        return notificationManager.areNotificationsEnabled();
    }

    public static int getImportance(NotificationManager notificationManager) {
        return notificationManager.getImportance();
    }
}
