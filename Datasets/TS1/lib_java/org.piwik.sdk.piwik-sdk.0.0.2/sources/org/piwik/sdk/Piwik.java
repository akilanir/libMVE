package org.piwik.sdk;

import android.content.Context;
import android.content.SharedPreferences;
import android.support.annotation.NonNull;
import java.net.MalformedURLException;
import org.piwik.sdk.tools.Logy;

/* loaded from: org.piwik.sdk.piwik-sdk.0.0.2.jar:org/piwik/sdk/Piwik.class */
public class Piwik {
    public static final String LOGGER_PREFIX = "PIWIK:";
    public static final String PREFERENCE_FILE_NAME = "org.piwik.sdk";
    public static final String PREFERENCE_KEY_OPTOUT = "piwik.optout";
    private final Context mContext;
    private boolean mOptOut;
    private static Piwik sInstance;
    private boolean mDryRun = false;
    private boolean mDebug = false;
    private final SharedPreferences mSharedPreferences = getContext().getSharedPreferences("org.piwik.sdk", 0);

    public static synchronized Piwik getInstance(Context context) {
        if (sInstance == null) {
            sInstance = new Piwik(context);
        }
        return sInstance;
    }

    private Piwik(Context context) {
        this.mOptOut = false;
        this.mContext = context.getApplicationContext();
        this.mOptOut = getSharedPreferences().getBoolean(PREFERENCE_KEY_OPTOUT, false);
    }

    protected Context getContext() {
        return this.mContext;
    }

    @Deprecated
    public synchronized Tracker newTracker(@NonNull String trackerUrl, int siteId, String authToken) throws MalformedURLException {
        return new Tracker(trackerUrl, siteId, authToken, this);
    }

    public synchronized Tracker newTracker(@NonNull String trackerUrl, int siteId) throws MalformedURLException {
        return new Tracker(trackerUrl, siteId, null, this);
    }

    public void setOptOut(boolean optOut) {
        this.mOptOut = optOut;
        getSharedPreferences().edit().putBoolean(PREFERENCE_KEY_OPTOUT, optOut).apply();
    }

    public boolean isOptOut() {
        return this.mOptOut;
    }

    public boolean isDryRun() {
        return this.mDryRun;
    }

    public boolean isDebug() {
        return this.mDebug;
    }

    public void setDebug(boolean debug) {
        this.mDebug = debug;
        Logy.sLoglevel = debug ? 2 : -1;
    }

    public void setDryRun(boolean dryRun) {
        this.mDryRun = dryRun;
    }

    public String getApplicationDomain() {
        return getContext().getPackageName();
    }

    public SharedPreferences getSharedPreferences() {
        return this.mSharedPreferences;
    }
}
