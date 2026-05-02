package com.mongodb;

import org.bson.util.Assertions;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/WriteConcernError.class */
public class WriteConcernError {
    private final int code;
    private final String message;
    private final DBObject details;

    public WriteConcernError(int code, String message, DBObject details) {
        this.code = code;
        this.message = (String) Assertions.notNull("message", message);
        this.details = (DBObject) Assertions.notNull("details", details);
    }

    public int getCode() {
        return this.code;
    }

    public String getMessage() {
        return this.message;
    }

    public DBObject getDetails() {
        return this.details;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        WriteConcernError that = (WriteConcernError) o;
        if (this.code != that.code || !this.details.equals(that.details) || !this.message.equals(that.message)) {
            return false;
        }
        return true;
    }

    public int hashCode() {
        int result = this.code;
        return (31 * ((31 * result) + this.message.hashCode())) + this.details.hashCode();
    }

    public String toString() {
        return "BulkWriteConcernError{code=" + this.code + ", message='" + this.message + "', details=" + this.details + '}';
    }
}
