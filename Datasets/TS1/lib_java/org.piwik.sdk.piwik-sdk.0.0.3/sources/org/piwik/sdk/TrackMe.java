package org.piwik.sdk;

import android.support.annotation.NonNull;
import java.util.HashMap;

/* loaded from: org.piwik.sdk.piwik-sdk.0.0.3.jar:org/piwik/sdk/TrackMe.class */
public class TrackMe {
    private static final int DEFAULT_QUERY_CAPACITY = 14;
    private final HashMap<String, String> mQueryParams = new HashMap<>(DEFAULT_QUERY_CAPACITY);
    private final CustomVariables mScreenCustomVariable = new CustomVariables();

    public synchronized TrackMe set(@NonNull QueryParams key, String value) {
        if (value == null) {
            this.mQueryParams.remove(key.toString());
        } else if (value.length() > 0) {
            this.mQueryParams.put(key.toString(), value);
        }
        return this;
    }

    public synchronized TrackMe set(@NonNull QueryParams key, int value) {
        set(key, Integer.toString(value));
        return this;
    }

    public synchronized TrackMe set(@NonNull QueryParams key, float value) {
        set(key, Float.toString(value));
        return this;
    }

    public synchronized TrackMe set(@NonNull QueryParams key, long value) {
        set(key, Long.toString(value));
        return this;
    }

    public synchronized boolean has(@NonNull QueryParams queryParams) {
        return this.mQueryParams.containsKey(queryParams.toString());
    }

    public synchronized TrackMe trySet(@NonNull QueryParams key, int value) {
        return trySet(key, String.valueOf(value));
    }

    public synchronized TrackMe trySet(@NonNull QueryParams key, float value) {
        return trySet(key, String.valueOf(value));
    }

    public synchronized TrackMe trySet(@NonNull QueryParams key, long value) {
        return trySet(key, String.valueOf(value));
    }

    public synchronized TrackMe trySet(@NonNull QueryParams key, String value) {
        if (!has(key)) {
            set(key, value);
        }
        return this;
    }

    public synchronized String build() {
        set(QueryParams.SCREEN_SCOPE_CUSTOM_VARIABLES, this.mScreenCustomVariable.toString());
        return Dispatcher.urlEncodeUTF8(this.mQueryParams);
    }

    public synchronized String get(@NonNull QueryParams queryParams) {
        return this.mQueryParams.get(queryParams.toString());
    }

    public synchronized TrackMe setScreenCustomVariable(int index, String name, String value) {
        this.mScreenCustomVariable.put(index, name, value);
        return this;
    }

    public synchronized CustomVariables getScreenCustomVariable() {
        return this.mScreenCustomVariable;
    }
}
