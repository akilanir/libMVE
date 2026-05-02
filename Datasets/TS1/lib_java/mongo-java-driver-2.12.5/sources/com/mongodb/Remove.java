package com.mongodb;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/Remove.class */
class Remove {
    private final DBObject filter;
    private boolean isMulti = true;

    public Remove(DBObject filter) {
        this.filter = filter;
    }

    public DBObject getFilter() {
        return this.filter;
    }

    public Remove multi(boolean isMulti) {
        this.isMulti = isMulti;
        return this;
    }

    public boolean isMulti() {
        return this.isMulti;
    }
}
