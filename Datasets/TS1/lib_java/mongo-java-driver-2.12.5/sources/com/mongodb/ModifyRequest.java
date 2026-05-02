package com.mongodb;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/ModifyRequest.class */
abstract class ModifyRequest extends WriteRequest {
    private final DBObject query;
    private final boolean upsert;
    private final DBObject updateDocument;

    public ModifyRequest(DBObject query, boolean upsert, DBObject updateDocument) {
        this.query = query;
        this.upsert = upsert;
        this.updateDocument = updateDocument;
    }

    public DBObject getQuery() {
        return this.query;
    }

    public boolean isUpsert() {
        return this.upsert;
    }

    public DBObject getUpdateDocument() {
        return this.updateDocument;
    }

    public boolean isMulti() {
        return false;
    }
}
