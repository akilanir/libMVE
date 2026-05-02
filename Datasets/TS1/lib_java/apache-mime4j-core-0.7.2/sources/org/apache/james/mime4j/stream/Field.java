package org.apache.james.mime4j.stream;

import org.apache.james.mime4j.util.ByteSequence;

/* loaded from: apache-mime4j-core-0.7.2.jar:org/apache/james/mime4j/stream/Field.class */
public interface Field {
    String getName();

    String getBody();

    ByteSequence getRaw();
}
