package ch.qos.logback.core.util;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/util/FixedDelay.class */
public class FixedDelay implements DelayStrategy {
    private final long subsequentDelay;
    private long nextDelay;

    public FixedDelay(long j, long j2) {
        new String();
        this.nextDelay = j;
        this.subsequentDelay = j2;
    }

    public FixedDelay(int i) {
        this(i, i);
    }

    @Override // ch.qos.logback.core.util.DelayStrategy
    public long nextDelay() {
        long j = this.nextDelay;
        this.nextDelay = this.subsequentDelay;
        return j;
    }
}
