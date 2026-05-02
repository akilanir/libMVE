package com.mongodb;

import java.util.List;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/UnacknowledgedBulkWriteResult.class */
class UnacknowledgedBulkWriteResult extends BulkWriteResult {
    UnacknowledgedBulkWriteResult() {
    }

    @Override // com.mongodb.BulkWriteResult
    public boolean isAcknowledged() {
        return false;
    }

    @Override // com.mongodb.BulkWriteResult
    public int getInsertedCount() {
        throw getUnacknowledgedWriteException();
    }

    @Override // com.mongodb.BulkWriteResult
    public int getMatchedCount() {
        throw getUnacknowledgedWriteException();
    }

    @Override // com.mongodb.BulkWriteResult
    public int getRemovedCount() {
        throw getUnacknowledgedWriteException();
    }

    @Override // com.mongodb.BulkWriteResult
    public boolean isModifiedCountAvailable() {
        throw getUnacknowledgedWriteException();
    }

    @Override // com.mongodb.BulkWriteResult
    public int getModifiedCount() {
        throw getUnacknowledgedWriteException();
    }

    @Override // com.mongodb.BulkWriteResult
    public List<BulkWriteUpsert> getUpserts() {
        throw getUnacknowledgedWriteException();
    }

    private UnacknowledgedWriteException getUnacknowledgedWriteException() {
        return new UnacknowledgedWriteException("Can not get information about an unacknowledged write");
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        return true;
    }

    public int hashCode() {
        return 0;
    }

    public String toString() {
        return "UnacknowledgedBulkWriteResult{}";
    }
}
