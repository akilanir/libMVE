package com.mongodb;

import java.nio.ByteOrder;
import java.util.Date;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Pattern;
import org.bson.BSON;
import org.bson.types.BSONTimestamp;
import org.bson.types.Code;
import org.bson.types.CodeWScope;
import org.bson.types.ObjectId;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/Bytes.class */
public class Bytes extends BSON {
    static final Logger LOGGER = Logger.getLogger("com.mongodb");
    static final boolean D = Boolean.getBoolean("DEBUG.MONGO");
    public static final ByteOrder ORDER;
    static final int MAX_OBJECT_SIZE = 4194304;
    static final int BATCH_INSERT_SIZE = 8388608;
    static final int CONNECTIONS_PER_HOST;
    public static final int QUERYOPTION_TAILABLE = 2;
    public static final int QUERYOPTION_SLAVEOK = 4;
    public static final int QUERYOPTION_OPLOGREPLAY = 8;
    public static final int QUERYOPTION_NOTIMEOUT = 16;
    public static final int QUERYOPTION_AWAITDATA = 32;
    public static final int QUERYOPTION_EXHAUST = 64;
    public static final int QUERYOPTION_PARTIAL = 128;
    public static final int RESULTFLAG_CURSORNOTFOUND = 1;
    public static final int RESULTFLAG_ERRSET = 2;
    public static final int RESULTFLAG_SHARDCONFIGSTALE = 4;
    public static final int RESULTFLAG_AWAITCAPABLE = 8;
    static final ObjectId COLLECTION_REF_ID;

    static {
        if (LOGGER.getLevel() == null) {
            if (D) {
                LOGGER.setLevel(Level.ALL);
            } else {
                LOGGER.setLevel(Level.WARNING);
            }
        }
        ORDER = ByteOrder.LITTLE_ENDIAN;
        CONNECTIONS_PER_HOST = Integer.parseInt(System.getProperty("MONGO.POOLSIZE", "10"));
        COLLECTION_REF_ID = new ObjectId(-1, -1, -1);
    }

    /* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/Bytes$OptionHolder.class */
    static class OptionHolder {
        final OptionHolder _parent;
        int _options = 0;
        boolean _hasOptions = false;

        OptionHolder(OptionHolder parent) {
            this._parent = parent;
        }

        void set(int options) {
            this._options = options;
            this._hasOptions = true;
        }

        int get() {
            if (this._hasOptions) {
                return this._options;
            }
            if (this._parent == null) {
                return 0;
            }
            return this._parent.get();
        }

        void add(int option) {
            set(get() | option);
        }

        void reset() {
            this._hasOptions = false;
        }
    }

    public static byte getType(Object o) {
        if (o == null) {
            return (byte) 10;
        }
        if (o instanceof DBPointer) {
            return (byte) 12;
        }
        if ((o instanceof Integer) || (o instanceof Short) || (o instanceof Byte) || (o instanceof AtomicInteger)) {
            return (byte) 16;
        }
        if ((o instanceof Long) || (o instanceof AtomicLong)) {
            return (byte) 18;
        }
        if (o instanceof Number) {
            return (byte) 1;
        }
        if (o instanceof String) {
            return (byte) 2;
        }
        if (o instanceof List) {
            return (byte) 4;
        }
        if (o instanceof byte[]) {
            return (byte) 5;
        }
        if (o instanceof ObjectId) {
            return (byte) 7;
        }
        if (o instanceof Boolean) {
            return (byte) 8;
        }
        if (o instanceof Date) {
            return (byte) 9;
        }
        if (o instanceof BSONTimestamp) {
            return (byte) 17;
        }
        if (o instanceof Pattern) {
            return (byte) 11;
        }
        if ((o instanceof DBObject) || (o instanceof DBRefBase)) {
            return (byte) 3;
        }
        if (o instanceof Code) {
            return (byte) 13;
        }
        if (o instanceof CodeWScope) {
            return (byte) 15;
        }
        return (byte) -1;
    }
}
