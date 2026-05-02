package org.joda.time.chrono;

import org.joda.time.DateTimeZone;
import org.joda.time.Instant;

/* loaded from: joda-time-2.9.1.jar:org/joda/time/chrono/GJCacheKey.class */
class GJCacheKey {
    private final DateTimeZone zone;
    private final Instant cutoverInstant;
    private final int minDaysInFirstWeek;

    GJCacheKey(DateTimeZone dateTimeZone, Instant instant, int i) {
        this.zone = dateTimeZone;
        this.cutoverInstant = instant;
        this.minDaysInFirstWeek = i;
    }

    public int hashCode() {
        return (31 * ((31 * ((31 * 1) + (this.cutoverInstant == null ? 0 : this.cutoverInstant.hashCode()))) + this.minDaysInFirstWeek)) + (this.zone == null ? 0 : this.zone.hashCode());
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !(obj instanceof GJCacheKey)) {
            return false;
        }
        GJCacheKey gJCacheKey = (GJCacheKey) obj;
        if (this.cutoverInstant == null) {
            if (gJCacheKey.cutoverInstant != null) {
                return false;
            }
        } else if (!this.cutoverInstant.equals(gJCacheKey.cutoverInstant)) {
            return false;
        }
        if (this.minDaysInFirstWeek != gJCacheKey.minDaysInFirstWeek) {
            return false;
        }
        if (this.zone == null) {
            if (gJCacheKey.zone != null) {
                return false;
            }
            return true;
        }
        if (!this.zone.equals(gJCacheKey.zone)) {
            return false;
        }
        return true;
    }
}
