package org.apache.http.pool;

import org.apache.http.annotation.Immutable;

@Immutable
/* loaded from: httpcore-4.2.1.jar:org/apache/http/pool/PoolStats.class */
public class PoolStats {
    private final int leased;
    private final int pending;
    private final int available;
    private final int max;

    public PoolStats(int leased, int pending, int free, int max) {
        this.leased = leased;
        this.pending = pending;
        this.available = free;
        this.max = max;
    }

    public int getLeased() {
        return this.leased;
    }

    public int getPending() {
        return this.pending;
    }

    public int getAvailable() {
        return this.available;
    }

    public int getMax() {
        return this.max;
    }

    public String toString() {
        return "[leased: " + this.leased + "; pending: " + this.pending + "; available: " + this.available + "; max: " + this.max + "]";
    }
}
