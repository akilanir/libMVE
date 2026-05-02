package android.support.v4.app;

import android.app.Notification;
import android.app.PendingIntent;
import android.content.Context;
import android.os.Bundle;
import android.support.v4.app.RemoteInputCompatBase;

/* loaded from: internal_impl-24.0.0.jar:android/support/v4/app/NotificationCompatBase.class */
public class NotificationCompatBase {

    /* loaded from: internal_impl-24.0.0.jar:android/support/v4/app/NotificationCompatBase$Action.class */
    public static abstract class Action {

        /* loaded from: internal_impl-24.0.0.jar:android/support/v4/app/NotificationCompatBase$Action$Factory.class */
        public interface Factory {
            Action build(int i, CharSequence charSequence, PendingIntent pendingIntent, Bundle bundle, RemoteInputCompatBase.RemoteInput[] remoteInputArr, boolean z);

            Action[] newArray(int i);
        }

        public abstract int getIcon();

        public abstract CharSequence getTitle();

        public abstract PendingIntent getActionIntent();

        public abstract Bundle getExtras();

        public abstract RemoteInputCompatBase.RemoteInput[] getRemoteInputs();

        public abstract boolean getAllowGeneratedReplies();
    }

    /* loaded from: internal_impl-24.0.0.jar:android/support/v4/app/NotificationCompatBase$UnreadConversation.class */
    public static abstract class UnreadConversation {

        /* loaded from: internal_impl-24.0.0.jar:android/support/v4/app/NotificationCompatBase$UnreadConversation$Factory.class */
        public interface Factory {
            UnreadConversation build(String[] strArr, RemoteInputCompatBase.RemoteInput remoteInput, PendingIntent pendingIntent, PendingIntent pendingIntent2, String[] strArr2, long j);
        }

        abstract String[] getParticipants();

        abstract String getParticipant();

        abstract String[] getMessages();

        abstract RemoteInputCompatBase.RemoteInput getRemoteInput();

        abstract PendingIntent getReplyPendingIntent();

        abstract PendingIntent getReadPendingIntent();

        abstract long getLatestTimestamp();
    }

    public static Notification add(Notification notification, Context context, CharSequence contentTitle, CharSequence contentText, PendingIntent contentIntent) {
        notification.setLatestEventInfo(context, contentTitle, contentText, contentIntent);
        return notification;
    }
}
