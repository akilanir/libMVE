package ch.qos.logback.classic.turbo;

import ch.qos.logback.classic.Level;
import ch.qos.logback.classic.Logger;
import ch.qos.logback.core.spi.FilterReply;
import org.slf4j.Marker;
import org.slf4j.MarkerFactory;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/turbo/MarkerFilter.class */
public class MarkerFilter extends MatchingFilter {
    Marker markerToMatch;

    @Override // ch.qos.logback.classic.turbo.TurboFilter
    public void start() {
        if (this.markerToMatch != null) {
            super.start();
        } else {
            addError("The marker property must be set for [" + getName() + "]");
        }
    }

    @Override // ch.qos.logback.classic.turbo.TurboFilter
    public FilterReply decide(Marker marker, Logger logger, Level level, String str, Object[] objArr, Throwable th) {
        if (!isStarted()) {
            return FilterReply.NEUTRAL;
        }
        if (marker != null && marker.contains(this.markerToMatch)) {
            return this.onMatch;
        }
        return this.onMismatch;
    }

    public void setMarker(String str) {
        if (str != null) {
            this.markerToMatch = MarkerFactory.getMarker(str);
        }
    }
}
