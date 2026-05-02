package com.mongodb;

import com.mongodb.WriteRequest;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/InsertRequest.class */
class InsertRequest extends WriteRequest {
    private final DBObject document;

    public InsertRequest(DBObject document) {
        this.document = document;
    }

    public DBObject getDocument() {
        return this.document;
    }

    @Override // com.mongodb.WriteRequest
    public WriteRequest.Type getType() {
        return WriteRequest.Type.INSERT;
    }
}
