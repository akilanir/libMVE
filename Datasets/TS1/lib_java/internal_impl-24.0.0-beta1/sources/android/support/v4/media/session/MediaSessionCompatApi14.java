package android.support.v4.media.session;

import android.app.PendingIntent;
import android.content.Context;
import android.graphics.Bitmap;
import android.media.AudioManager;
import android.media.RemoteControlClient;
import android.os.Bundle;

/* loaded from: internal_impl-24.0.0-beta1.jar:android/support/v4/media/session/MediaSessionCompatApi14.class */
class MediaSessionCompatApi14 {
    static final int RCC_PLAYSTATE_NONE = 0;
    static final int STATE_NONE = 0;
    static final int STATE_STOPPED = 1;
    static final int STATE_PAUSED = 2;
    static final int STATE_PLAYING = 3;
    static final int STATE_FAST_FORWARDING = 4;
    static final int STATE_REWINDING = 5;
    static final int STATE_BUFFERING = 6;
    static final int STATE_ERROR = 7;
    static final int STATE_CONNECTING = 8;
    static final int STATE_SKIPPING_TO_PREVIOUS = 9;
    static final int STATE_SKIPPING_TO_NEXT = 10;
    static final int STATE_SKIPPING_TO_QUEUE_ITEM = 11;
    private static final long ACTION_STOP = 1;
    private static final long ACTION_PAUSE = 2;
    private static final long ACTION_PLAY = 4;
    private static final long ACTION_REWIND = 8;
    private static final long ACTION_SKIP_TO_PREVIOUS = 16;
    private static final long ACTION_SKIP_TO_NEXT = 32;
    private static final long ACTION_FAST_FORWARD = 64;
    private static final long ACTION_PLAY_PAUSE = 512;
    private static final String METADATA_KEY_ART = "android.media.metadata.ART";
    private static final String METADATA_KEY_ALBUM_ART = "android.media.metadata.ALBUM_ART";
    private static final String METADATA_KEY_TITLE = "android.media.metadata.TITLE";
    private static final String METADATA_KEY_ARTIST = "android.media.metadata.ARTIST";
    private static final String METADATA_KEY_DURATION = "android.media.metadata.DURATION";
    private static final String METADATA_KEY_ALBUM = "android.media.metadata.ALBUM";
    private static final String METADATA_KEY_AUTHOR = "android.media.metadata.AUTHOR";
    private static final String METADATA_KEY_WRITER = "android.media.metadata.WRITER";
    private static final String METADATA_KEY_COMPOSER = "android.media.metadata.COMPOSER";
    private static final String METADATA_KEY_COMPILATION = "android.media.metadata.COMPILATION";
    private static final String METADATA_KEY_DATE = "android.media.metadata.DATE";
    private static final String METADATA_KEY_GENRE = "android.media.metadata.GENRE";
    private static final String METADATA_KEY_TRACK_NUMBER = "android.media.metadata.TRACK_NUMBER";
    private static final String METADATA_KEY_DISC_NUMBER = "android.media.metadata.DISC_NUMBER";
    private static final String METADATA_KEY_ALBUM_ARTIST = "android.media.metadata.ALBUM_ARTIST";

    MediaSessionCompatApi14() {
    }

    public static Object createRemoteControlClient(PendingIntent mbIntent) {
        return new RemoteControlClient(mbIntent);
    }

    public static void setState(Object rccObj, int state) {
        ((RemoteControlClient) rccObj).setPlaybackState(getRccStateFromState(state));
    }

    public static void setTransportControlFlags(Object rccObj, long actions) {
        ((RemoteControlClient) rccObj).setTransportControlFlags(getRccTransportControlFlagsFromActions(actions));
    }

    public static void setMetadata(Object rccObj, Bundle metadata) {
        RemoteControlClient.MetadataEditor editor = ((RemoteControlClient) rccObj).editMetadata(true);
        buildOldMetadata(metadata, editor);
        editor.apply();
    }

    public static void registerRemoteControlClient(Context context, Object rccObj) {
        AudioManager am = (AudioManager) context.getSystemService("audio");
        am.registerRemoteControlClient((RemoteControlClient) rccObj);
    }

    public static void unregisterRemoteControlClient(Context context, Object rccObj) {
        AudioManager am = (AudioManager) context.getSystemService("audio");
        am.unregisterRemoteControlClient((RemoteControlClient) rccObj);
    }

