package com.mongodb;

import com.mongodb.WriteRequest;
import java.util.Collections;
import java.util.List;
import org.bson.util.Assertions;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/AcknowledgedBulkWriteResult.class */
class AcknowledgedBulkWriteResult extends BulkWriteResult {
    private int insertedCount;
    private int matchedCount;
    private int removedCount;
    private Integer modifiedCount;
    private final List<BulkWriteUpsert> upserts;

    AcknowledgedBulkWriteResult(int insertedCount, int matchedCount, int removedCount, Integer modifiedCount, List<BulkWriteUpsert> upserts) {
        this.insertedCount = insertedCount;
        this.matchedCount = matchedCount;
        this.removedCount = removedCount;
        this.modifiedCount = modifiedCount;
        this.upserts = Collections.unmodifiableList((List) Assertions.notNull("upserts", upserts));
    }

    AcknowledgedBulkWriteResult(WriteRequest.Type type, int count, List<BulkWriteUpsert> upserts) {
        this(type, count, 0, upserts);
    }

    AcknowledgedBulkWriteResult(WriteRequest.Type type, int count, Integer modifiedCount, List<BulkWriteUpsert> upserts) {
        this(type == WriteRequest.Type.INSERT ? count : 0, (type == WriteRequest.Type.UPDATE || type == WriteRequest.Type.REPLACE) ? count : 0, type == WriteRequest.Type.REMOVE ? count : 0, modifiedCount, upserts);
    }

    @Override // com.mongodb.BulkWriteResult
    public boolean isAcknowledged() {
        return true;
    }

    @Override // com.mongodb.BulkWriteResult
    public int getInsertedCount() {
        return this.insertedCount;
    }

    @Override // com.mongodb.BulkWriteResult
    public int getMatchedCount() {
        return this.matchedCount;
    }

    @Override // com.mongodb.BulkWriteResult
    public int getRemovedCount() {
        return this.removedCount;
    }

    @Override // com.mongodb.BulkWriteResult
    public boolean isModifiedCountAvailable() {
        return this.modifiedCount != null;
    }

    @Override // com.mongodb.BulkWriteResult
    public int getModifiedCount() {
        if (this.modifiedCount == null) {
            throw new UnsupportedOperationException("The modifiedCount is not available because at least one of the servers that was updated was not able to provide this information (the server is must be at least version 2.6");
        }
        return this.modifiedCount.intValue();
    }

    @Override // com.mongodb.BulkWriteResult
    public List<BulkWriteUpsert> getUpserts() {
        return this.upserts;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        AcknowledgedBulkWriteResult that = (AcknowledgedBulkWriteResult) o;
        if (this.insertedCount != that.insertedCount || this.matchedCount != that.matchedCount || this.removedCount != that.removedCount) {
            return false;
        }
        if (this.modifiedCount != null) {
            if (!this.modifiedCount.equals(that.modifiedCount)) {
                return false;
            }
        } else if (that.modifiedCount != null) {
            return false;
        }
        if (!this.upserts.equals(that.upserts)) {
            return false;
        }
        return true;
    }

    public int hashCode() {
        int result = this.insertedCount;
        return (31 * ((31 * ((31 * ((31 * result) + this.matchedCount)) + this.removedCount)) + (this.modifiedCount != null ? this.modifiedCount.hashCode() : 0))) + this.upserts.hashCode();
    }

    public String toString() {
        return "AcknowledgedBulkWriteResult{insertedCount=" + this.insertedCount + ", matchedCount=" + this.matchedCount + ", removedCount=" + this.removedCount + ", modifiedCount=" + this.modifiedCount + ", upserts=" + this.upserts + '}';
    }
}
