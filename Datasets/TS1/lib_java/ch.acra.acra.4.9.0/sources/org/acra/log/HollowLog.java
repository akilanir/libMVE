package org.acra.log;

import android.support.annotation.Nullable;

/* loaded from: ch.acra.acra.4.9.0.jar:org/acra/log/HollowLog.class */
public final class HollowLog implements ACRALog {
    @Override // org.acra.log.ACRALog
    public int v(String tag, String msg) {
        return 0;
    }

    @Override // org.acra.log.ACRALog
    public int v(String tag, String msg, Throwable tr) {
        return 0;
    }

    @Override // org.acra.log.ACRALog
    public int d(String tag, String msg) {
        return 0;
    }

    @Override // org.acra.log.ACRALog
    public int d(String tag, String msg, Throwable tr) {
        return 0;
    }

    @Override // org.acra.log.ACRALog
    public int i(String tag, String msg) {
        return 0;
    }

    @Override // org.acra.log.ACRALog
    public int i(String tag, String msg, Throwable tr) {
        return 0;
    }

    @Override // org.acra.log.ACRALog
    public int w(String tag, String msg) {
        return 0;
    }

    @Override // org.acra.log.ACRALog
    public int w(String tag, String msg, Throwable tr) {
        return 0;
    }

    @Override // org.acra.log.ACRALog
    public int w(String tag, Throwable tr) {
        return 0;
    }

    @Override // org.acra.log.ACRALog
    public int e(String tag, String msg) {
        return 0;
    }

    @Override // org.acra.log.ACRALog
    public int e(String tag, String msg, Throwable tr) {
        return 0;
    }

    @Override // org.acra.log.ACRALog
    @Nullable
    public String getStackTraceString(Throwable tr) {
        return null;
    }
}
