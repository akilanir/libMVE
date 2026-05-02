package ch.qos.logback.classic.turbo;

import ch.qos.logback.classic.Level;
import ch.qos.logback.classic.Logger;
import ch.qos.logback.core.spi.FilterReply;
import org.slf4j.Marker;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/turbo/DuplicateMessageFilter.class */
public class DuplicateMessageFilter extends TurboFilter {
    public static final int DEFAULT_CACHE_SIZE = 100;
    public static final int DEFAULT_ALLOWED_REPETITIONS = 5;
    public int allowedRepetitions = 5;
    public int cacheSize = 100;
    private LRUMessageCache msgCache;

    @Override // ch.qos.logback.classic.turbo.TurboFilter
    public void start() {
        this.msgCache = new LRUMessageCache(this.cacheSize);
        super.start();
    }

    @Override // ch.qos.logback.classic.turbo.TurboFilter
    public void stop() {
        this.msgCache.clear();
        this.msgCache = null;
        super.stop();
    }

    @Override // ch.qos.logback.classic.turbo.TurboFilter
    public FilterReply decide(Marker marker, Logger logger, Level level, String str, Object[] objArr, Throwable th) {
        return this.msgCache.getMessageCountAndThenIncrement(str) <= this.allowedRepetitions ? FilterReply.NEUTRAL : FilterReply.DENY;
    }

    public int getAllowedRepetitions() {
        return this.allowedRepetitions;
    }

    public void setAllowedRepetitions(int i) {
        this.allowedRepetitions = i;
    }

    public int getCacheSize() {
        return this.cacheSize;
    }

    public void setCacheSize(int i) {
        this.cacheSize = i;
    }
}
