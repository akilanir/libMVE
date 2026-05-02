package org.apache.james.mime4j.util;

/* loaded from: apache-mime4j-core-0.7.2.jar:org/apache/james/mime4j/util/ByteSequence.class */
public interface ByteSequence {
    public static final ByteSequence EMPTY = new EmptyByteSequence();

    int length();

    byte byteAt(int i);

    byte[] toByteArray();
}
