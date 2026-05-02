package org.acra.log;

/* loaded from: acra-4.6.2.jar:org/acra/log/HollowLog.class */
public class HollowLog implements ACRALog {
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
    public String getStackTraceString(Throwable tr) {
        return null;
    }
}
