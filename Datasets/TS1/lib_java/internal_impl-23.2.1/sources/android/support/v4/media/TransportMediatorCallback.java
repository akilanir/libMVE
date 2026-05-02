package android.support.v4.media;

import android.view.KeyEvent;

/* loaded from: internal_impl-23.2.1.jar:android/support/v4/media/TransportMediatorCallback.class */
interface TransportMediatorCallback {
    void handleKey(KeyEvent keyEvent);

    void handleAudioFocusChange(int i);

    long getPlaybackPosition();

    void playbackPositionUpdate(long j);
}
