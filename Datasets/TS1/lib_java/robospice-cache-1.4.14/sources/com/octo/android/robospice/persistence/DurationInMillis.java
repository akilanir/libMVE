package com.octo.android.robospice.persistence;

/* loaded from: robospice-cache-1.4.14.jar:com/octo/android/robospice/persistence/DurationInMillis.class */
public interface DurationInMillis {

    @Deprecated
    public static final long NEVER = -1;
    public static final long ALWAYS_EXPIRED = -1;

    @Deprecated
    public static final long ALWAYS = 0;
    public static final long ALWAYS_RETURNED = 0;
    public static final long ONE_SECOND = 1000;
    public static final long ONE_MINUTE = 60000;
    public static final long ONE_HOUR = 3600000;
    public static final long ONE_DAY = 86400000;
    public static final long ONE_WEEK = 604800000;
}
