package com.mongodb;

import com.mongodb.MongoException;
import java.util.Iterator;
import java.util.List;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/CommandResult.class */
public class CommandResult extends BasicDBObject {
    private final ServerAddress _host;
    private static final long serialVersionUID = 1;

    CommandResult(ServerAddress serverAddress) {
        if (serverAddress == null) {
            throw new IllegalArgumentException("server address is null");
        }
        this._host = serverAddress;
        put("serverUsed", (Object) serverAddress.toString());
    }

    public boolean ok() {
        Object okValue = get("ok");
        if (okValue instanceof Boolean) {
            return ((Boolean) okValue).booleanValue();
        }
        return (okValue instanceof Number) && ((Number) okValue).intValue() == 1;
    }

    public String getErrorMessage() {
        Object errorMessage = get("errmsg");
        if (errorMessage == null) {
            return null;
        }
        return errorMessage.toString();
    }

    public MongoException getException() {
        if (!ok()) {
            if (getCode() == 50) {
                return new MongoExecutionTimeoutException(getCode(), getErrorMessage());
            }
            return new CommandFailureException(this);
        }
        if (hasErr()) {
            return getWriteException();
        }
        return null;
    }

    private MongoException getWriteException() {
        int code = getCode();
        if (code == 11000 || code == 11001 || code == 12582) {
            return new MongoException.DuplicateKey(this);
        }
        return new WriteConcernException(this);
    }

    int getCode() {
        int code = getInt("code", -1);
        if (code == -1 && get("errObjects") != null) {
            Iterator i$ = ((List) get("errObjects")).iterator();
            while (true) {
                if (!i$.hasNext()) {
                    break;
                }
                BasicDBObject curErrorDocument = (BasicDBObject) i$.next();
                if (get("err").equals(curErrorDocument.get("err"))) {
                    code = curErrorDocument.getInt("code", -1);
                    break;
                }
            }
        }
        return code;
    }

    boolean hasErr() {
        String err = getString("err");
        return err != null && err.length() > 0;
    }

    public void throwOnError() {
        if (!ok() || hasErr()) {
            throw getException();
        }
    }

    public ServerAddress getServerUsed() {
        return this._host;
    }
}
