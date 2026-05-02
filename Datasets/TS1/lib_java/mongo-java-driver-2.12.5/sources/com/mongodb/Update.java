package com.mongodb;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/Update.class */
class Update {
    private final DBObject updateOperations;
    private final DBObject filter;
    private boolean isUpsert = false;
    private boolean isMulti = false;

    public Update(DBObject filter, DBObject updateOperations) {
        this.filter = filter;
        this.updateOperations = updateOperations;
    }

    DBObject getFilter() {
        return this.filter;
    }

    public DBObject getUpdateOperations() {
        return this.updateOperations;
    }

    public boolean isMulti() {
        return this.isMulti;
    }

    boolean isUpsert() {
        return this.isUpsert;
    }

    public Update multi(boolean isMulti) {
        this.isMulti = isMulti;
        return this;
    }

    public Update upsert(boolean isUpsert) {
        this.isUpsert = isUpsert;
        return this;
    }
}
