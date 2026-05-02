package ch.qos.logback.core.recovery;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/recovery/RecoveryCoordinator.class */
public class RecoveryCoordinator {
    public static final long BACKOFF_COEFFICIENT_MIN = 20;
    private long backOffCoefficient = 20;
    private long currentTime = UNSET;
    long next = System.currentTimeMillis() + getBackoffCoefficient();
    static long BACKOFF_COEFFICIENT_MAX = 327680;
    private static long UNSET = -1;

    public boolean isTooSoon() {
        long currentTime = getCurrentTime();
        if (currentTime <= this.next) {
            return true;
        }
        this.next = currentTime + getBackoffCoefficient();
        return false;
    }

    void setCurrentTime(long j) {
        this.currentTime = j;
    }

    private long getCurrentTime() {
        return this.currentTime != UNSET ? this.currentTime : System.currentTimeMillis();
    }

    private long getBackoffCoefficient() {
        long j = this.backOffCoefficient;
        if (this.backOffCoefficient < BACKOFF_COEFFICIENT_MAX) {
            this.backOffCoefficient *= 4;
        }
        return j;
    }
}
