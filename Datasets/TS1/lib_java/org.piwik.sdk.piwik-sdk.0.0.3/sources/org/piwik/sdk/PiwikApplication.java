package org.piwik.sdk;

import android.app.Application;
import android.os.Build;
import java.net.MalformedURLException;

/* loaded from: org.piwik.sdk.piwik-sdk.0.0.3.jar:org/piwik/sdk/PiwikApplication.class */
public abstract class PiwikApplication extends Application {
    private Tracker mPiwikTracker;

    public abstract String getTrackerUrl();

    public abstract Integer getSiteId();

    public Piwik getPiwik() {
        return Piwik.getInstance(this);
    }

    public synchronized Tracker getTracker() {
        if (this.mPiwikTracker == null) {
            try {
                this.mPiwikTracker = getPiwik().newTracker(getTrackerUrl(), getSiteId().intValue());
            } catch (MalformedURLException e) {
                e.printStackTrace();
                throw new RuntimeException("Tracker URL was malformed.");
            }
        }
        return this.mPiwikTracker;
    }

    @Override // android.app.Application, android.content.ComponentCallbacks
    public void onLowMemory() {
        if (Build.VERSION.SDK_INT < 14 && this.mPiwikTracker != null) {
            this.mPiwikTracker.dispatch();
        }
        super.onLowMemory();
    }

    @Override // android.app.Application, android.content.ComponentCallbacks2
    public void onTrimMemory(int level) {
        if ((level == 20 || level == 80) && this.mPiwikTracker != null) {
            this.mPiwikTracker.dispatch();
        }
        super.onTrimMemory(level);
    }
}
