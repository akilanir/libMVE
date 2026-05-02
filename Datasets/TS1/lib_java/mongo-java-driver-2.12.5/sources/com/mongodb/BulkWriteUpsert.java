package com.mongodb;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/BulkWriteUpsert.class */
public class BulkWriteUpsert {
    private final int index;
    private final Object id;

    public BulkWriteUpsert(int index, Object id) {
        this.index = index;
        this.id = id;
    }

    public int getIndex() {
        return this.index;
    }

    public Object getId() {
        return this.id;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        BulkWriteUpsert that = (BulkWriteUpsert) o;
        if (this.index != that.index || !this.id.equals(that.id)) {
            return false;
        }
        return true;
    }

    public int hashCode() {
        int result = this.index;
        return (31 * result) + this.id.hashCode();
    }

    public String toString() {
        return "BulkWriteUpsert{index=" + this.index + ", id=" + this.id + '}';
    }
}
