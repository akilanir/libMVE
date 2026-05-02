package com.google.android.exoplayer.drm;

import android.annotation.TargetApi;
import android.media.MediaCrypto;
import com.google.android.exoplayer.extractor.mp4.Atom;

@TargetApi(Atom.LONG_HEADER_SIZE)
/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/drm/DrmSessionManager.class */
public interface DrmSessionManager {
    public static final int STATE_ERROR = 0;
    public static final int STATE_CLOSED = 1;
    public static final int STATE_OPENING = 2;
    public static final int STATE_OPENED = 3;
    public static final int STATE_OPENED_WITH_KEYS = 4;

    void open(DrmInitData drmInitData);

    void close();

    int getState();

    MediaCrypto getMediaCrypto();

    boolean requiresSecureDecoderComponent(String str);

    Exception getError();
}
