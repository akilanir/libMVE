package android.support.v4.media.session;

import android.media.Rating;
import android.media.RemoteControlClient;
import android.os.Bundle;
import android.support.v4.media.session.MediaSessionCompatApi18;

/* loaded from: internal_impl-23.2.1.jar:android/support/v4/media/session/MediaSessionCompatApi19.class */
class MediaSessionCompatApi19 {
    private static final long ACTION_SET_RATING = 128;
    private static final String METADATA_KEY_USER_RATING = "android.media.metadata.USER_RATING";
    private static final String METADATA_KEY_RATING = "android.media.metadata.RATING";
    private static final String METADATA_KEY_YEAR = "android.media.metadata.YEAR";

    /* loaded from: internal_impl-23.2.1.jar:android/support/v4/media/session/MediaSessionCompatApi19$Callback.class */
    interface Callback extends MediaSessionCompatApi18.Callback {
        void onSetRating(Object obj);
    }

    MediaSessionCompatApi19() {
    }

    public static void setTransportControlFlags(Object rccObj, long actions) {
        ((RemoteControlClient) rccObj).setTransportControlFlags(getRccTransportControlFlagsFromActions(actions));
    }

    public static Object createMetadataUpdateListener(Callback callback) {
        return new OnMetadataUpdateListener(callback);
    }

    public static void setMetadata(Object rccObj, Bundle metadata, long actions) {
        RemoteControlClient.MetadataEditor editor = ((RemoteControlClient) rccObj).editMetadata(true);
        MediaSessionCompatApi14.buildOldMetadata(metadata, editor);
        addNewMetadata(metadata, editor);
        if ((actions & ACTION_SET_RATING) != 0) {
            editor.addEditableKey(268435457);
        }
        editor.apply();
    }

    public static void setOnMetadataUpdateListener(Object rccObj, Object onMetadataUpdateObj) {
        ((RemoteControlClient) rccObj).setMetadataUpdateListener((RemoteControlClient.OnMetadataUpdateListener) onMetadataUpdateObj);
    }

    static int getRccTransportControlFlagsFromActions(long actions) {
        int transportControlFlags = MediaSessionCompatApi18.getRccTransportControlFlagsFromActions(actions);
        if ((actions & ACTION_SET_RATING) != 0) {
            transportControlFlags |= 512;
        }
        return transportControlFlags;
    }

    static void addNewMetadata(Bundle metadata, RemoteControlClient.MetadataEditor editor) {
        if (metadata == null) {
            return;
        }
        if (metadata.containsKey(METADATA_KEY_YEAR)) {
            editor.putLong(8, metadata.getLong(METADATA_KEY_YEAR));
        }
        if (metadata.containsKey(METADATA_KEY_RATING)) {
            editor.putObject(101, (Object) metadata.getParcelable(METADATA_KEY_RATING));
        }
        if (metadata.containsKey(METADATA_KEY_USER_RATING)) {
            editor.putObject(268435457, (Object) metadata.getParcelable(METADATA_KEY_USER_RATING));
        }
    }

    /* loaded from: internal_impl-23.2.1.jar:android/support/v4/media/session/MediaSessionCompatApi19$OnMetadataUpdateListener.class */
    static class OnMetadataUpdateListener<T extends Callback> implements RemoteControlClient.OnMetadataUpdateListener {
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
