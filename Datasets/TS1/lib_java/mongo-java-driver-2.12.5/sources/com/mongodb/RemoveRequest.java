package com.mongodb;

import com.mongodb.WriteRequest;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/RemoveRequest.class */
class RemoveRequest extends WriteRequest {
    private final DBObject query;
    private final boolean multi;

    public RemoveRequest(DBObject query, boolean multi) {
        this.query = query;
        this.multi = multi;
    }

    public DBObject getQuery() {
        return this.query;
    }

    public boolean isMulti() {
        return this.multi;
    }

    @Override // com.mongodb.WriteRequest
    public WriteRequest.Type getType() {
        return WriteRequest.Type.REMOVE;
    }
}
