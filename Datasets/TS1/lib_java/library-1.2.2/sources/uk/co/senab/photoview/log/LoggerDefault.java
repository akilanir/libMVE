package uk.co.senab.photoview.log;

import android.util.Log;

/* loaded from: library-1.2.2.jar:uk/co/senab/photoview/log/LoggerDefault.class */
public class LoggerDefault implements Logger {
    @Override // uk.co.senab.photoview.log.Logger
    public int v(String tag, String msg) {
        return Log.v(tag, msg);
    }

    @Override // uk.co.senab.photoview.log.Logger
    public int v(String tag, String msg, Throwable tr) {
        return Log.v(tag, msg, tr);
    }

    @Override // uk.co.senab.photoview.log.Logger
    public int d(String tag, String msg) {
        return Log.d(tag, msg);
    }

    @Override // uk.co.senab.photoview.log.Logger
    public int d(String tag, String msg, Throwable tr) {
        return Log.d(tag, msg, tr);
    }

    @Override // uk.co.senab.photoview.log.Logger
    public int i(String tag, String msg) {
        return Log.i(tag, msg);
    }

    @Override // uk.co.senab.photoview.log.Logger
    public int i(String tag, String msg, Throwable tr) {
        return Log.i(tag, msg, tr);
    }

    @Override // uk.co.senab.photoview.log.Logger
    public int w(String tag, String msg) {
        return Log.w(tag, msg);
    }

    @Override // uk.co.senab.photoview.log.Logger
    public int w(String tag, String msg, Throwable tr) {
        return Log.w(tag, msg, tr);
    }

    @Override // uk.co.senab.photoview.log.Logger
    public int e(String tag, String msg) {
        return Log.e(tag, msg);
    }

    @Override // uk.co.senab.photoview.log.Logger
    public int e(String tag, String msg, Throwable tr) {
        return Log.e(tag, msg, tr);
    }
}
