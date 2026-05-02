package com.mapzen.android.lost.api;

/* loaded from: lost-1.0.1.jar:com/mapzen/android/lost/api/LocationRequest.class */
public final class LocationRequest {
    public static final int PRIORITY_HIGH_ACCURACY = 100;
    public static final int PRIORITY_BALANCED_POWER_ACCURACY = 102;
    public static final int PRIORITY_LOW_POWER = 104;
    public static final int PRIORITY_NO_POWER = 105;
    static final long DEFAULT_INTERVAL_IN_MS = 3600000;
    static final long DEFAULT_FASTEST_INTERVAL_IN_MS = 600000;
    static final float DEFAULT_SMALLEST_DISPLACEMENT_IN_METERS = 0.0f;
    private long interval = DEFAULT_INTERVAL_IN_MS;
    private long fastestInterval = DEFAULT_FASTEST_INTERVAL_IN_MS;
    private float smallestDisplacement = DEFAULT_SMALLEST_DISPLACEMENT_IN_METERS;
    private int priority = PRIORITY_BALANCED_POWER_ACCURACY;

    private LocationRequest() {
    }

    public static LocationRequest create() {
        return new LocationRequest();
    }

    public long getInterval() {
        return this.interval;
    }

    public LocationRequest setInterval(long millis) {
        this.interval = millis;
        if (this.interval < this.fastestInterval) {
            this.fastestInterval = this.interval;
        }
        return this;
    }

    public long getFastestInterval() {
        return this.fastestInterval;
    }

    public LocationRequest setFastestInterval(long millis) {
        this.fastestInterval = millis;
        return this;
    }

    public float getSmallestDisplacement() {
        return this.smallestDisplacement;
    }

    public LocationRequest setSmallestDisplacement(float meters) {
        this.smallestDisplacement = meters;
        return this;
    }

    public int getPriority() {
        return this.priority;
    }

    public LocationRequest setPriority(int priority) {
        if (priority != 100 && priority != 102 && priority != 104 && priority != 105) {
            throw new IllegalArgumentException("Invalid priority: " + priority);
        }
        this.priority = priority;
        return this;
    }
}
