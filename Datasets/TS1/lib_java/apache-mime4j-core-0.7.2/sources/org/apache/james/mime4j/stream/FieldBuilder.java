package org.apache.james.mime4j.stream;

import org.apache.james.mime4j.MimeException;
import org.apache.james.mime4j.util.ByteArrayBuffer;

/* loaded from: apache-mime4j-core-0.7.2.jar:org/apache/james/mime4j/stream/FieldBuilder.class */
public interface FieldBuilder {
    void reset();

    void append(ByteArrayBuffer byteArrayBuffer) throws MimeException;

    RawField build() throws MimeException;

    ByteArrayBuffer getRaw();
}
