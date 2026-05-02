package android.support.v4.app;

import android.app.PendingIntent;
import android.os.Bundle;
import android.support.v4.app.RemoteInputCompatBase;

/* loaded from: internal_impl-21.0.0.jar:android/support/v4/app/NotificationCompatBase.class */
class NotificationCompatBase {

    /* loaded from: internal_impl-21.0.0.jar:android/support/v4/app/NotificationCompatBase$Action.class */
    public static abstract class Action {

        /* loaded from: internal_impl-21.0.0.jar:android/support/v4/app/NotificationCompatBase$Action$Factory.class */
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

    NotificationCompatBase() {
    }
}
