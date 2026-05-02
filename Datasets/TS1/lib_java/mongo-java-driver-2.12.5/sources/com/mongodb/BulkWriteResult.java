package com.mongodb;

import java.util.List;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/BulkWriteResult.class */
public abstract class BulkWriteResult {
    public abstract boolean isAcknowledged();

    public abstract int getInsertedCount();

    public abstract int getMatchedCount();

    public abstract int getRemovedCount();

    public abstract boolean isModifiedCountAvailable();

    public abstract int getModifiedCount();

    public abstract List<BulkWriteUpsert> getUpserts();
}
