package android.support.v4.app;

import android.app.PendingIntent;
import android.os.Bundle;
import android.support.v4.app.RemoteInputCompatBase;

/* loaded from: internal_impl-22.1.1.jar:android/support/v4/app/NotificationCompatBase.class */
class NotificationCompatBase {

    /* loaded from: internal_impl-22.1.1.jar:android/support/v4/app/NotificationCompatBase$Action.class */
    public static abstract class Action {

        /* loaded from: internal_impl-22.1.1.jar:android/support/v4/app/NotificationCompatBase$Action$Factory.class */
        public interface Factory {
            Action build(int i, CharSequence charSequence, PendingIntent pendingIntent, Bundle bundle, RemoteInputCompatBase.RemoteInput[] remoteInputArr);

            Action[] newArray(int i);
        }

        protected abstract int getIcon();

        protected abstract CharSequence getTitle();

        protected abstract PendingIntent getActionIntent();

        protected abstract Bundle getExtras();

        protected abstract RemoteInputCompatBase.RemoteInput[] getRemoteInputs();
    }

    /* loaded from: internal_impl-22.1.1.jar:android/support/v4/app/NotificationCompatBase$UnreadConversation.class */
    public static abstract class UnreadConversation {

        /* loaded from: internal_impl-22.1.1.jar:android/support/v4/app/NotificationCompatBase$UnreadConversation$Factory.class */
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

    NotificationCompatBase() {
    }
}
