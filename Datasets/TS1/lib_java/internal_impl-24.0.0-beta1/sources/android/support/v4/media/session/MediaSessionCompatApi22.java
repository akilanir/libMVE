package android.support.v4.media.session;

import android.media.session.MediaSession;

/* loaded from: internal_impl-24.0.0-beta1.jar:android/support/v4/media/session/MediaSessionCompatApi22.class */
class MediaSessionCompatApi22 {
    MediaSessionCompatApi22() {
    }

    public static void setRatingType(Object sessionObj, int type) {
        ((MediaSession) sessionObj).setRatingType(type);
    }
}
