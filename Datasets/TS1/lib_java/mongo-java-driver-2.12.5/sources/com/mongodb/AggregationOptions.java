package com.mongodb;

import java.util.concurrent.TimeUnit;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/AggregationOptions.class */
public class AggregationOptions {
    private final Integer batchSize;
    private final Boolean allowDiskUse;
    private final OutputMode outputMode;
    private final long maxTimeMS;

    /* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/AggregationOptions$OutputMode.class */
    public enum OutputMode {
        INLINE,
        CURSOR
    }

    AggregationOptions(Builder builder) {
        this.batchSize = builder.batchSize;
        this.allowDiskUse = builder.allowDiskUse;
        this.outputMode = builder.outputMode;
        this.maxTimeMS = builder.maxTimeMS;
    }

    public Boolean getAllowDiskUse() {
        return this.allowDiskUse;
    }

    public Integer getBatchSize() {
        return this.batchSize;
    }

    public OutputMode getOutputMode() {
        return this.outputMode;
    }

    public long getMaxTime(TimeUnit timeUnit) {
        return timeUnit.convert(this.maxTimeMS, TimeUnit.MILLISECONDS);
    }

    public String toString() {
        return "AggregationOptions{batchSize=" + this.batchSize + ", allowDiskUse=" + this.allowDiskUse + ", outputMode=" + this.outputMode + ", maxTimeMS=" + this.maxTimeMS + '}';
    }

    public static Builder builder() {
        return new Builder();
    }

    /* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/AggregationOptions$Builder.class */
    public static class Builder {
        private Integer batchSize;
        private Boolean allowDiskUse;
        private OutputMode outputMode;
        private long maxTimeMS;

        private Builder() {
            this.outputMode = OutputMode.INLINE;
        }

        public Builder batchSize(Integer size) {
            this.batchSize = size;
            return this;
        }

        public Builder allowDiskUse(Boolean allowDiskUse) {
            this.allowDiskUse = allowDiskUse;
            return this;
        }

        public Builder outputMode(OutputMode mode) {
            this.outputMode = mode;
            return this;
        }

        public Builder maxTime(long maxTime, TimeUnit timeUnit) {
            this.maxTimeMS = TimeUnit.MILLISECONDS.convert(maxTime, timeUnit);
            return this;
        }

        public AggregationOptions build() {
            return new AggregationOptions(this);
        }
    }
}
