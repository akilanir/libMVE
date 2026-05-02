package org.bson;

import java.util.Map;
import java.util.Set;

/* loaded from: mongo-java-driver-2.12.5.jar:org/bson/BSONObject.class */
public interface BSONObject {
    Object put(String str, Object obj);

    void putAll(BSONObject bSONObject);

    void putAll(Map map);

    Object get(String str);

    Map toMap();

    Object removeField(String str);

    @Deprecated
    boolean containsKey(String str);

    boolean containsField(String str);

    Set<String> keySet();
}
