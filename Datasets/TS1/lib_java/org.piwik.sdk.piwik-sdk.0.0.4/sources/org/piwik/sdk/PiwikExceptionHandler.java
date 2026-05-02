package org.piwik.sdk;

import java.lang.Thread;
import org.piwik.sdk.tools.Logy;

/* loaded from: org.piwik.sdk.piwik-sdk.0.0.4.jar:org/piwik/sdk/PiwikExceptionHandler.class */
public class PiwikExceptionHandler implements Thread.UncaughtExceptionHandler {
    private final Tracker mTracker;
    private final Thread.UncaughtExceptionHandler mDefaultExceptionHandler = Thread.getDefaultUncaughtExceptionHandler();

    public PiwikExceptionHandler(Tracker tracker) {
        this.mTracker = tracker;
    }

    public Tracker getTracker() {
        return this.mTracker;
    }

    public Thread.UncaughtExceptionHandler getDefaultExceptionHandler() {
        return this.mDefaultExceptionHandler;
    }

    @Override // java.lang.Thread.UncaughtExceptionHandler
    public void uncaughtException(Thread thread, Throwable ex) {
        try {
            try {
                String excInfo = ex.getMessage();
                getTracker().trackException(ex, excInfo, true);
                getTracker().dispatch();
                if (getDefaultExceptionHandler() != null && getDefaultExceptionHandler() != this) {
                    getDefaultExceptionHandler().uncaughtException(thread, ex);
                }
            } catch (Exception e) {
                Logy.e("PIWIK:Tracker", "Couldn't track uncaught exception", e);
                if (getDefaultExceptionHandler() != null && getDefaultExceptionHandler() != this) {
                    getDefaultExceptionHandler().uncaughtException(thread, ex);
                }
            }
        } catch (Throwable th) {
            if (getDefaultExceptionHandler() != null && getDefaultExceptionHandler() != this) {
                getDefaultExceptionHandler().uncaughtException(thread, ex);
            }
            throw th;
        }
    }
}
