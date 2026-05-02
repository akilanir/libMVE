package android.support.v4.media.session;

import android.graphics.Bitmap;
import android.media.Rating;
import android.media.RemoteControlClient;
import android.os.Build;
import android.os.Bundle;
import android.support.v4.media.session.MediaSessionCompatApi14;

/* loaded from: internal_impl-22.0.0.jar:android/support/v4/media/session/MediaSessionCompatApi19.class */
public class MediaSessionCompatApi19 {
    private static final String METADATA_KEY_ART = "android.media.metadata.ART";
    private static final String METADATA_KEY_ALBUM_ART = "android.media.metadata.ALBUM_ART";
    private static final String METADATA_KEY_USER_RATING = "android.media.metadata.USER_RATING";
    private static final String METADATA_KEY_RATING = "android.media.metadata.RATING";

    public static Object createMetadataUpdateListener(MediaSessionCompatApi14.Callback callback) {
        return new OnMetadataUpdateListener(callback);
    }

    public static void setMetadata(Object rccObj, Bundle metadata, boolean supportRating) {
        RemoteControlClient.MetadataEditor editor = ((RemoteControlClient) rccObj).editMetadata(true);
        MediaSessionCompatApi14.buildOldMetadata(metadata, editor);
        addNewMetadata(metadata, editor);
        if (supportRating && Build.VERSION.SDK_INT > 19) {
            editor.addEditableKey(268435457);
        }
        editor.apply();
    }

    public static void setOnMetadataUpdateListener(Object rccObj, Object onMetadataUpdateObj) {
        ((RemoteControlClient) rccObj).setMetadataUpdateListener((RemoteControlClient.OnMetadataUpdateListener) onMetadataUpdateObj);
    }

    static void addNewMetadata(Bundle metadata, RemoteControlClient.MetadataEditor editor) {
        if (metadata.containsKey(METADATA_KEY_RATING)) {
            editor.putObject(101, (Object) metadata.getParcelable(METADATA_KEY_RATING));
        }
        if (metadata.containsKey(METADATA_KEY_USER_RATING)) {
            editor.putObject(268435457, (Object) metadata.getParcelable(METADATA_KEY_USER_RATING));
        }
        if (metadata.containsKey(METADATA_KEY_ART)) {
            Bitmap art = (Bitmap) metadata.getParcelable(METADATA_KEY_ART);
            editor.putBitmap(100, art);
        } else if (metadata.containsKey(METADATA_KEY_ALBUM_ART)) {
            Bitmap art2 = (Bitmap) metadata.getParcelable(METADATA_KEY_ALBUM_ART);
            editor.putBitmap(100, art2);
        }
    }

    /* loaded from: internal_impl-22.0.0.jar:android/support/v4/media/session/MediaSessionCompatApi19$OnMetadataUpdateListener.class */
    static class OnMetadataUpdateListener<T extends MediaSessionCompatApi14.Callback> implements RemoteControlClient.OnMetadataUpdateListener {
        protected final T mCallback;

        public OnMetadataUpdateListener(T callback) {
            this.mCallback = callback;
        }

        @Override // android.media.RemoteControlClient.OnMetadataUpdateListener
        public void onMetadataUpdate(int key, Object newValue) {
            if (key == 268435457 && (newValue instanceof Rating)) {
                this.mCallback.onSetRating(newValue);
            }
        }
    }
}
