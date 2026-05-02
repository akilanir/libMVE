package android.support.v4.media.session;

import android.content.ComponentName;
import android.content.Context;
import android.media.AudioManager;

/* loaded from: internal_impl-22.2.0.jar:android/support/v4/media/session/MediaSessionCompatApi8.class */
public class MediaSessionCompatApi8 {
    public static void registerMediaButtonEventReceiver(Context context, ComponentName mbr) {
        AudioManager am = (AudioManager) context.getSystemService("audio");
        am.registerMediaButtonEventReceiver(mbr);
    }

    public static void unregisterMediaButtonEventReceiver(Context context, ComponentName mbr) {
        AudioManager am = (AudioManager) context.getSystemService("audio");
        am.unregisterMediaButtonEventReceiver(mbr);
    }
}