    static int getRccStateFromState(int state) {
        switch (state) {
            case 0:
                return 0;
            case 1:
                return 1;
            case 2:
                return 2;
            case STATE_PLAYING /* 3 */:
                return STATE_PLAYING;
            case STATE_FAST_FORWARDING /* 4 */:
                return STATE_FAST_FORWARDING;
            case STATE_REWINDING /* 5 */:
                return STATE_REWINDING;
            case STATE_BUFFERING /* 6 */:
            case STATE_CONNECTING /* 8 */:
                return STATE_CONNECTING;
            case STATE_ERROR /* 7 */:
                return STATE_SKIPPING_TO_PREVIOUS;
            case STATE_SKIPPING_TO_PREVIOUS /* 9 */:
                return STATE_ERROR;
            case STATE_SKIPPING_TO_NEXT /* 10 */:
            case STATE_SKIPPING_TO_QUEUE_ITEM /* 11 */:
                return STATE_BUFFERING;
            default:
                return -1;
        }
    }

    static int getRccTransportControlFlagsFromActions(long actions) {
        int transportControlFlags = 0;
        if ((actions & ACTION_STOP) != 0) {
            transportControlFlags = 0 | 32;
        }
        if ((actions & ACTION_PAUSE) != 0) {
            transportControlFlags |= 16;
        }
        if ((actions & ACTION_PLAY) != 0) {
            transportControlFlags |= STATE_FAST_FORWARDING;
        }
        if ((actions & ACTION_REWIND) != 0) {
            transportControlFlags |= 2;
        }
        if ((actions & ACTION_SKIP_TO_PREVIOUS) != 0) {
            transportControlFlags |= 1;
        }
        if ((actions & ACTION_SKIP_TO_NEXT) != 0) {
            transportControlFlags |= 128;
        }
        if ((actions & ACTION_FAST_FORWARD) != 0) {
            transportControlFlags |= 64;
        }
        if ((actions & ACTION_PLAY_PAUSE) != 0) {
            transportControlFlags |= STATE_CONNECTING;
        }
        return transportControlFlags;
    }

    static void buildOldMetadata(Bundle metadata, RemoteControlClient.MetadataEditor editor) {
        if (metadata == null) {
            return;
        }
        if (metadata.containsKey(METADATA_KEY_ART)) {
            Bitmap art = (Bitmap) metadata.getParcelable(METADATA_KEY_ART);
            editor.putBitmap(100, art);
        } else if (metadata.containsKey(METADATA_KEY_ALBUM_ART)) {
            Bitmap art2 = (Bitmap) metadata.getParcelable(METADATA_KEY_ALBUM_ART);
            editor.putBitmap(100, art2);
        }
        if (metadata.containsKey(METADATA_KEY_ALBUM)) {
            editor.putString(1, metadata.getString(METADATA_KEY_ALBUM));
        }
        if (metadata.containsKey(METADATA_KEY_ALBUM_ARTIST)) {
            editor.putString(13, metadata.getString(METADATA_KEY_ALBUM_ARTIST));
        }
        if (metadata.containsKey(METADATA_KEY_ARTIST)) {
            editor.putString(2, metadata.getString(METADATA_KEY_ARTIST));
        }
        if (metadata.containsKey(METADATA_KEY_AUTHOR)) {
            editor.putString(STATE_PLAYING, metadata.getString(METADATA_KEY_AUTHOR));
        }
        if (metadata.containsKey(METADATA_KEY_COMPILATION)) {
            editor.putString(15, metadata.getString(METADATA_KEY_COMPILATION));
        }
        if (metadata.containsKey(METADATA_KEY_COMPOSER)) {
            editor.putString(STATE_FAST_FORWARDING, metadata.getString(METADATA_KEY_COMPOSER));
        }
        if (metadata.containsKey(METADATA_KEY_DATE)) {
            editor.putString(STATE_REWINDING, metadata.getString(METADATA_KEY_DATE));
        }
        if (metadata.containsKey(METADATA_KEY_DISC_NUMBER)) {
            editor.putLong(14, metadata.getLong(METADATA_KEY_DISC_NUMBER));
        }
        if (metadata.containsKey(METADATA_KEY_DURATION)) {
            editor.putLong(STATE_SKIPPING_TO_PREVIOUS, metadata.getLong(METADATA_KEY_DURATION));
        }
        if (metadata.containsKey(METADATA_KEY_GENRE)) {
            editor.putString(STATE_BUFFERING, metadata.getString(METADATA_KEY_GENRE));
        }
        if (metadata.containsKey(METADATA_KEY_TITLE)) {
            editor.putString(STATE_ERROR, metadata.getString(METADATA_KEY_TITLE));
        }
        if (metadata.containsKey(METADATA_KEY_TRACK_NUMBER)) {
            editor.putLong(0, metadata.getLong(METADATA_KEY_TRACK_NUMBER));
        }
        if (metadata.containsKey(METADATA_KEY_WRITER)) {
            editor.putString(STATE_SKIPPING_TO_QUEUE_ITEM, metadata.getString(METADATA_KEY_WRITER));
        }
    }
}
