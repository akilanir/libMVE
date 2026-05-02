package android.support.v4.media;

import android.media.MediaDescription;
import android.net.Uri;
import android.support.v4.media.MediaDescriptionCompatApi21;

/* loaded from: internal_impl-23.2.1.jar:android/support/v4/media/MediaDescriptionCompatApi23.class */
class MediaDescriptionCompatApi23 extends MediaDescriptionCompatApi21 {
    MediaDescriptionCompatApi23() {
    }

    public static Uri getMediaUri(Object descriptionObj) {
        return ((MediaDescription) descriptionObj).getMediaUri();
    }

    /* loaded from: internal_impl-23.2.1.jar:android/support/v4/media/MediaDescriptionCompatApi23$Builder.class */
    static class Builder extends MediaDescriptionCompatApi21.Builder {
        Builder() {
        }

        public static void setMediaUri(Object builderObj, Uri mediaUri) {
            ((MediaDescription.Builder) builderObj).setMediaUri(mediaUri);
        }
    }
}
