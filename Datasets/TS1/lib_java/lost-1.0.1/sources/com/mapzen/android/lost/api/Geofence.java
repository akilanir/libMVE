package com.mapzen.android.lost.api;

/* loaded from: lost-1.0.1.jar:com/mapzen/android/lost/api/Geofence.class */
public interface Geofence {
    public static final int GEOFENCE_TRANSITION_ENTER = 1;
    public static final int GEOFENCE_TRANSITION_EXIT = 2;
    public static final int GEOFENCE_TRANSITION_DWELL = 4;
    public static final long NEVER_EXPIRE = -1;

    String getRequestId();

    /* loaded from: lost-1.0.1.jar:com/mapzen/android/lost/api/Geofence$Builder.class */
    public static final class Builder {
        public Geofence build() {
            throw new RuntimeException("Sorry, not yet implemented");
        }

        public Builder setCircularRegion(double latitude, double longitude, float radius) {
            throw new RuntimeException("Sorry, not yet implemented");
        }

        public Builder setExpirationDuration(long durationMillis) {
            throw new RuntimeException("Sorry, not yet implemented");
        }

        public Builder setLoiteringDelay(int loiteringDelayMs) {
            throw new RuntimeException("Sorry, not yet implemented");
        }

        public Builder setNotificationResponsiveness(int notificationResponsivenessMs) {
            throw new RuntimeException("Sorry, not yet implemented");
        }

        public Builder setRequestId(String requestId) {
            throw new RuntimeException("Sorry, not yet implemented");
        }

        public Builder setTransitionTypes(int transitionTypes) {
            throw new RuntimeException("Sorry, not yet implemented");
        }
    }
}
