package org.bson;

import org.bson.types.ObjectId;

/* loaded from: mongo-java-driver-2.12.5.jar:org/bson/BSONCallback.class */
public interface BSONCallback {
    void objectStart();

    void objectStart(String str);

    void objectStart(boolean z);

    Object objectDone();

    void reset();

    Object get();

    BSONCallback createBSONCallback();

    void arrayStart();

    void arrayStart(String str);

    Object arrayDone();

    void gotNull(String str);

    void gotUndefined(String str);

    void gotMinKey(String str);

    void gotMaxKey(String str);

    void gotBoolean(String str, boolean z);

    void gotDouble(String str, double d);

    void gotInt(String str, int i);

    void gotLong(String str, long j);

    void gotDate(String str, long j);

    void gotString(String str, String str2);

    void gotSymbol(String str, String str2);

    void gotRegex(String str, String str2, String str3);

    void gotTimestamp(String str, int i, int i2);

    void gotObjectId(String str, ObjectId objectId);

    void gotDBRef(String str, String str2, ObjectId objectId);

    @Deprecated
    void gotBinaryArray(String str, byte[] bArr);

    void gotBinary(String str, byte b, byte[] bArr);

    void gotUUID(String str, long j, long j2);

    void gotCode(String str, String str2);

    void gotCodeWScope(String str, String str2, Object obj);
}
