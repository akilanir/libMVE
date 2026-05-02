package okio;

import java.io.IOException;
import java.io.InterruptedIOException;
import java.util.concurrent.TimeUnit;

/* loaded from: okio-1.6.0.jar:okio/Timeout.class */
public class Timeout {
    public static final Timeout NONE = new Timeout() { // from class: okio.Timeout.1
        @Override // okio.Timeout
        public Timeout timeout(long timeout, TimeUnit unit) {
            return this;
        }

        @Override // okio.Timeout
        public Timeout deadlineNanoTime(long deadlineNanoTime) {
            return this;
        }

        @Override // okio.Timeout
        public void throwIfReached() throws IOException {
        }
    };
    private boolean hasDeadline;
    private long deadlineNanoTime;
    private long timeoutNanos;

    public Timeout timeout(long timeout, TimeUnit unit) {
        if (timeout < 0) {
            throw new IllegalArgumentException("timeout < 0: " + timeout);
        }
        if (unit == null) {
            throw new IllegalArgumentException("unit == null");
        }
        this.timeoutNanos = unit.toNanos(timeout);
        return this;
    }

    public long timeoutNanos() {
        return this.timeoutNanos;
    }

    public boolean hasDeadline() {
        return this.hasDeadline;
    }

    public long deadlineNanoTime() {
        if (this.hasDeadline) {
            return this.deadlineNanoTime;
        }
        throw new IllegalStateException("No deadline");
    }

    public Timeout deadlineNanoTime(long deadlineNanoTime) {
        this.hasDeadline = true;
        this.deadlineNanoTime = deadlineNanoTime;
        return this;
    }

    public final Timeout deadline(long duration, TimeUnit unit) {
        if (duration <= 0) {
            throw new IllegalArgumentException("duration <= 0: " + duration);
        }
        if (unit == null) {
            throw new IllegalArgumentException("unit == null");
        }
        return deadlineNanoTime(System.nanoTime() + unit.toNanos(duration));
    }

    public Timeout clearTimeout() {
        this.timeoutNanos = 0L;
        return this;
    }

    public Timeout clearDeadline() {
        this.hasDeadline = false;
        return this;
    }

    public void throwIfReached() throws IOException {
        if (Thread.interrupted()) {
            throw new InterruptedIOException("thread interrupted");
        }
        if (this.hasDeadline && this.deadlineNanoTime - System.nanoTime() <= 0) {
            throw new InterruptedIOException("deadline reached");
        }
    }
}
