package android.support.v4.app;

import android.app.PendingIntent;
import android.os.Bundle;
import android.support.v4.app.RemoteInputCompatBase;

/* loaded from: internal_impl-22.2.0.jar:android/support/v4/app/NotificationCompatBase.class */
public class NotificationCompatBase {

    /* loaded from: internal_impl-22.2.0.jar:android/support/v4/app/NotificationCompatBase$Action.class */
    public static abstract class Action {

        /* loaded from: internal_impl-22.2.0.jar:android/support/v4/app/NotificationCompatBase$Action$Factory.class */
        public interface Factory {
            Action build(int i, CharSequence charSequence, PendingIntent pendingIntent, Bundle bundle, RemoteInputCompatBase.RemoteInput[] remoteInputArr);

            Action[] newArray(int i);
        }

        public abstract int getIcon();

        public abstract CharSequence getTitle();

        public abstract PendingIntent getActionIntent();

        public abstract Bundle getExtras();

        public abstract RemoteInputCompatBase.RemoteInput[] getRemoteInputs();
    }

    /* loaded from: internal_impl-22.2.0.jar:android/support/v4/app/NotificationCompatBase$UnreadConversation.class */
    public static abstract class UnreadConversation {

        /* loaded from: internal_impl-22.2.0.jar:android/support/v4/app/NotificationCompatBase$UnreadConversation$Factory.class */
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
}
