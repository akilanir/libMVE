package android.support.v4.app;

import android.app.Notification;
import android.app.PendingIntent;
import android.content.Context;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.support.v4.app.NotificationCompatBase;
import android.widget.RemoteViews;
import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: internal_impl-21.0.0.jar:android/support/v4/app/NotificationCompatApi21.class */
class NotificationCompatApi21 {
    public static final String CATEGORY_CALL = "call";
    public static final String CATEGORY_MESSAGE = "msg";
    public static final String CATEGORY_EMAIL = "email";
    public static final String CATEGORY_EVENT = "event";
    public static final String CATEGORY_PROMO = "promo";
    public static final String CATEGORY_ALARM = "alarm";
    public static final String CATEGORY_PROGRESS = "progress";
    public static final String CATEGORY_SOCIAL = "social";
    public static final String CATEGORY_ERROR = "err";
    public static final String CATEGORY_TRANSPORT = "transport";
    public static final String CATEGORY_SYSTEM = "sys";
    public static final String CATEGORY_SERVICE = "service";
    public static final String CATEGORY_RECOMMENDATION = "recommendation";
    public static final String CATEGORY_STATUS = "status";

    NotificationCompatApi21() {
    }

    /* loaded from: internal_impl-21.0.0.jar:android/support/v4/app/NotificationCompatApi21$Builder.class */
    public static class Builder implements NotificationBuilderWithBuilderAccessor, NotificationBuilderWithActions {
        private Notification.Builder b;

        public Builder(Context context, Notification n, CharSequence contentTitle, CharSequence contentText, CharSequence contentInfo, RemoteViews tickerView, int number, PendingIntent contentIntent, PendingIntent fullScreenIntent, Bitmap largeIcon, int progressMax, int progress, boolean progressIndeterminate, boolean showWhen, boolean useChronometer, int priority, CharSequence subText, boolean localOnly, String category, ArrayList<String> people, Bundle extras, int color, int visibility, Notification publicVersion, String groupKey, boolean groupSummary, String sortKey) {
            this.b = new Notification.Builder(context).setWhen(n.when).setShowWhen(showWhen).setSmallIcon(n.icon, n.iconLevel).setContent(n.contentView).setTicker(n.tickerText, tickerView).setSound(n.sound, n.audioStreamType).setVibrate(n.vibrate).setLights(n.ledARGB, n.ledOnMS, n.ledOffMS).setOngoing((n.flags & 2) != 0).setOnlyAlertOnce((n.flags & 8) != 0).setAutoCancel((n.flags & 16) != 0).setDefaults(n.defaults).setContentTitle(contentTitle).setContentText(contentText).setSubText(subText).setContentInfo(contentInfo).setContentIntent(contentIntent).setDeleteIntent(n.deleteIntent).setFullScreenIntent(fullScreenIntent, (n.flags & 128) != 0).setLargeIcon(largeIcon).setNumber(number).setUsesChronometer(useChronometer).setPriority(priority).setProgress(progressMax, progress, progressIndeterminate).setLocalOnly(localOnly).setExtras(extras).setGroup(groupKey).setGroupSummary(groupSummary).setSortKey(sortKey).setCategory(category).setColor(color).setVisibility(visibility).setPublicVersion(publicVersion);
            Iterator i$ = people.iterator();
            while (i$.hasNext()) {
                String person = i$.next();
                this.b.addPerson(person);
            }
        }

        @Override // android.support.v4.app.NotificationBuilderWithActions
        public void addAction(NotificationCompatBase.Action action) {
            NotificationCompatApi20.addAction(this.b, action);
        }

        @Override // android.support.v4.app.NotificationBuilderWithBuilderAccessor
        public Notification.Builder getBuilder() {
            return this.b;
        }

        public Notification build() {
            return this.b.build();
        }
    }

    public static String getCategory(Notification notif) {
        return notif.category;
    }
}
