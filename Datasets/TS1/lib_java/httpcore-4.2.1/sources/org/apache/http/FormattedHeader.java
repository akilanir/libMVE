package org.apache.http;

import org.apache.http.util.CharArrayBuffer;

/* loaded from: httpcore-4.2.1.jar:org/apache/http/FormattedHeader.class */
public interface FormattedHeader extends Header {
    CharArrayBuffer getBuffer();

    int getValuePos();
}
