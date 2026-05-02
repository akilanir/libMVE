package com.google.common.util.concurrent;

import com.google.common.annotations.Beta;
import com.google.common.annotations.VisibleForTesting;
import com.google.common.base.Preconditions;
import com.google.common.base.Ticker;
import java.util.concurrent.TimeUnit;
import javax.annotation.concurrent.ThreadSafe;

@ThreadSafe
@Beta
/* loaded from: guava-15.0.jar:com/google/common/util/concurrent/RateLimiter.class */
public abstract class RateLimiter {
    private final SleepingTicker ticker;
    private final long offsetNanos;
    double storedPermits;
    double maxPermits;
    volatile double stableIntervalMicros;
    private final Object mutex;
    private long nextFreeTicketMicros;

    abstract void doSetRate(double d, double d2);

    abstract long storedPermitsToWaitTime(double d, double d2);

    public static RateLimiter create(double permitsPerSecond) {
        return create(SleepingTicker.SYSTEM_TICKER, permitsPerSecond);
    }

    @VisibleForTesting
    static RateLimiter create(SleepingTicker ticker, double permitsPerSecond) {
        RateLimiter rateLimiter = new Bursty(ticker, 1.0d);
        rateLimiter.setRate(permitsPerSecond);
        return rateLimiter;
    }

    public static RateLimiter create(double permitsPerSecond, long warmupPeriod, TimeUnit unit) {
        return create(SleepingTicker.SYSTEM_TICKER, permitsPerSecond, warmupPeriod, unit);
    }

    @VisibleForTesting
    static RateLimiter create(SleepingTicker ticker, double permitsPerSecond, long warmupPeriod, TimeUnit unit) {
        RateLimiter rateLimiter = new WarmingUp(ticker, warmupPeriod, unit);
        rateLimiter.setRate(permitsPerSecond);
        return rateLimiter;
    }

    @VisibleForTesting
    static RateLimiter createWithCapacity(SleepingTicker ticker, double permitsPerSecond, long maxBurstBuildup, TimeUnit unit) {
        double maxBurstSeconds = unit.toNanos(maxBurstBuildup) / 1.0E9d;
        Bursty rateLimiter = new Bursty(ticker, maxBurstSeconds);
        rateLimiter.setRate(permitsPerSecond);
        return rateLimiter;
    }

    private RateLimiter(SleepingTicker ticker) {
        this.mutex = new Object();
        this.nextFreeTicketMicros = 0L;
        this.ticker = ticker;
        this.offsetNanos = ticker.read();
    }

    public final void setRate(double permitsPerSecond) {
        Preconditions.checkArgument(permitsPerSecond > 0.0d && !Double.isNaN(permitsPerSecond), "rate must be positive");
        synchronized (this.mutex) {
            resync(readSafeMicros());
            double stableIntervalMicros = TimeUnit.SECONDS.toMicros(1L) / permitsPerSecond;
            this.stableIntervalMicros = stableIntervalMicros;
            doSetRate(permitsPerSecond, stableIntervalMicros);
        }
    }

    public final double getRate() {
        return TimeUnit.SECONDS.toMicros(1L) / this.stableIntervalMicros;
    }

    public void acquire() {
        acquire(1);
    }

    public void acquire(int permits) {
        long microsToWait;
        checkPermits(permits);
        synchronized (this.mutex) {
            microsToWait = reserveNextTicket(permits, readSafeMicros());
        }
        this.ticker.sleepMicrosUninterruptibly(microsToWait);
    }

    public boolean tryAcquire(long timeout, TimeUnit unit) {
        return tryAcquire(1, timeout, unit);
    }

    public boolean tryAcquire(int permits) {
        return tryAcquire(permits, 0L, TimeUnit.MICROSECONDS);
    }

    public boolean tryAcquire() {
        return tryAcquire(1, 0L, TimeUnit.MICROSECONDS);
    }

    public boolean tryAcquire(int permits, long timeout, TimeUnit unit) {
        long timeoutMicros = unit.toMicros(timeout);
        checkPermits(permits);
        synchronized (this.mutex) {
            long nowMicros = readSafeMicros();
            if (this.nextFreeTicketMicros > nowMicros + timeoutMicros) {
                return false;
            }
            long microsToWait = reserveNextTicket(permits, nowMicros);
            this.ticker.sleepMicrosUninterruptibly(microsToWait);
            return true;
        }
    }

    private static void checkPermits(int permits) {
        Preconditions.checkArgument(permits > 0, "Requested permits must be positive");
    }

    private long reserveNextTicket(double requiredPermits, long nowMicros) {
        resync(nowMicros);
        long microsToNextFreeTicket = this.nextFreeTicketMicros - nowMicros;
        double storedPermitsToSpend = Math.min(requiredPermits, this.storedPermits);
        double freshPermits = requiredPermits - storedPermitsToSpend;
        long waitMicros = storedPermitsToWaitTime(this.storedPermits, storedPermitsToSpend) + ((long) (freshPermits * this.stableIntervalMicros));
        this.nextFreeTicketMicros += waitMicros;
        this.storedPermits -= storedPermitsToSpend;
        return microsToNextFreeTicket;
    }

