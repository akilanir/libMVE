package com.google.android.exoplayer.util.extensions;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/util/extensions/Buffer.class */
public abstract class Buffer {
    public static final int FLAG_END_OF_STREAM = 1;
    public static final int FLAG_RESET = 2;
    public static final int FLAG_DECODE_ONLY = 4;
    private int flags;

    public void reset() {
        this.flags = 0;
    }

    public final void setFlag(int flag) {
        this.flags |= flag;
    }

    public final boolean getFlag(int flag) {
        return (this.flags & flag) == flag;
    }
}
