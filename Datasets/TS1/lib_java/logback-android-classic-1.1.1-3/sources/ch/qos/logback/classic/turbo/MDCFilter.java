package ch.qos.logback.classic.turbo;

import ch.qos.logback.classic.Level;
import ch.qos.logback.classic.Logger;
import ch.qos.logback.core.spi.FilterReply;
import org.slf4j.MDC;
import org.slf4j.Marker;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/turbo/MDCFilter.class */
public class MDCFilter extends MatchingFilter {
    String MDCKey;
    String value;

    @Override // ch.qos.logback.classic.turbo.TurboFilter
    public FilterReply decide(Marker marker, Logger logger, Level level, String str, Object[] objArr, Throwable th) {
        if (this.MDCKey == null) {
            return FilterReply.NEUTRAL;
        }
        return this.value.equals(MDC.get(this.MDCKey)) ? this.onMatch : this.onMismatch;
    }

    public void setValue(String str) {
        this.value = str;
    }

    public void setMDCKey(String str) {
        this.MDCKey = str;
    }
}
