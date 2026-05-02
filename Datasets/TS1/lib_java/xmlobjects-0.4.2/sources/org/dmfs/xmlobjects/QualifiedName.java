package org.dmfs.xmlobjects;

import java.util.HashMap;
import java.util.Map;

/* loaded from: xmlobjects-0.4.2.jar:org/dmfs/xmlobjects/QualifiedName.class */
public final class QualifiedName {
    private static final Map<String, Map<String, QualifiedName>> QUALIFIED_NAME_CACHE = new HashMap(64);
    public final String namespace;
    public final String name;
    private final int mHashCode;

    public static QualifiedName get(String str) {
        return get(null, str);
    }

    public static QualifiedName get(String str, String str2) {
        QualifiedName qualifiedName;
        QualifiedName qualifiedName2;
        if (str != null && str.length() == 0) {
            str = null;
        }
        synchronized (QUALIFIED_NAME_CACHE) {
            Map<String, QualifiedName> map = QUALIFIED_NAME_CACHE.get(str);
            if (map == null) {
                HashMap hashMap = new HashMap();
                qualifiedName = new QualifiedName(str, str2);
                hashMap.put(str2, qualifiedName);
                QUALIFIED_NAME_CACHE.put(str, hashMap);
            } else {
                qualifiedName = map.get(str2);
                if (qualifiedName == null) {
                    qualifiedName = new QualifiedName(str, str2);
                    map.put(str2, qualifiedName);
                }
            }
            qualifiedName2 = qualifiedName;
        }
        return qualifiedName2;
    }

    private QualifiedName(String str, String str2) {
        if (str2 == null) {
            throw new IllegalArgumentException("name part of a qualified name must not be null");
        }
        this.namespace = str;
        this.name = str2;
        this.mHashCode = str == null ? str2.hashCode() : (str.hashCode() * 31) + str2.hashCode();
    }

    public int hashCode() {
        return this.mHashCode;
    }

    public boolean equals(Object obj) {
        return obj == this;
    }

    public String toString() {
        return this.namespace == null ? this.name : this.namespace + ":" + this.name;
    }

    public String toClarkString() {
        return this.namespace == null ? this.name : "{" + this.namespace + "}" + this.name;
    }
}
