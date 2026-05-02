package com.mongodb;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/BulkWriteRequestBuilder.class */
public class BulkWriteRequestBuilder {
    private final BulkWriteOperation bulkWriteOperation;
    private final DBObject query;

    BulkWriteRequestBuilder(BulkWriteOperation bulkWriteOperation, DBObject query) {
        this.bulkWriteOperation = bulkWriteOperation;
        this.query = query;
    }

    public void remove() {
        this.bulkWriteOperation.addRequest(new RemoveRequest(this.query, true));
    }

    public void removeOne() {
        this.bulkWriteOperation.addRequest(new RemoveRequest(this.query, false));
    }

    public void replaceOne(DBObject document) {
        new BulkUpdateRequestBuilder(this.bulkWriteOperation, this.query, false).replaceOne(document);
    }

    public void update(DBObject update) {
        new BulkUpdateRequestBuilder(this.bulkWriteOperation, this.query, false).update(update);
    }

    public void updateOne(DBObject update) {
        new BulkUpdateRequestBuilder(this.bulkWriteOperation, this.query, false).updateOne(update);
    }

    public BulkUpdateRequestBuilder upsert() {
        return new BulkUpdateRequestBuilder(this.bulkWriteOperation, this.query, true);
    }
}
