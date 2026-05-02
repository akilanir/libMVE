package com.google.android.exoplayer.util;

import android.os.HandlerThread;
import android.os.Process;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/util/PriorityHandlerThread.class */
public final class PriorityHandlerThread extends HandlerThread {
    private final int priority;

    public PriorityHandlerThread(String name, int priority) {
        super(name);
        this.priority = priority;
    }

    @Override // android.os.HandlerThread, java.lang.Thread, java.lang.Runnable
    public void run() {
        Process.setThreadPriority(this.priority);
        super.run();
    }
}
