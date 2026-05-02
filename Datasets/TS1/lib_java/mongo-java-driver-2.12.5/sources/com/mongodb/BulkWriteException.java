package com.mongodb;

import java.util.List;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/BulkWriteException.class */
public class BulkWriteException extends MongoException {
    private static final long serialVersionUID = -1505950263354313025L;
    private final BulkWriteResult writeResult;
    private final List<BulkWriteError> writeErrors;
    private final ServerAddress serverAddress;
    private final WriteConcernError writeConcernError;

    BulkWriteException(BulkWriteResult writeResult, List<BulkWriteError> writeErrors, WriteConcernError writeConcernError, ServerAddress serverAddress) {
        super("Bulk write operation error on server " + serverAddress + ". " + (writeErrors.isEmpty() ? "" : "Write errors: " + writeErrors + ". ") + (writeConcernError == null ? "" : "Write concern error: " + writeConcernError + ". "));
        this.writeResult = writeResult;
        this.writeErrors = writeErrors;
        this.writeConcernError = writeConcernError;
        this.serverAddress = serverAddress;
    }

    public BulkWriteResult getWriteResult() {
        return this.writeResult;
    }

    public List<BulkWriteError> getWriteErrors() {
        return this.writeErrors;
    }

    public WriteConcernError getWriteConcernError() {
        return this.writeConcernError;
    }

    public ServerAddress getServerAddress() {
        return this.serverAddress;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        BulkWriteException that = (BulkWriteException) o;
        if (!this.writeErrors.equals(that.writeErrors) || !this.serverAddress.equals(that.serverAddress)) {
            return false;
        }
        if (this.writeConcernError != null) {
            if (!this.writeConcernError.equals(that.writeConcernError)) {
                return false;
            }
        } else if (that.writeConcernError != null) {
            return false;
        }
        if (!this.writeResult.equals(that.writeResult)) {
            return false;
        }
        return true;
    }

    public int hashCode() {
        int result = this.writeResult.hashCode();
        return (31 * ((31 * ((31 * result) + this.writeErrors.hashCode())) + this.serverAddress.hashCode())) + (this.writeConcernError != null ? this.writeConcernError.hashCode() : 0);
    }
}
