package android.support.v4.media;

import android.view.KeyEvent;

/* loaded from: support-v4-18.0.0.jar:android/support/v4/media/TransportMediatorCallback.class */
interface TransportMediatorCallback {
    void handleKey(KeyEvent keyEvent);

    void handleAudioFocusChange(int i);

    long getPlaybackPosition();

    void playbackPositionUpdate(long j);
}
