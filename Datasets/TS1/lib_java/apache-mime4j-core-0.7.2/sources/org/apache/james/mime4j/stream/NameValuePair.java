package org.apache.james.mime4j.stream;

import org.apache.james.mime4j.util.LangUtils;

/* loaded from: apache-mime4j-core-0.7.2.jar:org/apache/james/mime4j/stream/NameValuePair.class */
public final class NameValuePair {
    private final String name;
    private final String value;

    public NameValuePair(String name, String value) {
        if (name == null) {
            throw new IllegalArgumentException("Name may not be null");
        }
        this.name = name;
        this.value = value;
    }

    public String getName() {
        return this.name;
    }

    public String getValue() {
        return this.value;
    }

    public String toString() {
        if (this.value == null) {
            return this.name;
        }
        return this.name + "=\"" + this.value + "\"";
    }

    public boolean equals(Object object) {
        if (this == object) {
            return true;
        }
        if (object instanceof NameValuePair) {
            NameValuePair that = (NameValuePair) object;
            return this.name.equals(that.name) && LangUtils.equals(this.value, that.value);
        }
        return false;
    }

    public int hashCode() {
        int hash = LangUtils.hashCode(17, this.name);
        return LangUtils.hashCode(hash, this.value);
    }
}
