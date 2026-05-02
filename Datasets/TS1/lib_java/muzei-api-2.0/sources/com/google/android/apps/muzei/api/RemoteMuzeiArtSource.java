package com.google.android.apps.muzei.api;

import android.content.SharedPreferences;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.PowerManager;
import android.util.Log;

/* loaded from: muzei-api-2.0.jar:com/google/android/apps/muzei/api/RemoteMuzeiArtSource.class */
public abstract class RemoteMuzeiArtSource extends MuzeiArtSource {
    private static final String TAG = "MuzeiArtSource";
    private static final int FETCH_WAKELOCK_TIMEOUT_MILLIS = 30000;
    private static final int INITIAL_RETRY_DELAY_MILLIS = 10000;
    private static final String PREF_RETRY_ATTEMPT = "retry_attempt";
    private String mName;

    protected abstract void onTryUpdate(int i) throws RetryException;

    public RemoteMuzeiArtSource(String name) {
        super(name);
        this.mName = name;
    }

    @Override // com.google.android.apps.muzei.api.MuzeiArtSource
    protected void onUpdate(int reason) {
        PowerManager pwm = (PowerManager) getSystemService("power");
        PowerManager.WakeLock lock = pwm.newWakeLock(1, this.mName);
        lock.acquire(30000L);
        SharedPreferences sp = getSharedPreferences();
        try {
            try {
                NetworkInfo ni = ((ConnectivityManager) getSystemService("connectivity")).getActiveNetworkInfo();
                if (ni == null || !ni.isConnected()) {
                    Log.d(TAG, "No network connection; not attempting to fetch update, id=" + this.mName);
                    throw new RetryException();
                }
                sp.edit().remove(PREF_RETRY_ATTEMPT).apply();
                setWantsNetworkAvailable(false);
                onTryUpdate(reason);
                if (lock.isHeld()) {
                    lock.release();
                }
            } catch (RetryException e) {
                Log.w(TAG, "Error fetching, scheduling retry, id=" + this.mName);
                int retryAttempt = sp.getInt(PREF_RETRY_ATTEMPT, 0);
                scheduleUpdate(System.currentTimeMillis() + (INITIAL_RETRY_DELAY_MILLIS << retryAttempt));
                sp.edit().putInt(PREF_RETRY_ATTEMPT, retryAttempt + 1).apply();
                setWantsNetworkAvailable(true);
                if (lock.isHeld()) {
                    lock.release();
                }
            }
        } catch (Throwable th) {
            if (lock.isHeld()) {
                lock.release();
            }
            throw th;
        }
    }

    @Override // com.google.android.apps.muzei.api.MuzeiArtSource
    protected void onDisabled() {
        super.onDisabled();
        getSharedPreferences().edit().remove(PREF_RETRY_ATTEMPT).commit();
        setWantsNetworkAvailable(false);
    }

    @Override // com.google.android.apps.muzei.api.MuzeiArtSource
    protected void onNetworkAvailable() {
        super.onNetworkAvailable();
        if (getSharedPreferences().getInt(PREF_RETRY_ATTEMPT, 0) > 0) {
            onUpdate(0);
        }
    }

    /* loaded from: muzei-api-2.0.jar:com/google/android/apps/muzei/api/RemoteMuzeiArtSource$RetryException.class */
    public static class RetryException extends Exception {
        public RetryException() {
        }

        public RetryException(Throwable cause) {
            super(cause);
        }
    }
}
