package org.apache.james.mime4j.stream;

import java.util.ArrayList;
import java.util.List;

/* loaded from: apache-mime4j-core-0.7.2.jar:org/apache/james/mime4j/stream/RawBody.class */
public final class RawBody {
    private final String value;
    private final List<NameValuePair> params;

    RawBody(String value, List<NameValuePair> params) {
        if (value == null) {
            throw new IllegalArgumentException("Field value not be null");
        }
        this.value = value;
        this.params = params != null ? params : new ArrayList<>();
    }

    public String getValue() {
        return this.value;
    }

    public List<NameValuePair> getParams() {
        return new ArrayList(this.params);
    }

    public String toString() {
        StringBuilder buf = new StringBuilder();
        buf.append(this.value);
        buf.append("; ");
        for (NameValuePair param : this.params) {
            buf.append("; ");
            buf.append(param);
        }
        return buf.toString();
    }
}