    private void resync(long nowMicros) {
        if (nowMicros > this.nextFreeTicketMicros) {
            this.storedPermits = Math.min(this.maxPermits, this.storedPermits + ((nowMicros - this.nextFreeTicketMicros) / this.stableIntervalMicros));
            this.nextFreeTicketMicros = nowMicros;
        }
    }

    private long readSafeMicros() {
        return TimeUnit.NANOSECONDS.toMicros(this.ticker.read() - this.offsetNanos);
    }

    public String toString() {
        return String.format("RateLimiter[stableRate=%3.1fqps]", Double.valueOf(1000000.0d / this.stableIntervalMicros));
    }

    /* loaded from: guava-15.0.jar:com/google/common/util/concurrent/RateLimiter$WarmingUp.class */
    private static class WarmingUp extends RateLimiter {
        final long warmupPeriodMicros;
        private double slope;
        private double halfPermits;

        WarmingUp(SleepingTicker ticker, long warmupPeriod, TimeUnit timeUnit) {
            super(ticker);
            this.warmupPeriodMicros = timeUnit.toMicros(warmupPeriod);
        }

        @Override // com.google.common.util.concurrent.RateLimiter
        void doSetRate(double permitsPerSecond, double stableIntervalMicros) {
            double oldMaxPermits = this.maxPermits;
            this.maxPermits = this.warmupPeriodMicros / stableIntervalMicros;
            this.halfPermits = this.maxPermits / 2.0d;
            double coldIntervalMicros = stableIntervalMicros * 3.0d;
            this.slope = (coldIntervalMicros - stableIntervalMicros) / this.halfPermits;
            if (oldMaxPermits == Double.POSITIVE_INFINITY) {
                this.storedPermits = 0.0d;
            } else {
                this.storedPermits = oldMaxPermits == 0.0d ? this.maxPermits : (this.storedPermits * this.maxPermits) / oldMaxPermits;
            }
        }

        @Override // com.google.common.util.concurrent.RateLimiter
        long storedPermitsToWaitTime(double storedPermits, double permitsToTake) {
            double availablePermitsAboveHalf = storedPermits - this.halfPermits;
            long micros = 0;
            if (availablePermitsAboveHalf > 0.0d) {
                double permitsAboveHalfToTake = Math.min(availablePermitsAboveHalf, permitsToTake);
                micros = (long) ((permitsAboveHalfToTake * (permitsToTime(availablePermitsAboveHalf) + permitsToTime(availablePermitsAboveHalf - permitsAboveHalfToTake))) / 2.0d);
                permitsToTake -= permitsAboveHalfToTake;
            }
            return (long) (micros + (this.stableIntervalMicros * permitsToTake));
        }

        private double permitsToTime(double permits) {
            return this.stableIntervalMicros + (permits * this.slope);
        }
    }

    /* loaded from: guava-15.0.jar:com/google/common/util/concurrent/RateLimiter$Bursty.class */
    private static class Bursty extends RateLimiter {
        final double maxBurstSeconds;

        Bursty(SleepingTicker ticker, double maxBurstSeconds) {
            super(ticker);
            this.maxBurstSeconds = maxBurstSeconds;
        }

        @Override // com.google.common.util.concurrent.RateLimiter
        void doSetRate(double permitsPerSecond, double stableIntervalMicros) {
            double oldMaxPermits = this.maxPermits;
            this.maxPermits = this.maxBurstSeconds * permitsPerSecond;
            this.storedPermits = oldMaxPermits == 0.0d ? 0.0d : (this.storedPermits * this.maxPermits) / oldMaxPermits;
        }

        @Override // com.google.common.util.concurrent.RateLimiter
        long storedPermitsToWaitTime(double storedPermits, double permitsToTake) {
            return 0L;
        }
    }

    @VisibleForTesting
    /* loaded from: guava-15.0.jar:com/google/common/util/concurrent/RateLimiter$SleepingTicker.class */
    static abstract class SleepingTicker extends Ticker {
        static final SleepingTicker SYSTEM_TICKER = new SleepingTicker() { // from class: com.google.common.util.concurrent.RateLimiter.SleepingTicker.1
            @Override // com.google.common.base.Ticker
            public long read() {
                return systemTicker().read();
            }

            @Override // com.google.common.util.concurrent.RateLimiter.SleepingTicker
            public void sleepMicrosUninterruptibly(long micros) {
                if (micros > 0) {
                    Uninterruptibles.sleepUninterruptibly(micros, TimeUnit.MICROSECONDS);
                }
            }
        };

        abstract void sleepMicrosUninterruptibly(long j);

        SleepingTicker() {
        }
    }
}
