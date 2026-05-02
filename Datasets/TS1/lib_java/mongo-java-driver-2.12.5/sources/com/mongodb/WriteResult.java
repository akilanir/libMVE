package com.mongodb;

import com.mongodb.MongoException;
import java.io.IOException;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/WriteResult.class */
public class WriteResult {
    private long _lastCall;
    private WriteConcern _lastConcern;
    private CommandResult _lastErrorResult;
    private final DB _db;
    private final DBPort _port;
    private final boolean _lazy;

    WriteResult(CommandResult o, WriteConcern concern) {
        this._lastErrorResult = o;
        this._lastConcern = concern;
        this._lazy = false;
        this._port = null;
        this._db = null;
    }

    WriteResult(DB db, DBPort p, WriteConcern concern) {
        this._db = db;
        this._port = p;
        this._lastCall = p.getUsageCount();
        this._lastConcern = concern;
        this._lazy = true;
    }

    @Deprecated
    public CommandResult getCachedLastError() {
        return this._lastErrorResult;
    }

    public WriteConcern getLastConcern() {
        return this._lastConcern;
    }

    @Deprecated
    public synchronized CommandResult getLastError() {
        return getLastError(null);
    }

    @Deprecated
    public synchronized CommandResult getLastError(WriteConcern concern) {
        if (this._lastErrorResult != null && (concern == null || (this._lastConcern != null && this._lastConcern.getW() >= concern.getW()))) {
            return this._lastErrorResult;
        }
        if (this._port != null) {
            try {
                this._lastErrorResult = this._port.tryGetLastError(this._db, this._lastCall, concern == null ? new WriteConcern() : concern);
                if (this._lastErrorResult == null) {
                    throw new IllegalStateException("The connection may have been used since this write, cannot obtain a result");
                }
                this._lastConcern = concern;
                this._lastCall++;
                return this._lastErrorResult;
            } catch (IOException ioe) {
                throw new MongoException.Network(ioe.getMessage(), ioe);
            }
        }
        throw new IllegalStateException("Don't have a port to obtain a write result, and existing one is not good enough.");
    }

    @Deprecated
    public String getError() {
        Object foo = getField("err");
        if (foo == null) {
            return null;
        }
        return foo.toString();
    }

    public int getN() {
        return getLastError().getInt("n");
    }

    public Object getUpsertedId() {
        return getLastError().get("upserted");
    }

    public boolean isUpdateOfExisting() {
        return getLastError().getBoolean("updatedExisting");
    }

    @Deprecated
    public Object getField(String name) {
        return getLastError().get(name);
    }

    @Deprecated
    public boolean isLazy() {
        return this._lazy;
    }

    public String toString() {
        CommandResult res = getCachedLastError();
        if (res != null) {
            return res.toString();
        }
        return "N/A";
    }
}
