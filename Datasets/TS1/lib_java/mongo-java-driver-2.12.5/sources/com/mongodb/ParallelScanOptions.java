package com.mongodb;

import org.bson.util.Assertions;
import org.bson.util.annotations.Immutable;

@Immutable
/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/ParallelScanOptions.class */
public class ParallelScanOptions {
    private final int numCursors;
    private final int batchSize;
    private final ReadPreference readPreference;

    public static Builder builder() {
        return new Builder();
    }

    /* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/ParallelScanOptions$Builder.class */
    public static class Builder {
        private int numCursors;
        private int batchSize;
        private ReadPreference readPreference;

        public Builder numCursors(int numCursors) {
            Assertions.isTrue("numCursors >= 1", numCursors >= 1);
            Assertions.isTrue("numCursors <= 10000", numCursors <= 10000);
            this.numCursors = numCursors;
            return this;
        }

        public Builder batchSize(int batchSize) {
            Assertions.isTrue("batchSize >= 0", batchSize >= 0);
            this.batchSize = batchSize;
            return this;
        }

        public Builder readPreference(ReadPreference readPreference) {
            this.readPreference = (ReadPreference) Assertions.notNull("readPreference", readPreference);
            return this;
        }

        public ParallelScanOptions build() {
            return new ParallelScanOptions(this);
        }
    }

    public int getNumCursors() {
        return this.numCursors;
    }

    public int getBatchSize() {
        return this.batchSize;
    }

    public ReadPreference getReadPreference() {
        return this.readPreference;
    }

    private ParallelScanOptions(Builder builder) {
        this.numCursors = builder.numCursors;
        this.batchSize = builder.batchSize;
        this.readPreference = builder.readPreference;
    }
}
